# Day 96: Create EC2 Instance Using Terraform


The Nautilus DevOps team is strategizing the migration of a portion of their infrastructure to the AWS cloud. Recognizing the scale of this undertaking, they have opted to approach the migration in incremental steps rather than as a single massive transition. To achieve this, they have segmented large tasks into smaller, more manageable units.

For this task, create an EC2 instance using Terraform with the following requirements:

The EC2 instance must use the value datacenter-ec2 as its Name tag, which defines the instance name in AWS.

Use the Amazon Linux ami-0c101f26f147fa7fd to launch this instance.

The Instance type must be t2.micro.

Create a new RSA key named datacenter-kp.

Attach the default (available by default) security group.

The Terraform working directory is /home/bob/terraform. Create the main.tf file (do not create a different .tf file) to provision the instance.

Note: Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.


<img width="2262" height="1116" alt="image" src="https://github.com/user-attachments/assets/df0bcbe7-75b6-4f96-afce-7049026fe338" />

---

<img width="2232" height="1127" alt="image" src="https://github.com/user-attachments/assets/a53118ad-57d2-4130-8550-0926d07db6c1" /><img width="2255" height="1225" alt="image" src="https://github.com/user-attachments/assets/60defc22-e001-4bef-95a5-dcf63056b824" />
<img width="2397" height="1226" alt="image" src="https://github.com/user-attachments/assets/3f0a77ce-0819-4332-a134-cec6b9ca6cce" />
<img width="2342" height="1227" alt="image" src="https://github.com/user-attachments/assets/6221d7b2-b123-4ef0-9bb1-c8650266c6bf" />
<img width="2411" height="1197" alt="image" src="https://github.com/user-attachments/assets/7a828f7a-a2df-4115-b1ee-af031c8ce6a0" />
<img width="2236" height="1177" alt="image" src="https://github.com/user-attachments/assets/84e9fc13-4f5c-4ed9-af99-8928d10f00c1" />




```sh

bob@iac-server ~/terraform via 💠 default ➜  terraform init
Initializing the backend...
╷
│ Error: Terraform encountered problems during initialisation, including problems
│ with the configuration, described below.
│ 
│ The Terraform configuration must be valid before initialization so that
│ Terraform can determine which modules and providers need to be installed.
│ 
│ 
╵
╷
│ Error: Argument or block definition required
│ 
│   on main.tf line 21, in resource "aws_instance" "devops-ec2":
│   21:   tag: {
│ 
│ An argument or block definition is required here. To set an argument, use the equals sign "=" to
│ introduce the argument value.
╵

bob@iac-server ~/terraform via 💠 default ✖ terraform init
Initializing the backend...
Initializing provider plugins...
- Finding hashicorp/aws versions matching "5.91.0"...
- Finding latest version of hashicorp/tls...
- Installing hashicorp/tls v4.3.0...
- Installed hashicorp/tls v4.3.0 (signed by HashiCorp)
- Installing hashicorp/aws v5.91.0...
- Installed hashicorp/aws v5.91.0 (signed by HashiCorp)
Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

bob@iac-server ~/terraform via 💠 default ➜  terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions
are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.devops-ec2 will be created
  + resource "aws_instance" "devops-ec2" {
      + ami                                  = "ami-0c101f26f147fa7fd"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + enable_primary_ipv6                  = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "devops-kp"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "devops-ec2"
        }
      + tags_all                             = {
          + "Name" = "devops-ec2"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)
    }

  # aws_key_pair.devops-kp will be created
  + resource "aws_key_pair" "devops-kp" {
      + arn             = (known after apply)
      + fingerprint     = (known after apply)
      + id              = (known after apply)
      + key_name        = "devops-kp"
      + key_name_prefix = (known after apply)
      + key_pair_id     = (known after apply)
      + key_type        = (known after apply)
      + public_key      = (known after apply)
      + tags_all        = (known after apply)
    }

  # tls_private_key.devops-kp will be created
  + resource "tls_private_key" "devops-kp" {
      + algorithm                     = "RSA"
      + ecdsa_curve                   = "P224"
      + id                            = (known after apply)
      + private_key_openssh           = (sensitive value)
      + private_key_pem               = (sensitive value)
      + private_key_pem_pkcs8         = (sensitive value)
      + public_key_fingerprint_md5    = (known after apply)
      + public_key_fingerprint_sha256 = (known after apply)
      + public_key_openssh            = (known after apply)
      + public_key_pem                = (known after apply)
      + rsa_bits                      = 4096
    }

Plan: 3 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take
exactly these actions if you run "terraform apply" now.

bob@iac-server ~/terraform via 💠 default ➜  terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions
are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.devops-ec2 will be created
  + resource "aws_instance" "devops-ec2" {
      + ami                                  = "ami-0c101f26f147fa7fd"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + enable_primary_ipv6                  = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "devops-kp"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "devops-ec2"
        }
      + tags_all                             = {
          + "Name" = "devops-ec2"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)
    }

  # aws_key_pair.devops-kp will be created
  + resource "aws_key_pair" "devops-kp" {
      + arn             = (known after apply)
      + fingerprint     = (known after apply)
      + id              = (known after apply)
      + key_name        = "devops-kp"
      + key_name_prefix = (known after apply)
      + key_pair_id     = (known after apply)
      + key_type        = (known after apply)
      + public_key      = (known after apply)
      + tags_all        = (known after apply)
    }

  # tls_private_key.devops-kp will be created
  + resource "tls_private_key" "devops-kp" {
      + algorithm                     = "RSA"
      + ecdsa_curve                   = "P224"
      + id                            = (known after apply)
      + private_key_openssh           = (sensitive value)
      + private_key_pem               = (sensitive value)
      + private_key_pem_pkcs8         = (sensitive value)
      + public_key_fingerprint_md5    = (known after apply)
      + public_key_fingerprint_sha256 = (known after apply)
      + public_key_openssh            = (known after apply)
      + public_key_pem                = (known after apply)
      + rsa_bits                      = 4096
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

tls_private_key.devops-kp: Creating...
tls_private_key.devops-kp: Creation complete after 3s [id=be7ad4cc6deb0bfeec5b120a9f451c5c85c27947]
aws_key_pair.devops-kp: Creating...
aws_key_pair.devops-kp: Creation complete after 0s [id=devops-kp]
aws_instance.devops-ec2: Creating...
aws_instance.devops-ec2: Still creating... [10s elapsed]
aws_instance.devops-ec2: Creation complete after 11s [id=i-55c41deb40ead39e9]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

bob@iac-server ~/terraform via 💠 default ➜  terraform state list
aws_instance.devops-ec2
aws_key_pair.devops-kp
tls_private_key.devops-kp

bob@iac-server ~/terraform via 💠 default ➜  aws ec2 describe-instances --filters "Name=tag:Name,Values=devops-ec2" --region us-east-1
{
    "Reservations": [
        {
            "ReservationId": "r-21c9b8512173cfc1e",
            "OwnerId": "000000000000",
            "Groups": [],
            "Instances": [
                {
                    "Architecture": "x86_64",
                    "BlockDeviceMappings": [
                        {
                            "DeviceName": "/dev/sda1",
                            "Ebs": {
                                "AttachTime": "2026-07-14T16:32:49Z",
                                "DeleteOnTermination": true,
                                "Status": "in-use",
                                "VolumeId": "vol-e95cfe6ed9d53f64b"
                            }
                        }
                    ],
                    "ClientToken": "ABCDE0000000000003",
                    "EbsOptimized": false,
                    "Hypervisor": "xen",
                    "NetworkInterfaces": [
                        {
                            "Association": {
                                "IpOwnerId": "000000000000",
                                "PublicIp": "54.214.68.87"
                            },
                            "Attachment": {
                                "AttachTime": "2015-01-01T00:00:00Z",
                                "AttachmentId": "eni-attach-e28e8a7d768487ca6",
                                "DeleteOnTermination": true,
                                "DeviceIndex": 0,
                                "Status": "attached"
                            },
                            "Description": "Primary network interface",
                            "Groups": [
                                {
                                    "GroupId": "sg-efeb678a280c2caee",
                                    "GroupName": "default"
                                }
                            ],
                            "MacAddress": "1b:2b:3c:4d:5e:6f",
                            "NetworkInterfaceId": "eni-7c33510082ccf48f7",
                            "OwnerId": "000000000000",
                            "PrivateIpAddress": "10.221.141.74",
                            "PrivateIpAddresses": [
                                {
                                    "Association": {
                                        "IpOwnerId": "000000000000",
                                        "PublicIp": "54.214.68.87"
                                    },
                                    "Primary": true,
                                    "PrivateIpAddress": "10.221.141.74"
                                }
                            ],
                            "SourceDestCheck": true,
                            "Status": "in-use",
                            "SubnetId": "subnet-49dc28d46679101db",
                            "VpcId": "vpc-6c4a47dc47e067805"
                        }
                    ],
                    "RootDeviceName": "/dev/sda1",
                    "RootDeviceType": "ebs",
                    "SecurityGroups": [],
                    "SourceDestCheck": true,
                    "StateReason": {
                        "Code": "",
                        "Message": ""
                    },
                    "Tags": [
                        {
                            "Key": "Name",
                            "Value": "devops-ec2"
                        }
                    ],
                    "VirtualizationType": "paravirtual",
                    "HibernationOptions": {
                        "Configured": false
                    },
                    "MetadataOptions": {
                        "HttpTokens": "optional",
                        "HttpPutResponseHopLimit": 1,
                        "HttpEndpoint": "enabled",
                        "HttpProtocolIpv6": "disabled",
                        "InstanceMetadataTags": "disabled"
                    },
                    "InstanceId": "i-55c41deb40ead39e9",
                    "ImageId": "ami-0c101f26f147fa7fd",
                    "State": {
                        "Code": 16,
                        "Name": "running"
                    },
                    "PrivateDnsName": "ip-10-221-141-74.ec2.internal",
                    "PublicDnsName": "ec2-54-214-68-87.compute-1.amazonaws.com",
                    "StateTransitionReason": "",
                    "KeyName": "devops-kp",
                    "AmiLaunchIndex": 0,
                    "InstanceType": "t2.micro",
                    "LaunchTime": "2026-07-14T16:32:49Z",
                    "Placement": {
                        "GroupName": "",
                        "Tenancy": "default",
                        "AvailabilityZone": "us-east-1a"
                    },
                    "KernelId": "None",
                    "Monitoring": {
                        "State": "disabled"
                    },
                    "SubnetId": "subnet-49dc28d46679101db",
                    "VpcId": "vpc-6c4a47dc47e067805",
                    "PrivateIpAddress": "10.221.141.74",
                    "PublicIpAddress": "54.214.68.87"
                }
            ]
        }
    ]
}

bob@iac-server ~/terraform via 💠 default ➜

```

<img width="2422" height="1122" alt="image" src="https://github.com/user-attachments/assets/bbd3d3b0-10b2-4501-8fb2-a83b20b78659" />

<img width="2405" height="1172" alt="image" src="https://github.com/user-attachments/assets/c92ae6c0-c2ca-416e-8e32-5bd7fc9e9d5e" />
















