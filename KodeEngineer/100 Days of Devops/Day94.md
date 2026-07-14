# Day 94: Create VPC Using Terraform

The Nautilus DevOps team is strategizing the migration of a portion of their infrastructure to the AWS cloud. 
Recognizing the scale of this undertaking, they have opted to approach the migration in incremental steps rather than as a single massive transition. 
To achieve this, they have segmented large tasks into smaller, more manageable units. 
This granular approach enables the team to execute the migration in gradual phases, ensuring smoother implementation and minimizing disruption to ongoing operations. 
By breaking down the migration into smaller tasks, the Nautilus DevOps team can systematically progress through each stage, allowing for better control, risk mitigation, and optimization of resources throughout the migration process.

Create a VPC named nautilus-vpc in region us-east-1 with any IPv4 CIDR block through terraform.

The Terraform working directory is /home/bob/terraform. Create the main.tf file (do not create a different .tf file) to accomplish this task.

Note: Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

<img width="2392" height="1187" alt="image" src="https://github.com/user-attachments/assets/f5bdd35e-3d21-4cbb-a51a-cb3bba65e9db" />

---

```hcl
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "main"
    }
}
```


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

  # aws_vpc.main will be created
  + resource "aws_vpc" "main" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "main"
        }
      + tags_all                             = {
          + "Name" = "main"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take
exactly these actions if you run "terraform apply" now.

bob@iac-server ~/terraform via 💠 default ➜  terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions
are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_vpc.main will be created
  + resource "aws_vpc" "main" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "main"
        }
      + tags_all                             = {
          + "Name" = "main"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
aws_vpc.main: Creating...
aws_vpc.main: Creation complete after 1s [id=vpc-2788aa9267465d6b5]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

bob@iac-server ~/terraform via 💠 default ➜  terraform state list
aws_vpc.main

bob@iac-server ~/terraform via 💠 default ➜  aws ec2 describe-vpcs \
> --filters "Name=tag:Name,Values=main^C

bob@iac-server ~/terraform via 💠 default ✖ ^C

bob@iac-server ~/terraform via 💠 default ✖ terraform destroy -auto-aaprove
╷
│ Error: Failed to parse command-line flags
│ 
│ flag provided but not defined: -auto-aaprove
╵

For more help on using this command, run:
  terraform destroy -help

bob@iac-server ~/terraform via 💠 default ✖ terraform destroy -auto-approve
╷
│ Error: Unsupported argument
│ 
│   on main.tf line 3, in resource "aws_vpc" "nautilus-vpc":
│    3:     region = "us-east-1"
│ 
│ An argument named "region" is not expected here.
╵

bob@iac-server ~/terraform via 💠 default ✖ terraform destroy -auto-aaprove
╷
│ Error: Failed to parse command-line flags
│ 
│ flag provided but not defined: -auto-aaprove
╵

For more help on using this command, run:
  terraform destroy -help

bob@iac-server ~/terraform via 💠 default ✖ terraform destroy -auto-aaprove
╷
│ Error: Failed to parse command-line flags
│ 
│ flag provided but not defined: -auto-aaprove
╵

For more help on using this command, run:
  terraform destroy -help

bob@iac-server ~/terraform via 💠 default ✖ terraform destroy
aws_vpc.main: Refreshing state... [id=vpc-2788aa9267465d6b5]

Terraform used the selected providers to generate the following execution plan. Resource actions
are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_vpc.main will be destroyed
  - resource "aws_vpc" "main" {
      - arn                                  = "arn:aws:ec2:us-east-1:000000000000:vpc/vpc-2788aa9267465d6b5" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "10.0.0.0/16" -> null
      - default_network_acl_id               = "acl-bf5f5f7d5e019dec2" -> null
      - default_route_table_id               = "rtb-8e599f631bb7e3d4f" -> null
      - default_security_group_id            = "sg-509e8606f8a2240c2" -> null
      - dhcp_options_id                      = "default" -> null
      - enable_dns_hostnames                 = false -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - id                                   = "vpc-2788aa9267465d6b5" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-8e599f631bb7e3d4f" -> null
      - owner_id                             = "000000000000" -> null
      - tags                                 = {
          - "Name" = "main"
        } -> null
      - tags_all                             = {
          - "Name" = "main"
        } -> null
        # (4 unchanged attributes hidden)
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_vpc.main: Destroying... [id=vpc-2788aa9267465d6b5]
aws_vpc.main: Destruction complete after 0s

Destroy complete! Resources: 1 destroyed.

bob@iac-server ~/terraform via 💠 default ➜  terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions
are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_vpc.nautilus-vpc will be created
  + resource "aws_vpc" "nautilus-vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "main"
        }
      + tags_all                             = {
          + "Name" = "main"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take
exactly these actions if you run "terraform apply" now.

bob@iac-server ~/terraform via 💠 default ➜  terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions
are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_vpc.nautilus-vpc will be created
  + resource "aws_vpc" "nautilus-vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "main"
        }
      + tags_all                             = {
          + "Name" = "main"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
aws_vpc.nautilus-vpc: Creating...
aws_vpc.nautilus-vpc: Creation complete after 0s [id=vpc-c51515d9faf9c64ea]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

bob@iac-server ~/terraform via 💠 default ➜  terraform state list
aws_vpc.nautilus-vpc

bob@iac-server ~/terraform via 💠 default ➜  aws ec2 describe-vpcs \
--filters "Name=tag:Name,Values=nautilus-vpc" \
--region us-east-1
{
    "Vpcs": []
}

bob@iac-server ~/terraform via 💠 default ➜  aws ec2 describe-vpcs --filters "Name=tag:Name,Values=n
autilus-vpc" --region us-east-1
{
    "Vpcs": []
}

bob@iac-server ~/terraform via 💠 default ➜  aws ec2 describe-vpcs --filters "Name=tag:Name,Values=main" --region us-east-1
{
    "Vpcs": [
        {
            "OwnerId": "000000000000",
            "InstanceTenancy": "default",
            "Ipv6CidrBlockAssociationSet": [],
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-41cdba13aa450d3b0",
                    "CidrBlock": "10.0.0.0/16",
                    "CidrBlockState": {
                        "State": "associated"
                    }
                }
            ],
            "IsDefault": false,
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "main"
                }
            ],
            "VpcId": "vpc-c51515d9faf9c64ea",
            "State": "available",
            "CidrBlock": "10.0.0.0/16",
            "DhcpOptionsId": "default"
        }
    ]
}

bob@iac-server ~/terraform via 💠 default ➜  


```


<img width="2377" height="1195" alt="image" src="https://github.com/user-attachments/assets/533331c8-fde6-4a9b-8475-762b0d4b22cf" />





















