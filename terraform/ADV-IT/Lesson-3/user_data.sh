#!/bin/bash
echo "-----------START-----------"
yum -y update
yum -y install htop
yum -y install httpd
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
&& myip=`curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>WebServer with IP: $myip</h2><br>Build by Terraform using External Script!" > /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
echo "------------STOP------------"