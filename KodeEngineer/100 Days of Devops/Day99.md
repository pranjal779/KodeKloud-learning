# Day 99: Attach IAM Policy for DynamoDB Access Using Terraform

The DevOps team has been tasked with creating a secure DynamoDB table and enforcing fine-grained access control using IAM. This setup will allow secure and restricted access to the table from trusted AWS services only.

As a member of the Nautilus DevOps Team, your task is to perform the following using Terraform:

Create a DynamoDB Table: Create a table named devops-table with minimal configuration.

Create an IAM Role: Create an IAM role named devops-role that will be allowed to access the table.

Create an IAM Policy: Create a policy named devops-readonly-policy that should grant read-only access (GetItem, Scan, Query) to the specific DynamoDB table and attach it to the role.

Create the main.tf file (do not create a separate .tf file) to provision the table, role, and policy.

Create the variables.tf file with the following variables:

KKE_TABLE_NAME: name of the DynamoDB table
KKE_ROLE_NAME: name of the IAM role
KKE_POLICY_NAME: name of the IAM policy
Create the outputs.tf file with the following outputs:

kke_dynamodb_table: name of the DynamoDB table
kke_iam_role_name: name of the IAM role
kke_iam_policy_name: name of the IAM policy
Define the actual values for these variables in the terraform.tfvars file.

Ensure that the IAM policy allows only read access and restricts it to the specific DynamoDB table created.


Notes:

The Terraform working directory is /home/bob/terraform.

Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

Before submitting the task, ensure that terraform plan returns No changes. Your infrastructure matches the configuration.

<img width="847" height="1290" alt="image" src="https://github.com/user-attachments/assets/5f9abddb-b2b1-45e1-bf35-a27173fc388c" />

---



```variables.tf
variable "KKE_TABLE_NAME" {
  type        = string
  description = "Name of the DynamoDB table"
}

variable "KKE_ROLE_NAME" {
  type        = string
  description = "Name of the IAM role"
}

variable "KKE_POLICY_NAME" {
  type        = string
  description = "Name of the IAM policy"
}

```

-------

```terraform.tfvars
KKE_TABLE_NAME  = "devops-table"
KKE_ROLE_NAME   = "devops-role"
KKE_POLICY_NAME = "devops-readonly-policy"
```


-----


```main.tf
# 1. DynamoDB Table with minimal configuration
resource "aws_dynamodb_table" "devops_table" {
  name         = var.KKE_TABLE_NAME
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

# 2. IAM Role allowed to be assumed by trusted AWS services (e.g., EC2)
resource "aws_iam_role" "devops_role" {
  name = var.KKE_ROLE_NAME

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "://amazonaws.com"
        }
      }
    ]
  })
}

# 3. IAM Policy granting read-only access (GetItem, Scan, Query) restricted to this specific table
resource "aws_iam_policy" "devops_readonly_policy" {
  name = var.KKE_POLICY_NAME

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = [
          "dynamodb:GetItem",
          "dynamodb:Scan",
          "dynamodb:Query"
        ]
        Effect   = "Allow"
        Resource = aws_dynamodb_table.devops_table.arn
      }
    ]
  })
}

# Attach the IAM Policy to the IAM Role
resource "aws_iam_role_policy_attachment" "devops_policy_attach" {
  role       = aws_iam_role.devops_role.name
  policy_arn = aws_iam_policy.devops_readonly_policy.arn
}

```

------

```outputs.tf
output "kke_dynamodb_table" {
  value       = aws_dynamodb_table.devops_table.name
  description = "Name of the DynamoDB table"
}

output "kke_iam_role_name" {
  value       = aws_iam_role.devops_role.name
  description = "Name of the IAM role"
}

output "kke_iam_policy_name" {
  value       = aws_iam_policy.devops_readonly_policy.name
  description = "Name of the IAM policy"
}

````

-------

<img width="1842" height="1150" alt="image" src="https://github.com/user-attachments/assets/6a4a81e8-f56e-4fbe-9d2e-11d74849641c" />


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

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_dynamodb_table.devops_table will be created
  + resource "aws_dynamodb_table" "devops_table" {
      + arn              = (known after apply)
      + billing_mode     = "PAY_PER_REQUEST"
      + hash_key         = "id"
      + id               = (known after apply)
      + name             = "devops-table"
      + read_capacity    = (known after apply)
      + stream_arn       = (known after apply)
      + stream_label     = (known after apply)
      + stream_view_type = (known after apply)
      + tags_all         = (known after apply)
      + write_capacity   = (known after apply)

      + attribute {
          + name = "id"
          + type = "S"
        }

      + point_in_time_recovery (known after apply)

      + server_side_encryption (known after apply)

      + ttl (known after apply)
    }

  # aws_iam_policy.devops_readonly_policy will be created
  + resource "aws_iam_policy" "devops_readonly_policy" {
      + arn              = (known after apply)
      + attachment_count = (known after apply)
      + id               = (known after apply)
      + name             = "devops-readonly-policy"
      + name_prefix      = (known after apply)
      + path             = "/"
      + policy           = (known after apply)
      + policy_id        = (known after apply)
      + tags_all         = (known after apply)
    }

  # aws_iam_role.devops_role will be created
  + resource "aws_iam_role" "devops_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "://amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "devops-role"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # aws_iam_role_policy_attachment.devops_policy_attach will be created
  + resource "aws_iam_role_policy_attachment" "devops_policy_attach" {
      + id         = (known after apply)
      + policy_arn = (known after apply)
      + role       = "devops-role"
    }

Plan: 4 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + kke_dynamodb_table  = "devops-table"
  + kke_iam_policy_name = "devops-readonly-policy"
  + kke_iam_role_name   = "devops-role"

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run
"terraform apply" now.

bob@iac-server ~/terraform via 💠 default ➜


bob@iac-server ~/terraform via 💠 default ➜  terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_dynamodb_table.devops_table will be created
  + resource "aws_dynamodb_table" "devops_table" {
      + arn              = (known after apply)
      + billing_mode     = "PAY_PER_REQUEST"
      + hash_key         = "id"
      + id               = (known after apply)
      + name             = "devops-table"
      + read_capacity    = (known after apply)
      + stream_arn       = (known after apply)
      + stream_label     = (known after apply)
      + stream_view_type = (known after apply)
      + tags_all         = (known after apply)
      + write_capacity   = (known after apply)

      + attribute {
          + name = "id"
          + type = "S"
        }

      + point_in_time_recovery (known after apply)

      + server_side_encryption (known after apply)

      + ttl (known after apply)
    }

  # aws_iam_policy.devops_readonly_policy will be created
  + resource "aws_iam_policy" "devops_readonly_policy" {
      + arn              = (known after apply)
      + attachment_count = (known after apply)
      + id               = (known after apply)
      + name             = "devops-readonly-policy"
      + name_prefix      = (known after apply)
      + path             = "/"
      + policy           = (known after apply)
      + policy_id        = (known after apply)
      + tags_all         = (known after apply)
    }

  # aws_iam_role.devops_role will be created
  + resource "aws_iam_role" "devops_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "://amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "devops-role"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # aws_iam_role_policy_attachment.devops_policy_attach will be created
  + resource "aws_iam_role_policy_attachment" "devops_policy_attach" {
      + id         = (known after apply)
      + policy_arn = (known after apply)
      + role       = "devops-role"
    }

Plan: 4 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + kke_dynamodb_table  = "devops-table"
  + kke_iam_policy_name = "devops-readonly-policy"
  + kke_iam_role_name   = "devops-role"
aws_iam_role.devops_role: Creating...
aws_dynamodb_table.devops_table: Creating...
aws_iam_role.devops_role: Creation complete after 0s [id=devops-role]
aws_dynamodb_table.devops_table: Creation complete after 3s [id=devops-table]
aws_iam_policy.devops_readonly_policy: Creating...
╷
│ Error: creating IAM Policy (devops-readonly-policy): operation error IAM: CreatePolicy, https response error StatusCode: 400, RequestID: 763b7d5a-e133-4c7c-b1b6-fec09614b382, MalformedPolicyDocument: Policy statement must contain actions.
│ 
│   with aws_iam_policy.devops_readonly_policy,
│   on main.tf line 32, in resource "aws_iam_policy" "devops_readonly_policy":
│   32: resource "aws_iam_policy" "devops_readonly_policy" {
│ 
╵

bob@iac-server ~/terraform via 💠 default ✖

```

### fixed the error:

#### Error:

```sh
bob@iac-server ~/terraform via 💠 default ➜  terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_dynamodb_table.devops_table will be created
  + resource "aws_dynamodb_table" "devops_table" {
      + arn              = (known after apply)
      + billing_mode     = "PAY_PER_REQUEST"
      + hash_key         = "id"
      + id               = (known after apply)
      + name             = "devops-table"
      + read_capacity    = (known after apply)
      + stream_arn       = (known after apply)
      + stream_label     = (known after apply)
      + stream_view_type = (known after apply)
      + tags_all         = (known after apply)
      + write_capacity   = (known after apply)

      + attribute {
          + name = "id"
          + type = "S"
        }

      + point_in_time_recovery (known after apply)

      + server_side_encryption (known after apply)

      + ttl (known after apply)
    }

  # aws_iam_policy.devops_readonly_policy will be created
  + resource "aws_iam_policy" "devops_readonly_policy" {
      + arn              = (known after apply)
      + attachment_count = (known after apply)
      + id               = (known after apply)
      + name             = "devops-readonly-policy"
      + name_prefix      = (known after apply)
      + path             = "/"
      + policy           = (known after apply)
      + policy_id        = (known after apply)
      + tags_all         = (known after apply)
    }

  # aws_iam_role.devops_role will be created
  + resource "aws_iam_role" "devops_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "://amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "devops-role"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # aws_iam_role_policy_attachment.devops_policy_attach will be created
  + resource "aws_iam_role_policy_attachment" "devops_policy_attach" {
      + id         = (known after apply)
      + policy_arn = (known after apply)
      + role       = "devops-role"
    }

Plan: 4 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + kke_dynamodb_table  = "devops-table"
  + kke_iam_policy_name = "devops-readonly-policy"
  + kke_iam_role_name   = "devops-role"
aws_iam_role.devops_role: Creating...
aws_dynamodb_table.devops_table: Creating...
aws_iam_role.devops_role: Creation complete after 0s [id=devops-role]
aws_dynamodb_table.devops_table: Creation complete after 3s [id=devops-table]
aws_iam_policy.devops_readonly_policy: Creating...
╷
│ Error: creating IAM Policy (devops-readonly-policy): operation error IAM: CreatePolicy, https response error StatusCode: 400, RequestID: 763b7d5a-e133-4c7c-b1b6-fec09614b382, MalformedPolicyDocument: Policy statement must contain actions.
│ 
│   with aws_iam_policy.devops_readonly_policy,
│   on main.tf line 32, in resource "aws_iam_policy" "devops_readonly_policy":
│   32: resource "aws_iam_policy" "devops_readonly_policy" {
│ 
```

```main.tf
# line 39
# 3. IAM Policy granting read-only access (GetItem, Scan, Query) restricted to this specific table
resource "aws_iam_policy" "devops_readonly_policy" {
  name = var.KKE_POLICY_NAME

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        
        Action = [
          "dynamodb:GetItem",
          "dynamodb:Scan",
          "dynamodb:Query"
        ]
        Resource = aws_dynamodb_table.devops_table.arn
      }
    ]
  })
}
```

```sh
╵
bob@iac-server ~/terraform via 💠 default ✖ terraform apply
aws_iam_role.devops_role: Refreshing state... [id=devops-role]
aws_dynamodb_table.devops_table: Refreshing state... [id=devops-table]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_policy.devops_readonly_policy will be created
  + resource "aws_iam_policy" "devops_readonly_policy" {
      + arn              = (known after apply)
      + attachment_count = (known after apply)
      + id               = (known after apply)
      + name             = "devops-readonly-policy"
      + name_prefix      = (known after apply)
      + path             = "/"
      + policy           = jsonencode(
            {
              + Statement = [
                  + {
                      + Effect   = "Allow"
                      + Resource = "arn:aws:dynamodb:us-east-1:000000000000:table/devops-table"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + policy_id        = (known after apply)
      + tags_all         = (known after apply)
    }

  # aws_iam_role_policy_attachment.devops_policy_attach will be created
  + resource "aws_iam_role_policy_attachment" "devops_policy_attach" {
      + id         = (known after apply)
      + policy_arn = (known after apply)
      + role       = "devops-role"
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_policy.devops_readonly_policy: Creating...
╷
│ Error: creating IAM Policy (devops-readonly-policy): operation error IAM: CreatePolicy, https response error StatusCode: 400, RequestID: d3e371c3-104f-4d64-a76c-9398c31b266c, MalformedPolicyDocument: Policy statement must contain actions.
│ 
│   with aws_iam_policy.devops_readonly_policy,
│   on main.tf line 32, in resource "aws_iam_policy" "devops_readonly_policy":
│   32: resource "aws_iam_policy" "devops_readonly_policy" {
│ 
╵

bob@iac-server ~/terraform via 💠 default ✖ terraform apply -auto-approve
aws_iam_role.devops_role: Refreshing state... [id=devops-role]
aws_dynamodb_table.devops_table: Refreshing state... [id=devops-table]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_policy.devops_readonly_policy will be created
  + resource "aws_iam_policy" "devops_readonly_policy" {
      + arn              = (known after apply)
      + attachment_count = (known after apply)
      + id               = (known after apply)
      + name             = "devops-readonly-policy"
      + name_prefix      = (known after apply)
      + path             = "/"
      + policy           = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "dynamodb:GetItem",
                          + "dynamodb:Scan",
                          + "dynamodb:Query",
                        ]
                      + Effect   = "Allow"
                      + Resource = "arn:aws:dynamodb:us-east-1:000000000000:table/devops-table"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + policy_id        = (known after apply)
      + tags_all         = (known after apply)
    }

  # aws_iam_role_policy_attachment.devops_policy_attach will be created
  + resource "aws_iam_role_policy_attachment" "devops_policy_attach" {
      + id         = (known after apply)
      + policy_arn = (known after apply)
      + role       = "devops-role"
    }

Plan: 2 to add, 0 to change, 0 to destroy.
aws_iam_policy.devops_readonly_policy: Creating...
aws_iam_policy.devops_readonly_policy: Creation complete after 0s [id=arn:aws:iam::000000000000:policy/devops-readonly-policy]
aws_iam_role_policy_attachment.devops_policy_attach: Creating...
aws_iam_role_policy_attachment.devops_policy_attach: Creation complete after 0s [id=devops-role-20260715080551543000000001]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

kke_dynamodb_table = "devops-table"
kke_iam_policy_name = "devops-readonly-policy"
kke_iam_role_name = "devops-role"

bob@iac-server ~/terraform via 💠 default ➜
````


```sh


bob@iac-server ~/terraform via 💠 default ➜  terraform show
# aws_dynamodb_table.devops_table:
resource "aws_dynamodb_table" "devops_table" {
    arn                         = "arn:aws:dynamodb:us-east-1:000000000000:table/devops-table"
    billing_mode                = "PAY_PER_REQUEST"
    deletion_protection_enabled = false
    hash_key                    = "id"
    id                          = "devops-table"
    name                        = "devops-table"
    read_capacity               = 0
    stream_arn                  = null
    stream_enabled              = false
    stream_label                = null
    stream_view_type            = null
    table_class                 = "STANDARD"
    tags                        = {}
    tags_all                    = {}
    write_capacity              = 0

    attribute {
        name = "id"
        type = "S"
    }

    point_in_time_recovery {
        enabled = false
    }

    ttl {
        attribute_name = null
        enabled        = false
    }
}

# aws_iam_policy.devops_readonly_policy:
resource "aws_iam_policy" "devops_readonly_policy" {
    arn              = "arn:aws:iam::000000000000:policy/devops-readonly-policy"
    attachment_count = 0
    description      = null
    id               = "arn:aws:iam::000000000000:policy/devops-readonly-policy"
    name             = "devops-readonly-policy"
    name_prefix      = null
    path             = "/"
    policy           = jsonencode(
        {
            Statement = [
                {
                    Action   = [
                        "dynamodb:GetItem",
                        "dynamodb:Scan",
                        "dynamodb:Query",
                    ]
                    Effect   = "Allow"
                    Resource = "arn:aws:dynamodb:us-east-1:000000000000:table/devops-table"
                },
            ]
            Version   = "2012-10-17"
        }
    )
    policy_id        = "AVNVVFMXAG0VAQVZNT4U8"
    tags_all         = {}
}

# aws_iam_role.devops_role:
resource "aws_iam_role" "devops_role" {
    arn                   = "arn:aws:iam::000000000000:role/devops-role"
    assume_role_policy    = jsonencode(
        {
            Statement = [
                {
                    Action    = "sts:AssumeRole"
                    Effect    = "Allow"
                    Principal = {
                        Service = "://amazonaws.com"
                    }
                },
            ]
            Version   = "2012-10-17"
        }
    )
    create_date           = "2026-07-15T08:00:23Z"
    description           = null
    force_detach_policies = false
    id                    = "devops-role"
    managed_policy_arns   = []
    max_session_duration  = 3600
    name                  = "devops-role"
    name_prefix           = null
    path                  = "/"
    permissions_boundary  = null
    tags                  = {}
    tags_all              = {}
    unique_id             = "AROAQAAAAAAADG5KTGDU7"
}

# aws_iam_role_policy_attachment.devops_policy_attach:
resource "aws_iam_role_policy_attachment" "devops_policy_attach" {
    id         = "devops-role-20260715080551543000000001"
    policy_arn = "arn:aws:iam::000000000000:policy/devops-readonly-policy"
    role       = "devops-role"
}


Outputs:

kke_dynamodb_table = "devops-table"
kke_iam_policy_name = "devops-readonly-policy"
kke_iam_role_name = "devops-role"

bob@iac-server ~/terraform via 💠 default ➜


bob@iac-server ~/terraform via 💠 default ➜  aws dynamodb describe-table --table-name devops-table
{
    "Table": {
        "AttributeDefinitions": [
            {
                "AttributeName": "id",
                "AttributeType": "S"
            }
        ],
        "TableName": "devops-table",
        "KeySchema": [
            {
                "AttributeName": "id",
                "KeyType": "HASH"
            }
        ],
        "TableStatus": "ACTIVE",
        "CreationDateTime": 1784102425.506,
        "ProvisionedThroughput": {
            "LastIncreaseDateTime": 0.0,
            "LastDecreaseDateTime": 0.0,
            "NumberOfDecreasesToday": 0,
            "ReadCapacityUnits": 0,
            "WriteCapacityUnits": 0
        },
        "TableSizeBytes": 0,
        "ItemCount": 0,
        "TableArn": "arn:aws:dynamodb:us-east-1:000000000000:table/devops-table",
        "TableId": "ee574304-3f9a-4d4b-bf24-5d163a7957eb",
        "BillingModeSummary": {
            "BillingMode": "PAY_PER_REQUEST",
            "LastUpdateToPayPerRequestDateTime": 1784102425.506
        },
        "DeletionProtectionEnabled": false,
        "WarmThroughput": {
            "ReadUnitsPerSecond": 12000,
            "WriteUnitsPerSecond": 4000,
            "Status": "ACTIVE"
        }
    }
}

bob@iac-server ~/terraform via 💠 default ➜  


```

<img width="2232" height="1157" alt="image" src="https://github.com/user-attachments/assets/ad89b0ef-92de-49f0-9950-c154e3c412a6" />
<img width="2180" height="1167" alt="image" src="https://github.com/user-attachments/assets/8f2d757c-a756-441c-97ac-cd47232e6aa8" />

```sh

bob@iac-server ~/terraform via 💠 default ✖ terraform state list
aws_dynamodb_table.devops_table
aws_iam_policy.devops_readonly_policy
aws_iam_role.devops_role
aws_iam_role_policy_attachment.devops_policy_attach

bob@iac-server ~/terraform via 💠 default ➜  aws iam get-role --role-name devops-role
{
    "Role": {
        "Path": "/",
        "RoleName": "devops-role",
        "RoleId": "AROAQAAAAAAADG5KTGDU7",
        "Arn": "arn:aws:iam::000000000000:role/devops-role",
        "CreateDate": "2026-07-15T08:00:23.171820Z",
        "AssumeRolePolicyDocument": {
            "Statement": [
                {
                    "Action": "sts:AssumeRole",
                    "Effect": "Allow",
                    "Principal": {
                        "Service": "://amazonaws.com"
                    }
                }
            ],
            "Version": "2012-10-17"
        },
        "MaxSessionDuration": 3600,
        "RoleLastUsed": {}
    }
}

bob@iac-server ~/terraform via 💠 default ➜



bob@iac-server ~/terraform via 💠 default ➜  aws iam list-policies --scope Local
{
    "Policies": [
        {
            "PolicyName": "devops-readonly-policy",
            "PolicyId": "AVNVVFMXAG0VAQVZNT4U8",
            "Arn": "arn:aws:iam::000000000000:policy/devops-readonly-policy",
            "Path": "/",
            "DefaultVersionId": "v1",
            "AttachmentCount": 1,
            "IsAttachable": true,
            "CreateDate": "2026-07-15T08:05:51.535798Z",
            "UpdateDate": "2026-07-15T08:05:51.535799Z"
        }
    ]
}

bob@iac-server ~/terraform via 💠 default ➜




bob@iac-server ~/terraform via 💠 default ➜  aws iam get-policy --policy-arn arn:aws:iam::000000000000:policy/devops-readonly-policy
{
    "Policy": {
        "PolicyName": "devops-readonly-policy",
        "PolicyId": "AVNVVFMXAG0VAQVZNT4U8",
        "Arn": "arn:aws:iam::000000000000:policy/devops-readonly-policy",
        "Path": "/",
        "DefaultVersionId": "v1",
        "AttachmentCount": 1,
        "IsAttachable": true,
        "CreateDate": "2026-07-15T08:05:51.535798Z",
        "UpdateDate": "2026-07-15T08:05:51.535799Z",
        "Tags": []
    }
}

bob@iac-server ~/terraform via 💠 default ➜  


```


<img width="2217" height="1186" alt="image" src="https://github.com/user-attachments/assets/704d28d5-7f4b-4447-858d-791bc80a1e42" />

<img width="2376" height="1152" alt="image" src="https://github.com/user-attachments/assets/c893e0e8-3d32-480c-8f4a-e95615ff4ee5" />


<img width="2392" height="1217" alt="image" src="https://github.com/user-attachments/assets/0004bb70-5951-401b-a8cd-a3d1614637e4" />

<img width="2452" height="1200" alt="image" src="https://github.com/user-attachments/assets/b948ad6c-330d-464c-bb1f-da29f38112ec" />


















