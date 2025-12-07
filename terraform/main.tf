provider "aws" {


tags = { Name = "prov-ec2" }


# ------------------------
# PROVISIONER – FILE UPLOAD
# ------------------------
provisioner "file" {
source = "../app/server.js"
destination = "/home/ec2-user/server.js"


connection {
type = "ssh"
user = "ec2-user"
host = self.public_ip
private_key = file("../mykey.pem")
}
}


provisioner "file" {
source = "../app/package.json"
destination = "/home/ec2-user/package.json"


connection {
type = "ssh"
user = "ec2-user"
host = self.public_ip
private_key = file("../mykey.pem")
}
}


# ------------------------
# PROVISIONER – REMOTE EXEC
# ------------------------
provisioner "remote-exec" {
inline = [
"sudo yum update -y",
"curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -",
"sudo yum install -y nodejs",
"cd /home/ec2-user",
"npm install --production",
"nohup node server.js > app.log 2>&1 &"
]


connection {
type = "ssh"
user = "ec2-user"
host = self.public_ip
private_key = file("../mykey.pem")
}
}
}


# ---------------------------
# Fetch Amazon Linux 2 AMI
# ---------------------------
data "aws_ami" "amazon_linux2" {
most_recent = true
owners = ["amazon"]
filter {
name = "name"
values = ["amzn2-ami-hvm-*-x86_64-gp2"]
}
}
