# Resource Dependencies

<img width="2378" height="1131" alt="image" src="https://github.com/user-attachments/assets/35f53b36-709c-48fe-bfe1-e7346727a22f" />
<img width="2022" height="870" alt="image" src="https://github.com/user-attachments/assets/15fc01da-ccaf-443b-ba95-9b0c5664df6c" />
<img width="1967" height="952" alt="image" src="https://github.com/user-attachments/assets/15b095e6-741f-44cb-a70e-d331ae14aa7f" />
<img width="1905" height="970" alt="image" src="https://github.com/user-attachments/assets/91d187ed-8208-4b23-ad4f-aee95578aeec" />
<img width="1855" height="947" alt="image" src="https://github.com/user-attachments/assets/0c49615d-8f47-46a2-80f9-1a96e1ba1a96" />


# Lab: Resource Dependencies
<img width="2201" height="995" alt="image" src="https://github.com/user-attachments/assets/229c530a-fd0f-41a3-8cb0-37cd1475fce3" />
<img width="2458" height="951" alt="image" src="https://github.com/user-attachments/assets/3ca0f12b-2775-461e-8c54-39b6dc3e61a1" />
<img width="2223" height="955" alt="image" src="https://github.com/user-attachments/assets/d326dc7e-14f0-463b-8bbe-afa4a03143ef" />
<img width="2255" height="980" alt="image" src="https://github.com/user-attachments/assets/ea6d58e4-f2a0-4b1a-bae9-72339274e484" />
<img width="2095" height="1070" alt="image" src="https://github.com/user-attachments/assets/9d789836-fb2f-458b-a2fe-c38a77b6515a" />
<img width="2526" height="1181" alt="image" src="https://github.com/user-attachments/assets/cf6e43bc-e92d-4f7e-aac7-d1da2337ed7a" />
<img width="2497" height="1208" alt="image" src="https://github.com/user-attachments/assets/09b488cb-1e3b-4c3f-8c6b-9b8f9b7980a4" />
<img width="2532" height="1215" alt="image" src="https://github.com/user-attachments/assets/e64363b4-33ad-4ff9-91fc-e77f03982c26" />
<img width="2487" height="1215" alt="image" src="https://github.com/user-attachments/assets/c089a54b-fb8f-4b51-99a2-076904dba59a" />
<img width="2515" height="1182" alt="image" src="https://github.com/user-attachments/assets/7b1557fa-5b8c-4d4a-8d8d-763809d7e214" />
<img width="2530" height="1197" alt="image" src="https://github.com/user-attachments/assets/9294fb12-eba6-48b4-8413-ff4493d16253" />
<img width="2507" height="1138" alt="image" src="https://github.com/user-attachments/assets/378e2c15-4b2a-4f6f-baa5-b17789442e1b" />
<img width="2532" height="1200" alt="image" src="https://github.com/user-attachments/assets/7913162b-6399-4c93-a71d-0bcc0a2c7905" />
<img width="2361" height="1182" alt="image" src="https://github.com/user-attachments/assets/86dce7e8-944d-4f35-bf8f-4c9d88d5c61d" />
<img width="1017" height="580" alt="image" src="https://github.com/user-attachments/assets/392b83a3-1602-4b09-8c54-9cfc5864b9af" />
<img width="2513" height="1152" alt="image" src="https://github.com/user-attachments/assets/63d5d037-fdcd-41ef-ae96-2b057f524a8e" />
<img width="2461" height="1176" alt="image" src="https://github.com/user-attachments/assets/e79356b7-4b08-474d-a094-715d9f40fabe" />
<img width="2416" height="1200" alt="image" src="https://github.com/user-attachments/assets/4a16e05d-fdab-4375-8e6d-d127f820dfd6" />
<img width="2507" height="1172" alt="image" src="https://github.com/user-attachments/assets/d0c1f82e-4656-4420-98e1-09d59a50c578" />



```sh
root@iac-server ~/terraform-projects/explicit-dependency via 💠 default on ☁️  (us-east-1) ➜  terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  + create

Terraform will perform the following actions:

  # local_file.krill will be created
  + resource "local_file" "krill" {
      + content              = "krill"
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = "/root/krill"
      + id                   = (known after apply)
    }

  # local_file.whale will be created
  + resource "local_file" "whale" {
      + content              = "whale"
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = "/root/whale"
      + id                   = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.
local_file.whale: Creating...
local_file.krill: Creating...
local_file.whale: Creation complete after 0s [id=1769e230f7885e9153bb0e4fe515ee1d08fdab0b]
local_file.krill: Creation complete after 0s [id=893a03dee4098efabc1d4a97a2fd6cc568ff731c]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

root@iac-server ~/terraform-projects/explicit-dependency via 💠 default on ☁️  (us-east-1) ➜
```

<img width="2330" height="1257" alt="image" src="https://github.com/user-attachments/assets/635630e6-0c85-44b2-b06f-02ee0740fd49" />
<img width="2511" height="1190" alt="image" src="https://github.com/user-attachments/assets/62fbb1d2-d094-47e2-b1ea-1302a73f972d" />
<img width="2505" height="1195" alt="image" src="https://github.com/user-attachments/assets/d11fc13b-fdb4-4931-8fa5-4c5155f32b64" />
<img width="2526" height="1207" alt="image" src="https://github.com/user-attachments/assets/4494dfe7-665c-40cb-aca9-333ae7962823" />
<img width="2413" height="1126" alt="image" src="https://github.com/user-attachments/assets/a3d57f5c-e570-4a16-9382-71f17b5d391d" />

