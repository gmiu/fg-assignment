import logging
from flask import Flask, request
import mysql.connector
from mysql.connector import Error
import os

logging.basicConfig(filename='app.log', level=logging.INFO,
                    format='%(asctime)s %(levelname)s: %(message)s',
                    datefmt='%Y-%m-%d %H:%M:%S')

app = Flask(__name__)

# Read database configuration from environment variables
db_config = {
    'host': os.environ.get('DB_HOST'),
    'user': os.environ.get('DB_USER'),
    'password': os.environ.get('DB_PASSWORD'),
    'database': os.environ.get('DB_NAME')
}

def insert_message(message):
    try:
        connection = mysql.connector.connect(**db_config)
        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("INSERT INTO messages (message) VALUES (%s)", (message,))
            connection.commit()
            cursor.close()
            connection.close()
            logging.info(f"Inserted message: {message}")
            return 'Message saved to database.'
    except Error as e:
        logging.error(f"Error inserting message into database: {e}")
        return 'Failed to insert message into database.'

def get_messages():
    try:
        connection = mysql.connector.connect(**db_config)
        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("SELECT message FROM messages")
            result = cursor.fetchall()
            cursor.close()
            connection.close()
            logging.info("Fetched messages from database.")
            return result
    except Error as e:
        logging.error(f"Error fetching messages from database: {e}")
        return []

@app.route('/write')
def write_to_db():
    # This is where you'd capture data to write, for this example, we're hardcoding a message.
    message = 'Hello, MySQL!'
    result = insert_message(message)
    return result

@app.route('/write_custom', methods=['POST'])
def write_custom():
    message = request.form['message']
    result = insert_message(message)  # Assuming you have a function like this to insert messages
    return f'Message "{message}" sent to the database!'

@app.route('/read')
def read_from_db():
    messages = get_messages()
    messages_str = '<br>'.join([f"Message read from DB: {msg[0]}" for msg in messages]) # Format messages as HTML
    return messages_str if messages_str else "No messages found."

@app.route('/')
def hello_world():
    return '''
    <!DOCTYPE html>
    <html>
    <head>
        <title>Flask App</title>
    </head>
    <body>
        <h1>Welcome to the Flask App!</h1>
        <p>Click below to read messages from the database:</p>
        <a href="/read">Read Messages</a>
        <p><br>Click below to send a "Hello, World!" message to the database:</p>
        <a href="/write">Send "Hello, World!"</a>
        <p><br>Enter a custom message to send to the database:</p>
        <form action="/write_custom" method="post">
            <input type="text" name="message" />
            <input type="submit" value="Send Custom Message" />
        </form>
    </body>
    </html>
    '''

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
