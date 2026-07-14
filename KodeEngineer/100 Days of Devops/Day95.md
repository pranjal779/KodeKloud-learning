# Day 95: Create Security Group Using Terraform

The Nautilus DevOps team is strategizing the migration of a portion of their infrastructure to the AWS cloud. Recognizing the scale of this undertaking, they have opted to approach the migration in incremental steps rather than as a single massive transition. To achieve this, they have segmented large tasks into smaller, more manageable units. This granular approach enables the team to execute the migration in gradual phases, ensuring smoother implementation and minimizing disruption to ongoing operations. By breaking down the migration into smaller tasks, the Nautilus DevOps team can systematically progress through each stage, allowing for better control, risk mitigation, and optimization of resources throughout the migration process.

Use Terraform to create a security group under the default VPC with the following requirements:

1) The name of the security group must be xfusion-sg.

2) The description must be Security group for Nautilus App Servers.

3) Add an inbound rule of type HTTP, with a port range of 80, and source CIDR range 0.0.0.0/0.

4) Add another inbound rule of type SSH, with a port range of 22, and source CIDR range 0.0.0.0/0.

Ensure that the security group is created in the us-east-1 region using Terraform. The Terraform working directory is /home/bob/terraform. Create the main.tf file (do not create a different .tf file) to accomplish this task.

Note: Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

<img width="2332" height="1137" alt="image" src="https://github.com/user-attachments/assets/6fb6c5fb-15df-417b-9976-017209d2a94d" />

---

<img width="2336" height="1145" alt="image" src="https://github.com/user-attachments/assets/95604422-f1b9-4027-a181-687c78e3585f" />
<img width="2130" height="1157" alt="image" src="https://github.com/user-attachments/assets/0e877c56-ee9c-487e-983e-fae770f8cdde" />
<img width="2222" height="1160" alt="image" src="https://github.com/user-attachments/assets/faf7dd4c-1239-4157-b7b1-d2cdf83f2c21" />
<img width="2112" height="1195" alt="image" src="https://github.com/user-attachments/assets/a2c7dad0-6c85-45b5-beda-93a6731292d5" />
<img width="2412" height="1432" alt="image" src="https://github.com/user-attachments/assets/baee3057-2a42-43ff-a736-8e91677da45d" />






```sh

bob@iac-server ~/terraform via 💠 default ➜  terraform init
Initializing the backend...
Initializing provider plugins...
- Finding hashicorp/aws versions matching "5.91.0"...
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

  # aws_security_group.xfusion-sg will be created
  + resource "aws_security_group" "xfusion-sg" {
      + arn                    = (known after apply)
      + description            = "Security group for Nautilus App Servers"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
                # (1 unchanged attribute hidden)
            },
        ]
      + name                   = "xfusion-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take
exactly these actions if you run "terraform apply" now.

bob@iac-server ~/terraform via 💠 default ➜  terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions
are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_security_group.xfusion-sg will be created
  + resource "aws_security_group" "xfusion-sg" {
      + arn                    = (known after apply)
      + description            = "Security group for Nautilus App Servers"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
                # (1 unchanged attribute hidden)
            },
        ]
      + name                   = "xfusion-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_security_group.xfusion-sg: Creating...
aws_security_group.xfusion-sg: Creation complete after 1s [id=sg-b78b10a22ac69b8b7]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

bob@iac-server ~/terraform via 💠 default ➜  terraform state list
aws_security_group.xfusion-sg

bob@iac-server ~/terraform via 💠 default ➜  aws ec2 describe-security-groups \
--filters "Name=group-name,Values=xfusion-sg" \
--region us-east-1
{
    "SecurityGroups": [
        {
            "GroupId": "sg-b78b10a22ac69b8b7",
            "IpPermissionsEgress": [],
            "Tags": [],
            "VpcId": "vpc-8e69737c1f63e5d49",
            "SecurityGroupArn": "arn:aws:ec2:us-east-1:000000000000:security-group/sg-b78b10a22ac69b8b7",
            "OwnerId": "000000000000",
            "GroupName": "xfusion-sg",
            "Description": "Security group for Nautilus App Servers",
            "IpPermissions": [
                {
                    "IpProtocol": "tcp",
                    "FromPort": 80,
                    "ToPort": 80,
                    "UserIdGroupPairs": [],
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": []
                },
                {
                    "IpProtocol": "tcp",
                    "FromPort": 22,
                    "ToPort": 22,
                    "UserIdGroupPairs": [],
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": []
                }
            ]
        }
    ]
}

bob@iac-server ~/terraform via 💠 default ➜

```


<img width="2407" height="1397" alt="image" src="https://github.com/user-attachments/assets/2745c6ee-ec4d-4326-89e0-a3a06ed71a79" />
<img width="2385" height="1352" alt="image" src="https://github.com/user-attachments/assets/360531d6-a61d-4203-b2c2-d094e2f82e46" />




