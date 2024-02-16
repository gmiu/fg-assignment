BASTION_IP=$1
REMOTE_IP=$2
ssh -J ec2-user@$BASTION_IP ec2-user@$REMOTE_IP "mkdir -p /home/ec2-user/test_app"

scp -J ec2-user@$BASTION_IP app.py ec2-user@$REMOTE_IP:/home/ec2-user/test_app/
scp -J ec2-user@$BASTION_IP db_config.sh ec2-user@$REMOTE_IP:/home/ec2-user/test_app/
scp -J ec2-user@$BASTION_IP requirements.txt ec2-user@$REMOTE_IP:/home/ec2-user/test_app/
scp -J ec2-user@$BASTION_IP scp_code.sh ec2-user@$REMOTE_IP:/home/ec2-user/test_app/
scp -J ec2-user@$BASTION_IP setup_env.sh ec2-user@$REMOTE_IP:/home/ec2-user/test_app/
scp -J ec2-user@$BASTION_IP start_app.sh ec2-user@$REMOTE_IP:/home/ec2-user/test_app/
