# Day 97: Create IAM Policy Using Terraform

When establishing infrastructure on the AWS cloud, Identity and Access Management (IAM) is among the first and most critical services to configure. IAM facilitates the creation and management of user accounts, groups, roles, policies, and other access controls. The Nautilus DevOps team is currently in the process of configuring these resources and has outlined the following requirements.

Create an IAM policy named iampolicy_anita in us-east-1 region using Terraform. It must allow read-only access to the EC2 console, i.e., this policy must allow users to view all instances, AMIs, and snapshots in the Amazon EC2 console.

The Terraform working directory is /home/bob/terraform. Create the main.tf file (do not create a different .tf file) to accomplish this task.

Note: Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

<img width="827" height="597" alt="image" src="https://github.com/user-attachments/assets/8ea1754f-5ea9-43d3-9fcc-1fa8f900cbe0" />

---

<img width="2121" height="1166" alt="image" src="https://github.com/user-attachments/assets/6136d11e-87ad-46e7-ba1b-231774cae5a1" />


```hcl
resource "aws_iam_policy" "iampolicy_anita" {
    name = "iampolicy_anita"
    description = "task Day97 Read only acess"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"

                Action = [
                    "ec2:DescribeInstances",
                    "ec2:DescribeImages",
                    "ec2:DescribeSnapshots"
                ],

                Resource = "*"
            },
        ]
    })
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

  # aws_iam_policy.iampolicy_anita will be created
  + resource "aws_iam_policy" "iampolicy_anita" {
      + arn              = (known after apply)
      + attachment_count = (known after apply)
      + description      = "task Day97 Read only acess"
      + id               = (known after apply)
      + name             = "iampolicy_anita"
      + name_prefix      = (known after apply)
      + path             = "/"
      + policy           = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "ec2:DescribeInstances",
                          + "ec2:DescribeImages",
                          + "ec2:DescribeSnapshots",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + policy_id        = (known after apply)
      + tags_all         = (known after apply)
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

  # aws_iam_policy.iampolicy_anita will be created
  + resource "aws_iam_policy" "iampolicy_anita" {
      + arn              = (known after apply)
      + attachment_count = (known after apply)
      + description      = "task Day97 Read only acess"
      + id               = (known after apply)
      + name             = "iampolicy_anita"
      + name_prefix      = (known after apply)
      + path             = "/"
      + policy           = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "ec2:DescribeInstances",
                          + "ec2:DescribeImages",
                          + "ec2:DescribeSnapshots",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + policy_id        = (known after apply)
      + tags_all         = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_policy.iampolicy_anita: Creating...
aws_iam_policy.iampolicy_anita: Creation complete after 0s [id=arn:aws:iam::000000000000:policy/iampolicy_anita]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

bob@iac-server ~/terraform via 💠 default ➜  terraform show
# aws_iam_policy.iampolicy_anita:
resource "aws_iam_policy" "iampolicy_anita" {
    arn              = "arn:aws:iam::000000000000:policy/iampolicy_anita"
    attachment_count = 0
    description      = "task Day97 Read only acess"
    id               = "arn:aws:iam::000000000000:policy/iampolicy_anita"
    name             = "iampolicy_anita"
    name_prefix      = null
    path             = "/"
    policy           = jsonencode(
        {
            Statement = [
                {
                    Action   = [
                        "ec2:DescribeInstances",
                        "ec2:DescribeImages",
                        "ec2:DescribeSnapshots",
                    ]
                    Effect   = "Allow"
                    Resource = "*"
                },
            ]
            Version   = "2012-10-17"
        }
    )
    policy_id        = "AR8XZX0B4F68WTFNJ018G"
    tags_all         = {}
}

bob@iac-server ~/terraform via 💠 default ➜  terraform state list
aws_iam_policy.iampolicy_anita

bob@iac-server ~/terraform via 💠 default ➜  aws iam list-policies \
--query "Policies[?PolicyName=='iampolicy_anita']"
[
    {
        "PolicyName": "iampolicy_anita",
        "PolicyId": "AR8XZX0B4F68WTFNJ018G",
        "Arn": "arn:aws:iam::000000000000:policy/iampolicy_anita",
        "Path": "/",
        "DefaultVersionId": "v1",
        "AttachmentCount": 0,
        "IsAttachable": true,
        "CreateDate": "2026-07-14T18:35:39.967924Z",
        "UpdateDate": "2026-07-14T18:35:39.967925Z"
    }
]

bob@iac-server ~/terraform via 💠 default ➜

```


<img width="1295" height="1082" alt="image" src="https://github.com/user-attachments/assets/8b44f22c-7a08-45ec-a312-54ffe0a6d9cf" />

<img width="1377" height="1107" alt="image" src="https://github.com/user-attachments/assets/607346a2-78df-411f-ac50-664201e74363" />

<img width="1406" height="1055" alt="image" src="https://github.com/user-attachments/assets/8fc218b3-33bc-4f39-9bd1-8eb1dcc48e33" />

<img width="1405" height="1072" alt="image" src="https://github.com/user-attachments/assets/c843e682-cee6-4856-a81b-3fdcdb1cba68" />

<img width="2116" height="1165" alt="image" src="https://github.com/user-attachments/assets/e37a8141-d3df-4724-b011-4e9cfe9f4034" />

<img width="2387" height="1212" alt="image" src="https://github.com/user-attachments/assets/24b5b835-3191-41c5-92a8-480c54999a58" />

<img width="2252" height="1175" alt="image" src="https://github.com/user-attachments/assets/ca53cb36-844e-49d4-a9c0-05c948e80882" />

<img width="2295" height="1216" alt="image" src="https://github.com/user-attachments/assets/aab3d1df-474b-4fbf-9af8-ce3423ed9169" />











