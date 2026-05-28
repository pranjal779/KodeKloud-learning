# Day 62: Manage Secrets in Kubernetes

[reference 1](https://medium.com/@janemils/kodekloud-engineer-day-62-manage-secrets-in-kubernetes-f2e406d70498)   
[reference 2](https://dev.to/wycliffealphus/100-days-of-devops-day-62-31he)   
[reference 3](https://chris-young.net/62-100-manage-secrets-in-kubernetes/)   
[reference 4](https://hashnode.com/posts/day-62-manage-secrets-in-kubernetes-100-days-of-devops/6a15321e7d85e6a1af3e38f1)   

The Nautilus DevOps team is working to deploy some tools in Kubernetes cluster.  
Some of the tools are licence based so that licence information needs to be stored securely within Kubernetes cluster.  
Therefore, the team wants to utilize Kubernetes secrets to store those secrets. Below you can find more details about the requirements:

1. We already have a secret key file ecommerce.txt under the /opt/ directory. Create a generic secret named ecommerce, it should contain the password/license-number present in ecommerce.txt file.
2. Also create a pod named secret-devops.
3. Configure pod's spec as container name should be secret-container-devops, image should be fedora with latest tag (remember to mention the tag with image). Use sleep command for container so that it remains in running state. Consume the created secret and mount it under /opt/cluster within the container.
4. To verify you can exec into the container secret-container-devops, to check the secret key under the mounted path /opt/cluster. Before hitting the Check button please make sure pod/pods are in running state, also validation can take some time to complete so keep patience.

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.

<img width="613" height="987" alt="image" src="https://github.com/user-attachments/assets/809ba59a-fde4-48f0-9af5-c7e0a9e9bfa9" />
<img width="627" height="827" alt="image" src="https://github.com/user-attachments/assets/6608ae10-c4c6-4589-aad4-8db273a83bb0" />
<img width="650" height="961" alt="image" src="https://github.com/user-attachments/assets/cf65f865-7dad-4b36-8af3-2352df1adf6f" />


```sh
thor@jump-host ~$ ls /opt/
cni            containerd     ecommerce.txt
thor@jump-host ~$ cat /opt/ecommerce.txt
5ecur3
thor@jump-host ~$ 
thor@jump-host ~$ 
thor@jump-host ~$ kubectl create secret generic ecommerce --from-file=/opt/ecommerce.txt
secret/ecommerce created
thor@jump-host ~$ kubectl get service
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.43.0.1    <none>        443/TCP   42m
thor@jump-host ~$ 
thor@jump-host ~$ kubectl describe secret
Name:         ecommerce
Namespace:    default
Labels:       <none>
Annotations:  <none>

Type:  Opaque

Data
====
ecommerce.txt:  7 bytes
thor@jump-host ~$

```

<img width="2171" height="1127" alt="image" src="https://github.com/user-attachments/assets/e5c441f3-16d3-47ba-9542-221057df6cd2" />
<img width="1767" height="1178" alt="image" src="https://github.com/user-attachments/assets/2a6c0201-54d5-4bf7-9f6c-44d1f268c069" />

```sh
thor@jump-host ~$ 
thor@jump-host ~$ vi pod.yaml
thor@jump-host ~$ cat pod.yaml 
apiVersion: v1
kind: Pod
metadata:
  name: secret-devops
spec:
  containers:
    - name: secret-container-devops
      image: fedora:latest
      command: ["/bin/bash", "-c", "sleep"]
      volumeMounts:
        - name: secret-volume
          readOnly: true
          mountPath: /opt/cluster

  volumes:
    - name: secret-volume
      secret:
        secretName: secret-devops
thor@jump-host ~$

thor@jump-host ~$ kubectl apply -f pod.yaml 
pod/secret-devops created
thor@jump-host ~$ kubectl get pods
NAME            READY   STATUS              RESTARTS   AGE
secret-devops   0/1     ContainerCreating   0          7s
thor@jump-host ~$

thor@jump-host ~$ kubectl describe pods
Name:             secret-devops
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.97.158
Start Time:       Thu, 28 May 2026 13:05:02 +0000
Labels:           <none>
Annotations:      <none>
Status:           Pending
IP:               
IPs:              <none>
Containers:
  secret-container-devops:
    Container ID:  
    Image:         fedora:latest
    Image ID:      
    Port:          <none>
    Host Port:     <none>
    Command:
      /bin/bash
      -c
      sleep
    State:          Waiting
      Reason:       ContainerCreating
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /opt/cluster from secret-volume (ro)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-qcfnp (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   False 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  secret-volume:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  secret-devops
    Optional:    false
  kube-api-access-qcfnp:
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
  Type     Reason       Age                From               Message
  ----     ------       ----               ----               -------
  Normal   Scheduled    98s                default-scheduler  Successfully assigned default/secret-devops to jump-host
  Warning  FailedMount  34s (x8 over 98s)  kubelet            MountVolume.SetUp failed for volume "secret-volume" : secret "secret-devops" not found
thor@jump-host ~$



```


```sh
thor@jump-host ~$ ls /opt/
cni            containerd     ecommerce.txt
thor@jump-host ~$ cat /opt/ecommerce.txt
5ecur3
thor@jump-host ~$ 
thor@jump-host ~$ 
thor@jump-host ~$ kubectl create secret generic ecommerce --from-file=/opt/ecommerce.txt
secret/ecommerce created
thor@jump-host ~$ kubectl get service
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.43.0.1    <none>        443/TCP   42m
thor@jump-host ~$ 
thor@jump-host ~$ kubectl describe secret
Name:         ecommerce
Namespace:    default
Labels:       <none>
Annotations:  <none>

Type:  Opaque

Data
====
ecommerce.txt:  7 bytes
thor@jump-host ~$ 
thor@jump-host ~$ vi pod.yaml
thor@jump-host ~$ cat pod.yaml 
apiVersion: v1
kind: Pod
metadata:
  name: secret-devops
spec:
  containers:
    - name: secret-container-devops
      image: fedora:latest
      command: ["/bin/bash", "-c", "sleep"]
      volumeMounts:
        - name: secret-volume
          readOnly: true
          mountPath: /opt/cluster

  volumes:
    - name: secret-volume
      secret:
        secretName: secret-devops
thor@jump-host ~$ kubectl apply -f pod.yaml 
pod/secret-devops created
thor@jump-host ~$ kubectl get pods
NAME            READY   STATUS              RESTARTS   AGE
secret-devops   0/1     ContainerCreating   0          7s
thor@jump-host ~$ kubectl describe pods
Name:             secret-devops
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.97.158
Start Time:       Thu, 28 May 2026 13:05:02 +0000
Labels:           <none>
Annotations:      <none>
Status:           Pending
IP:               
IPs:              <none>
Containers:
  secret-container-devops:
    Container ID:  
    Image:         fedora:latest
    Image ID:      
    Port:          <none>
    Host Port:     <none>
    Command:
      /bin/bash
      -c
      sleep
    State:          Waiting
      Reason:       ContainerCreating
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /opt/cluster from secret-volume (ro)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-qcfnp (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   False 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  secret-volume:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  secret-devops
    Optional:    false
  kube-api-access-qcfnp:
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
  Type     Reason       Age                From               Message
  ----     ------       ----               ----               -------
  Normal   Scheduled    98s                default-scheduler  Successfully assigned default/secret-devops to jump-host
  Warning  FailedMount  34s (x8 over 98s)  kubelet            MountVolume.SetUp failed for volume "secret-volume" : secret "secret-devops" not found
thor@jump-host ~$ kubectl exec -it secret-devops -- bash
error: Internal error occurred: unable to upgrade connection: container not found ("secret-container-devops")
thor@jump-host ~$ kubectl exec -it secret-container-devops -- /bin/bash
Error from server (NotFound): pods "secret-container-devops" not found
thor@jump-host ~$ kubectl exec -it secret-devops -c secret-container-devops -- bash
error: Internal error occurred: unable to upgrade connection: container not found ("secret-container-devops")
thor@jump-host ~$ kubectl get pods
NAME            READY   STATUS              RESTARTS   AGE
secret-devops   0/1     ContainerCreating   0          5m8s
thor@jump-host ~$ kubectl exec -it secret-devops -- bash
error: Internal error occurred: unable to upgrade connection: container not found ("secret-container-devops")
thor@jump-host ~$ cat pod.yaml 
apiVersion: v1
kind: Pod
metadata:
  name: secret-devops
spec:
  containers:
    - name: secret-container-devops
      image: fedora:latest
      command: ["/bin/bash", "-c", "sleep"]
      volumeMounts:
        - name: secret-volume
          readOnly: true
          mountPath: /opt/cluster

  volumes:
    - name: secret-volume
      secret:
        secretName: secret-devops
thor@jump-host ~$ 
thor@jump-host ~$ 
thor@jump-host ~$

```
