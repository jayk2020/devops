#!/bin/bash
cd /tmp
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent
sudo amazon-linux-extras install ansible2
sudo yum install -y git
sudo amazon-linux-extras install docker
sudo systemctl enable docker
sudo systemctl start docker
cd /home/ec2-user
mkdir airbus
git clone https://github.com/jayk2020/devops.git