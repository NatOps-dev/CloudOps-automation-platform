# # 1. Import the Public Key to AWS
# resource "aws_key_pair" "dev_key" {
#   key_name = "dev_key"
#   public_key = file("dev_key.pub")
# }

# # 2 Get the latest Ununtu AMI ID
# data "aws_ami" "Ununtu" {
#   most_recent = true
#   owners = ["076510357859"]

#   filter {
#     name = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]

#   }
# }

# # 3 Create the EC2 Instance
# resource "aws_instance" "dev_server" {
#   ami = data.aws_ami.Ununtu.id
#   instance_type = "t2.micro" #Free Tier Friendly

#   subnet_id = aws_subnet.public_subnet.id
#   vpc_security_group_ids = [aws_security_group.dev_sg.id]
#   key_name = aws_key_pair.dev_key.key_name

#   tags = {
#     Name = "DevOPs-Lord-Server"
#   }
# }

# # 4 Output the Public IP so we can find it easily
# output "server_public_ip" {
#   value = aws_instance.dev_server.public_ip
# }


# 1. Import the Public Key to AWS
resource "aws_key_pair" "dev_key" {
  key_name   = "devops-lord-key"
  public_key = file("devops-lord-key.pub")
}

# 2. Get the latest Ubuntu AMI ID
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

# 3. Create the EC2 Instance
resource "aws_instance" "dev_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro" # Free Tier friendly

  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.dev_sg.id]
  key_name               = aws_key_pair.dev_key.key_name

  tags = {
    Name = "DevOps-Lord-Server"
  }
}

# 4. Output the Public IP so we can find it easily
output "server_public_ip" {
  value = aws_instance.dev_server.public_ip
}