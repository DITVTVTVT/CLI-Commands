#!/bin/bash
echo "-----------START-----------"
yum -y update
yum -y install htop
yum -y install httpd

TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
&& myip=`curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4`

cat <<EOF > /var/www/html/index.html
<html>
<body bgcolor="green">
<h2><font color="gold">Build by Power of Terraform <font color="red">v1.8</font></h2><br><p>
<font color="green">Server PrivateIP: <font color="aqua">$myip<br>

<font color="magenta">
<b>Version 2.0</b>
</body>
</html>
EOF

sudo service httpd start
chkconfig httpd on
echo "------------STOP------------"