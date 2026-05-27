# Day 57: Print Environment Variables

[reference](https://medium.com/@janemils/kodekloud-engineer-day-57-print-environment-variables-817572cb5e80)

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

```sh

thor@jump-host ~$ vi print-envars-greeting.yaml
thor@jump-host ~$ cat print-envars-greeting.yaml 
apiVersion: v1
kind: Pod
metadata:
  name: print-env-container
spec:
  containers:
    - name: print-env-container
      image: bash:latest
      command: ["/bin/sh", "-c", 'echo "$(GREETING) $(COMPANY) $(GROUP)"']
      env:
        - name: GREETING
          value: "Welcome to"
        - name: COMPANY
          value: "xFusionCorp"
        - name: GROUP
          value: "Industries"       
  restartPolicy: Never
thor@jump-host ~$ kubectl apply -f print-envars-greeting.yaml 
pod/print-env-container created
thor@jump-host ~$

thor@jump-host ~$ kubectl get pods
NAME                  READY   STATUS      RESTARTS   AGE
print-env-container   0/1     Completed   0          21s
thor@jump-host ~$ kubectl describe pods
Name:             print-env-container
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.13.59
Start Time:       Wed, 27 May 2026 04:26:32 +0000
Labels:           <none>
Annotations:      <none>
Status:           Succeeded
IP:               10.22.0.9
IPs:
  IP:  10.22.0.9
Containers:
  print-env-container:
    Container ID:  containerd://6f95915363793db81c95b6f1477eb07713affa2fe10a3637e35ceb78f8c59d31
    Image:         bash:latest
    Image ID:      docker.io/library/bash@sha256:38697a8e277c4b61f75193f003db16590eda7b096577dd1c2be53afa207954e7
    Port:          <none>
    Host Port:     <none>
    Command:
      /bin/sh
      -c
      echo "$(GREETING) $(COMPANY) $(GROUP)"
    State:          Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Wed, 27 May 2026 04:26:34 +0000
      Finished:     Wed, 27 May 2026 04:26:34 +0000
    Ready:          False
    Restart Count:  0
    Environment:
      GREETING:  Welcome to
      COMPANY:   xFusionCorp
      GROUP:     Industries
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-h7mx6 (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   False 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-h7mx6:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    Optional:                false
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  39s   default-scheduler  Successfully assigned default/print-env-container to jump-host
  Normal  Pulling    39s   kubelet            Pulling image "bash:latest"
  Normal  Pulled     38s   kubelet            Successfully pulled image "bash:latest" in 1.074s (1.074s including waiting). Image size: 6826563 bytes.
  Normal  Created    38s   kubelet            Created container: print-env-container
  Normal  Started    38s   kubelet            Started container print-env-container
thor@jump-host ~$

thor@jump-host ~$ ls
print-envars-greeting.yaml
thor@jump-host ~$ kubectl logs -f print-envars-greeting
error: error from server (NotFound): pods "print-envars-greeting" not found in namespace "default"
thor@jump-host ~$ kubectl get pods
NAME                  READY   STATUS      RESTARTS   AGE
print-env-container   0/1     Completed   0          3m37s
thor@jump-host ~$

thor@jump-host ~$ kubectl delete pods
error: resource(s) were provided, but no name was specified
thor@jump-host ~$ kubectl delete pods print-env-container 
pod "print-env-container" deleted from default namespace
thor@jump-host ~$ kubectl get pods
No resources found in default namespace.
thor@jump-host ~$


```

## made mistake redoing the tasks

```sh
thor@jump-host ~$ ls
print-envars-greeting.yaml
thor@jump-host ~$ kubectl logs -f print-envars-greeting
error: error from server (NotFound): pods "print-envars-greeting" not found in namespace "default"
thor@jump-host ~$ kubectl get pods
NAME                  READY   STATUS      RESTARTS   AGE
print-env-container   0/1     Completed   0          3m37s
thor@jump-host ~$ kubectl delete pods
error: resource(s) were provided, but no name was specified
thor@jump-host ~$ kubectl delete pods print-env-container 
pod "print-env-container" deleted from default namespace
thor@jump-host ~$ kubectl get pods
No resources found in default namespace.
thor@jump-host ~$ vi print-envars-greeting.yaml 
thor@jump-host ~$
thor@jump-host ~$ ls
print-envars-greeting.yaml
thor@jump-host ~$ kubectl logs -f print-envars-greeting
error: error from server (NotFound): pods "print-envars-greeting" not found in namespace "default"
thor@jump-host ~$ kubectl get pods
NAME                  READY   STATUS      RESTARTS   AGE
print-env-container   0/1     Completed   0          3m37s
thor@jump-host ~$ kubectl delete pods
error: resource(s) were provided, but no name was specified
thor@jump-host ~$ kubectl delete pods print-env-container 
pod "print-env-container" deleted from default namespace
thor@jump-host ~$ kubectl get pods
No resources found in default namespace.
thor@jump-host ~$ vi print-envars-greeting.yaml 
thor@jump-host ~$

thor@jump-host ~$ kubectl get pod print-envars-greeting -o jsonpath='{.spec.containers[*].name}'
print-env-containerthor@jump-host ~$ ls
print-envars-greeting.yaml
thor@jump-host ~$

thor@jump-host ~$ kubectl logs -f print-envars-greeting 
Welcome to xFusionCorp Industries
thor@jump-host ~$

thor@jump-host ~$ history
    1  vi print-envars-greeting.yaml
    2  cat print-envars-greeting.yaml 
    3  kubectl apply -f print-envars-greeting.yaml 
    4  vi print-envars-greeting.yaml
    5  cat print-envars-greeting.yaml 
    6  kubectl apply -f print-envars-greeting.yaml 
    7  kubectl get pods
    8  kubectl describe pods
    9  ls
   10  kubectl logs -f print-envars-greeting
   11  kubectl get pods
   12  kubectl delete pods
   13  kubectl delete pods print-env-container 
   14  kubectl get pods
   15  vi print-envars-greeting.yaml 
   16  kubectl apply -f print-envars-greeting.yaml 
   17  kubectl get pods
   18  kubectl describe pods
   19  kubectl get pods
   20  kubectl get pod print-envars-greeting -o jsonpath='{.spec.containers[*].name}'
   21  ls
   22  kubectl logs -f print-envars-greeting 
   23  history
thor@jump-host ~$ 

```

<img width="2367" height="1162" alt="image" src="https://github.com/user-attachments/assets/098bdd98-5044-4dfd-8903-0c56fa918591" />
<img width="2355" height="1183" alt="image" src="https://github.com/user-attachments/assets/b28ad7e6-fbfb-4b1d-8bd4-eb0ac9e83ec2" />
