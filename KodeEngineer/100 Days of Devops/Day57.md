# Day 57: Print Environment Variables

The Nautilus DevOps team is working on to setup some pre-requisites for an application that will send the greetings to different users.  
There is a sample deployment, that needs to be tested.  
Below is a scenario which needs to be configured on Kubernetes cluster.  
Please find below more details about it.

Create a pod named print-envars-greeting.  

Configure spec as, the container name should be print-env-container and use bash image.  

Create three environment variables:  

a. GREETING and its value should be Welcome to  
b. COMPANY and its value should be xFusionCorp  
c. GROUP and its value should be Group  

Use command ["/bin/sh", "-c", 'echo "$(GREETING) $(COMPANY) $(GROUP)"'] (please use this exact command), also set its restartPolicy policy to Never to avoid crash loop back.  

You can check the output using kubectl logs -f print-envars-greeting command.   

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.  

<img width="848" height="792" alt="image" src="https://github.com/user-attachments/assets/bd2d31e6-3aa4-486d-945a-0da7519d014f" />

