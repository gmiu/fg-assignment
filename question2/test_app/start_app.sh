cd /home/ec2-user/test_app

source .venv/bin/activate
source db_config.sh

if [ ! -f "db_pass.sh" ]; then
    source db_pass.sh
fi

python3 app.py
