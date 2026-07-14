# Day 98: Launch EC2 in Private VPC Subnet Using Terraform

The Nautilus DevOps team is expanding their AWS infrastructure and requires the setup of a private Virtual Private Cloud (VPC) along with a subnet. This VPC and subnet configuration will ensure that resources deployed within them remain isolated from external networks and can only communicate within the VPC. Additionally, the team needs to provision an EC2 instance under the newly created private VPC. This instance should be accessible only from within the VPC, allowing for secure communication and resource management within the AWS environment.

Create a VPC named xfusion-priv-vpc with the CIDR block 10.0.0.0/16.

Create a subnet named xfusion-priv-subnet inside the VPC with the CIDR block 10.0.1.0/24 and auto-assign IP option must not be enabled.

Create an EC2 instance named xfusion-priv-ec2 inside the subnet and instance type must be t2.micro.

Ensure the security group of the EC2 instance allows access only from within the VPC's CIDR block.

Create the main.tf file (do not create a separate .tf file) to provision the VPC, subnet and EC2 instance.

Use variables.tf file with the following variable names:

KKE_VPC_CIDR for the VPC CIDR block.
KKE_SUBNET_CIDR for the subnet CIDR block.
Use the outputs.tf file with the following variable names:

KKE_vpc_name for the name of the VPC.
KKE_subnet_name for the name of the subnet.
KKE_ec2_private for the name of the EC2 instance.

Notes:

The Terraform working directory is /home/bob/terraform.

Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

Before submitting the task, ensure that terraform plan returns No changes. Your infrastructure matches the configuration.

<img width="707" height="1141" alt="image" src="https://github.com/user-attachments/assets/fbf891fd-0ef5-4172-8d5e-be36643c2d39" />

---

```variable.tf
# Content of the variables.tf file.
# For the VPC CIDR block.
  variable "KKE_VPC_CIDR" {
    default = "10.0.0.0/16"
  }
  
  # For the subnet CIDR block.
  variable "KKE_SUBNET_CIDR" {
    default = "10.0.1.0/24"
  }

```


```output.tf
# Content of the outputs.tf file.
# For the name of the VPC.
output "KKE_vpc_name" {
  value = aws_vpc.xfusion-priv-vpc.tags["Name"]
}

# For the name of the subnet.
output "KKE_subnet_name" {
  value = aws_subnet.xfusion-priv-subnet.tags["Name"]
}

# For the name of the EC2 instance.
output "KKE_ec2_private" {
  value = aws_instance.xfusion-priv-ec2.tags["Name"]
}

```provider.tf
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.91.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  s3_use_path_style = true

endpoints {
    ec2            = "http://aws:4566"
    apigateway     = "http://aws:4566"
    cloudformation = "http://aws:4566"
    cloudwatch     = "http://aws:4566"
    dynamodb       = "http://aws:4566"
    es             = "http://aws:4566"
    firehose       = "http://aws:4566"
    iam            = "http://aws:4566"
    kinesis        = "http://aws:4566"
    lambda         = "http://aws:4566"
    route53        = "http://aws:4566"
    redshift       = "http://aws:4566"
    s3             = "http://aws:4566"
    secretsmanager = "http://aws:4566"
    ses            = "http://aws:4566"
    sns            = "http://aws:4566"
    sqs            = "http://aws:4566"
    ssm            = "http://aws:4566"
    stepfunctions  = "http://aws:4566"
    sts            = "http://aws:4566"
    rds            = "http://aws:4566"
  }
}


```


```main.tf
# 1. Create VPC.
resource "aws_vpc" "xfusion-priv-vpc" {
  cidr_block = var.KKE_VPC_CIDR

  tags = {
    Name = "xfusion-priv-vpc"
  }
}

# 2. Create Subnet.
resource "aws_subnet" "xfusion-priv-subnet" {
  vpc_id                  = aws_vpc.xfusion-priv-vpc.id
  cidr_block              = var.KKE_SUBNET_CIDR
  map_public_ip_on_launch = false

  tags = {
    Name = "xfusion-priv-subnet"
  }
}

# 3. Create Security Group.
resource "aws_security_group" "xfusion-priv-sg" {
  name        = "xfusion-priv-sg"
  description = "Allow traffic only within VPC"
  vpc_id      = aws_vpc.xfusion-priv-vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.KKE_VPC_CIDR]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.KKE_VPC_CIDR]
  }
}

# 4. Create EC2 Instance.
resource "aws_instance" "xfusion-priv-ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.xfusion-priv-subnet.id

  vpc_security_group_ids = [
    aws_security_group.xfusion-priv_sg.id
  ]

  tags = {
    Name = "xfusion-priv-ec2"
  }
}
```



