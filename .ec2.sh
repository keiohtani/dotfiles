#!/bin/zsh

instance_id="i-00c0f94a623f8015b"   
public_ip="ec2-3-17-133-45.us-east-2.compute.amazonaws.com"

if [ $1 = 'run' ]; then
    echo "---instance is starting---"
    aws ec2 start-instances --instance-ids $instance_id
    aws ec2 wait instance-running --instance-ids $instance_id
    echo "---instance running---"
    public_ip=$(aws ec2 describe-instances --instance-ids $instance_id --query "Reservations[].Instances[].PublicDnsName| [0]"|sed "s/\"//g")
    aws ec2 wait instance-status-ok --instance_ids $instance_id
    echo "---instance status ok---"

elif [ $1 = 'connect' ]; then 
    aws ec2 wait instance-running --instance-ids $instance_id
    echo "---instance running---"
    public_ip=$(aws ec2 describe-instances --instance-ids $instance_id --query "Reservations[].Instances[].PublicDnsName| [0]"|sed "s/\"//g")
    aws ec2 wait instance-status-ok --instance_ids $instance_id
    echo "---instance status ok---" 
    ssh -i ~/.ssh/deep_learning_ami.pem ubuntu@$public_ip
    
elif [ $1 = 'stop' ]; then
    aws ec2 stop-instances --instance-ids $instance_id
    aws ec2 wait instance-stopped --instance_ids $instance_id
    echo "---instance stopped---"

elif [ $1 = 'status' ]; then
    aws ec2 describe-instance-status --instance-ids $instance_id

else 
    echo 'command not found'

fi
