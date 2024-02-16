BASTION_IP=$1
REMOTE_IP=$2
ssh -J ec2-user@$BASTION_IP ec2-user@$REMOTE_IP "mkdir -p /home/ec2-user/test_app"

scp -J ec2-user@$BASTION_IP app.py ec2-user@$REMOTE_IP:/home/ec2-user/test_app/
