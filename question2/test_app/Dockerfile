FROM --platform=linux/amd64 python:3.12-alpine

COPY requirements.txt /app/requirements.txt
COPY app.py /app/app.py

WORKDIR /app
RUN pip install wheel setuptools pip --upgrade
RUN pip install -r requirements.txt

EXPOSE 8080
CMD ["python", "app.py"]
