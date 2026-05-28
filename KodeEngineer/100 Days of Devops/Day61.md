# Day 61: Init Containers in Kubernetes

[reference 1](https://chris-young.net/61-100-init-containers-in-kubernetes/)  
[reference 2](https://tundedamian.medium.com/day-61-of-100-days-of-devops-using-init-containers-in-kubernetes-deployments-1dd4383504d6)
[reference 3](https://hashnode.com/posts/day-61-init-containers-in-kubernetes-100-days-of-devops/6a1451757d85e6a1afdcc94c)  
[reference 4](https://medium.com/@janemils/kodekloud-engineer-day-61-init-containers-in-kubernetes-7b9c1862c8a2)

[Volumes Official Kubernetes Doc for reference](https://kubernetes.io/docs/concepts/storage/volumes/)

There are some applications that need to be deployed on Kubernetes cluster and these apps have some pre-requisites where some configurations need to be changed before deploying the app container.   
Some of these changes cannot be made inside the images so the DevOps team has come up with a solution to use init containers to perform these tasks during deployment.  
Below is a sample scenario that the team is going to test first.

1. Create a Deployment named as ic-deploy-xfusion.

2. Configure spec as replicas should be 1, labels app should be ic-xfusion, template's metadata lables app should be the same ic-xfusion.

3. The initContainers should be named as ic-msg-xfusion, use image fedora with latest tag and use command '/bin/bash', '-c' and 'echo Init Done - Welcome to xFusionCorp Industries > /ic/ecommerce'. The volume mount should be named as ic-volume-xfusion and mount path should be /ic.

4. Main container should be named as ic-main-xfusion, use image fedora with latest tag and use command '/bin/bash', '-c' and 'while true; do cat /ic/ecommerce; sleep 5; done'. The volume mount should be named as ic-volume-xfusion and mount path should be /ic.

5. Volume to be named as ic-volume-xfusion and it should be an emptyDir type.

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.

<img width="803" height="915" alt="image" src="https://github.com/user-attachments/assets/514f1caa-7120-4a7c-b97d-050a82f4d318" />

<img width="847" height="850" alt="image" src="https://github.com/user-attachments/assets/15b2d877-ee1a-4f85-b91d-54f4523ac9a9" />
<img width="1413" height="868" alt="image" src="https://github.com/user-attachments/assets/065523c6-b430-4641-a5ae-7a8f73750288" />
<img width="1423" height="990" alt="image" src="https://github.com/user-attachments/assets/54a8f967-6337-4a0e-b0f6-629f07f4f600" />
<img width="1431" height="1125" alt="image" src="https://github.com/user-attachments/assets/ed48cf1a-d763-43d3-a1f0-824b2450d3f5" />
<img width="1437" height="1012" alt="image" src="https://github.com/user-attachments/assets/9ee5434f-f878-4cfb-920b-a90d1edf58b3" />
<img width="1457" height="403" alt="image" src="https://github.com/user-attachments/assets/09e9e822-77b2-478a-9c3e-1c528c5ff221" />

<img width="2257" height="1137" alt="image" src="https://github.com/user-attachments/assets/ee8604aa-51a5-410e-a780-20d0e1da527d" />
<img width="2272" height="1187" alt="image" src="https://github.com/user-attachments/assets/a3ec5677-765d-449c-abc3-3abc6969a4ae" />

```sh
thor@jump-host ~$ vi deploymentDay61.yaml
thor@jump-host ~$ cat deploymentDay61.yaml 
apiVersion: v1
kind: Deployment
metadata:
  name: ic-deploy-xfusion
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ic-xfusion
  template:
    metadata:
      labels:
        app: ic-xfusion
    spec:
      initContainers:
        - name: ic-msg-xfusion
          image: fedora:latest
          command: ['/bin/bash', '-c', 'echo Init Done - Welcome to xFusionCorp Industries > /ic/ecommerce']
          volumeMounts:
            - name: ic-volume-xfusion
              path: /ic
      containers:
        - name: ic-main-xfusion
          image: fedora:latest
          command: ['/bin/bash', '-c', 'while true; do cat /ic/ecommerce; sleep 5; done']
          volumeMounts:
            - name: volume-xfusion
              path: /ic
      volumes:
        - name: ic-volume-xfusion
          emptyDir: {}

  
thor@jump-host ~$ 

  
thor@jump-host ~$ kubectl apply -f deploymentDay61.yaml 
error: resource mapping not found for name: "ic-deploy-xfusion" namespace: "" from "deploymentDay61.yaml": no matches for kind "Deployment" in version "v1"
ensure CRDs are installed first
thor@jump-host ~$ 


```
<img width="2490" height="1233" alt="image" src="https://github.com/user-attachments/assets/55522acf-a78c-40f5-be85-ea72f9f0edfc" />
<img width="2286" height="1173" alt="image" src="https://github.com/user-attachments/assets/4fc09da2-0b0f-4852-b1db-fb557df7f132" />


```sh
thor@jump-host ~$ kubectl apply -f deploymentDay61.yaml
Error from server (BadRequest): error when creating "deploymentDay61.yaml": Deployment in version "v1" cannot be handled as a Deployment: strict decoding error: unknown field "spec.template.spec.containers[0].volumeMounts[0].path", unknown field "spec.template.spec.initContainers[0].volumeMounts[0].path"
thor@jump-host ~$

thor@jump-host ~$ vi deploymentDay61.yaml 
thor@jump-host ~$ cat deploymentDay61.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ic-deploy-xfusion
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ic-xfusion
  template:
    metadata:
      labels:
        app: ic-xfusion
    spec:
      initContainers:
        - name: ic-msg-xfusion
          image: fedora:latest
          command: ['/bin/bash', '-c', 'echo Init Done - Welcome to xFusionCorp Industries > /ic/ecommerce']
          volumeMounts:
            - name: ic-volume-xfusion
              path: /ic
      containers:
        - name: ic-main-xfusion
          image: fedora:latest
          command: ['/bin/bash', '-c', 'while true; do cat /ic/ecommerce; sleep 5; done']
          volumeMounts:
            - name: volume-xfusion
              path: /ic
      volumes:
        - name: ic-volume-xfusion
          emptyDir: {}

  
thor@jump-host ~$ kubectl apply -f deploymentDay61.yaml \
> ^C
thor@jump-host ~$ ^C
thor@jump-host ~$ kubectl apply -f deploymentDay61.yaml
Error from server (BadRequest): error when creating "deploymentDay61.yaml": Deployment in version "v1" cannot be handled as a Deployment: strict decoding error: unknown field "spec.template.spec.containers[0].volumeMounts[0].path", unknown field "spec.template.spec.initContainers[0].volumeMounts[0].path"
thor@jump-host ~$




```

<img width="2351" height="1157" alt="image" src="https://github.com/user-attachments/assets/a001da10-84e3-448f-9dfd-29bc171fd71d" />
<img width="2261" height="1193" alt="image" src="https://github.com/user-attachments/assets/25a2e228-a78a-4063-83d5-d3a9e55aaeb7" />

```sh
thor@jump-host ~$ vi deploymentDay61.yaml 
thor@jump-host ~$ cat deploymentDay61.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ic-deploy-xfusion
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ic-xfusion
  template:
    metadata:
      labels:
        app: ic-xfusion
    spec:
      initContainers:
        - name: ic-msg-xfusion
          image: fedora:latest
          command: ['/bin/bash', '-c', 'echo Init Done - Welcome to xFusionCorp Industries > /ic/ecommerce']
          volumeMounts:
            - name: ic-volume-xfusion
              mountPath: /ic
      containers:
        - name: ic-main-xfusion
          image: fedora:latest
          command: ['/bin/bash', '-c', 'while true; do cat /ic/ecommerce; sleep 5; done']
          volumeMounts:
            - name: volume-xfusion
             mountPath: /ic
      volumes:
        - name: ic-volume-xfusion
          emptyDir: {}

  
thor@jump-host ~$ kubectl apply -f deploymentDay61.yaml 
error: error parsing deploymentDay61.yaml: error converting YAML to JSON: yaml: line 27: did not find expected '-' indicator
thor@jump-host ~$

thor@jump-host ~$ vi deploymentDay61.yaml 
thor@jump-host ~$ cat deploymentDay61.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ic-deploy-xfusion
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ic-xfusion
  template:
    metadata:
      labels:
        app: ic-xfusion
    spec:
      initContainers:
        - name: ic-msg-xfusion
          image: fedora:latest
          command: ['/bin/bash', '-c', 'echo Init Done - Welcome to xFusionCorp Industries > /ic/ecommerce']
          volumeMounts:
            - name: ic-volume-xfusion
              mountPath: /ic
      containers:
        - name: ic-main-xfusion
          image: fedora:latest
          command: ['/bin/bash', '-c', 'while true; do cat /ic/ecommerce; sleep 5; done']
          volumeMounts:
            - name: volume-xfusion
              mountPath: /ic
      volumes:
        - name: ic-volume-xfusion
          emptyDir: {}

  
thor@jump-host ~$
thor@jump-host ~$ vi deploymentDay61.yaml 
thor@jump-host ~$ cat deploymentDay61.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ic-deploy-xfusion
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ic-xfusion
  template:
    metadata:
      labels:
        app: ic-xfusion
    spec:
      initContainers:
        - name: ic-msg-xfusion
          image: fedora:latest
          command: ['/bin/bash', '-c', 'echo Init Done - Welcome to xFusionCorp Industries > /ic/ecommerce']
          volumeMounts:
            - name: ic-volume-xfusion
              mountPath: /ic
      containers:
        - name: ic-main-xfusion
          image: fedora:latest
          command: ['/bin/bash', '-c', 'while true; do cat /ic/ecommerce; sleep 5; done']
          volumeMounts:
            - name: volume-xfusion
              mountPath: /ic
      volumes:
        - name: ic-volume-xfusion
          emptyDir: {}

  
thor@jump-host ~$ kubectl apply -f deploymentDay61.yaml 
The Deployment "ic-deploy-xfusion" is invalid: spec.template.spec.containers[0].volumeMounts[0].name: Not found: "volume-xfusion"
thor@jump-host ~$




```

<img width="2375" height="1175" alt="image" src="https://github.com/user-attachments/assets/2db3c54b-c9e4-4010-af7c-88960dbe6f92" />

<img width="2391" height="1185" alt="image" src="https://github.com/user-attachments/assets/95126fda-116a-4147-987d-ed1a818083ff" />

```sh
thor@jump-host ~$ vi deploymentDay61.yaml 
thor@jump-host ~$ cat deploymentDay61.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ic-deploy-xfusion
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ic-xfusion
  template:
    metadata:
      labels:
        app: ic-xfusion
    spec:
      initContainers:
        - name: ic-msg-xfusion
          image: fedora:latest
          command: ['/bin/bash', '-c', 'echo Init Done - Welcome to xFusionCorp Industries > /ic/ecommerce']
          volumeMounts:
            - name: ic-volume-xfusion
              mountPath: /ic
      containers:
        - name: ic-main-xfusion
          image: fedora:latest
          command: ['/bin/bash', '-c', 'while true; do cat /ic/ecommerce; sleep 5; done']
          volumeMounts:
            - name: volume-xfusion
              mountPath: /ic
      volumes:
        - name: ic-volume-xfusion
          emptyDir: {}

  
thor@jump-host ~$ kubectl apply -f deploymentDay61.yaml 
The Deployment "ic-deploy-xfusion" is invalid: spec.template.spec.containers[0].volumeMounts[0].name: Not found: "volume-xfusion"
thor@jump-host ~$



```

<img width="2252" height="1138" alt="image" src="https://github.com/user-attachments/assets/fa003f72-4faa-4850-8daa-6d1183e3398a" />

```sh
thor@jump-host ~$ kubectl apply -f deploymentDay61.yaml 
The Deployment "ic-deploy-xfusion" is invalid: spec.template.spec.containers[0].volumeMounts[0].name: Not found: "volume-xfusion"
thor@jump-host ~$ vi deploymentDay61.yaml 
thor@jump-host ~$ vi deploymentDay61.yaml 
thor@jump-host ~$ cat deploymentDay61.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ic-deploy-xfusion
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ic-xfusion
  template:
    metadata:
      labels:
        app: ic-xfusion
    spec:
      initContainers:
        - name: ic-msg-xfusion
          image: fedora:latest
          command: ['/bin/bash', '-c', 'echo Init Done - Welcome to xFusionCorp Industries > /ic/ecommerce']
          volumeMounts:
            - name: ic-volume-xfusion
              mountPath: /ic
      containers:
        - name: ic-main-xfusion
          image: fedora:latest
          command: ['/bin/bash', '-c', 'while true; do cat /ic/ecommerce; sleep 5; done']
          volumeMounts:
            - name: ic-volume-xfusion
              mountPath: /ic
      volumes:
        - name: ic-volume-xfusion
          emptyDir: {}

  
thor@jump-host ~$ kubectl apply -f deploymentDay61.yaml 
deployment.apps/ic-deploy-xfusion created
thor@jump-host ~$ 

```

<img width="2392" height="1185" alt="image" src="https://github.com/user-attachments/assets/ed915a0c-96c1-4262-a4af-aa5a37319b1f" />

```sh

thor@jump-host ~$ kubectl apply -f deploymentDay61.yaml 
deployment.apps/ic-deploy-xfusion created
thor@jump-host ~$ kubectl get deploy
NAME                READY   UP-TO-DATE   AVAILABLE   AGE
ic-deploy-xfusion   1/1     1            1           50s
thor@jump-host ~$
thor@jump-host ~$ kubectl get pods
NAME                                READY   STATUS    RESTARTS   AGE
ic-deploy-xfusion-8d8fbd48f-dlq9r   1/1     Running   0          70s
thor@jump-host ~$

thor@jump-host ~$ kubectl logs ic-deploy-xfusion-8d8fbd48f-dlq9r ic-m
error: container ic-m is not valid for pod ic-deploy-xfusion-8d8fbd48f-dlq9r
thor@jump-host ~$ kubectl logs ic-deploy-xfusion-8d8fbd48f-dlq9r
Defaulted container "ic-main-xfusion" out of: ic-main-xfusion, ic-msg-xfusion (init)
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
Init Done - Welcome to xFusionCorp Industries
thor@jump-host ~$ 
```

<img width="2075" height="1147" alt="image" src="https://github.com/user-attachments/assets/bcf89747-944c-4de6-b45e-fd145097befb" />

```sh
thor@jump-host ~$ kubectl describe deploy
Name:                   ic-deploy-xfusion
Namespace:              default
CreationTimestamp:      Thu, 28 May 2026 06:38:38 +0000
Labels:                 <none>
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=ic-xfusion
Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=ic-xfusion
  Init Containers:
   ic-msg-xfusion:
    Image:      fedora:latest
    Port:       <none>
    Host Port:  <none>
    Command:
      /bin/bash
      -c
      echo Init Done - Welcome to xFusionCorp Industries > /ic/ecommerce
    Environment:  <none>
    Mounts:
      /ic from ic-volume-xfusion (rw)
  Containers:
   ic-main-xfusion:
    Image:      fedora:latest
    Port:       <none>
    Host Port:  <none>
    Command:
      /bin/bash
      -c
      while true; do cat /ic/ecommerce; sleep 5; done
    Environment:  <none>
    Mounts:
      /ic from ic-volume-xfusion (rw)
  Volumes:
   ic-volume-xfusion:
    Type:          EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:        
    SizeLimit:     <unset>
  Node-Selectors:  <none>
  Tolerations:     <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   ic-deploy-xfusion-8d8fbd48f (1/1 replicas created)
Events:
  Type    Reason             Age    From                   Message
  ----    ------             ----   ----                   -------
  Normal  ScalingReplicaSet  2m48s  deployment-controller  Scaled up replica set ic-deploy-xfusion-8d8fbd48f from 0 to 1
thor@jump-host ~$

```
<img width="2287" height="1118" alt="image" src="https://github.com/user-attachments/assets/d66aa5bc-44b9-4fd5-8af0-203d950ffc44" />

```sh
thor@jump-host ~$ kubectl describe pods
Name:             ic-deploy-xfusion-8d8fbd48f-dlq9r
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.248.43
Start Time:       Thu, 28 May 2026 06:38:38 +0000
Labels:           app=ic-xfusion
                  pod-template-hash=8d8fbd48f
Annotations:      <none>
Status:           Running
IP:               10.22.0.9
IPs:
  IP:           10.22.0.9
Controlled By:  ReplicaSet/ic-deploy-xfusion-8d8fbd48f
Init Containers:
  ic-msg-xfusion:
    Container ID:  containerd://ad623c603c5a12be27d9e06620e37c204eebb35d5d09e616289e0e49859fbf31
    Image:         fedora:latest
    Image ID:      docker.io/library/fedora@sha256:6c75d5bf57cb0fa5aa4b92c6a83c86c791644496d9ac230de7711f5b8ec3b898
    Port:          <none>
    Host Port:     <none>
    Command:
      /bin/bash
      -c
      echo Init Done - Welcome to xFusionCorp Industries > /ic/ecommerce
    State:          Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Thu, 28 May 2026 06:38:42 +0000
      Finished:     Thu, 28 May 2026 06:38:42 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /ic from ic-volume-xfusion (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-v5q7m (ro)
Containers:
  ic-main-xfusion:
    Container ID:  containerd://203476f87bf99e2da8919ad98efebd58197517e5b756d847dc6361ee08cad1d1
    Image:         fedora:latest
    Image ID:      docker.io/library/fedora@sha256:6c75d5bf57cb0fa5aa4b92c6a83c86c791644496d9ac230de7711f5b8ec3b898
    Port:          <none>
    Host Port:     <none>
    Command:
      /bin/bash
      -c
      while true; do cat /ic/ecommerce; sleep 5; done
    State:          Running
      Started:      Thu, 28 May 2026 06:38:43 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /ic from ic-volume-xfusion (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-v5q7m (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  ic-volume-xfusion:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  kube-api-access-v5q7m:
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
  Type    Reason     Age    From               Message
  ----    ------     ----   ----               -------
  Normal  Scheduled  3m24s  default-scheduler  Successfully assigned default/ic-deploy-xfusion-8d8fbd48f-dlq9r to jump-host
  Normal  Pulling    3m24s  kubelet            Pulling image "fedora:latest"
  Normal  Pulled     3m21s  kubelet            Successfully pulled image "fedora:latest" in 2.881s (2.881s including waiting). Image size: 69320596 bytes.
  Normal  Created    3m21s  kubelet            Created container: ic-msg-xfusion
  Normal  Started    3m21s  kubelet            Started container ic-msg-xfusion
  Normal  Pulling    3m20s  kubelet            Pulling image "fedora:latest"
  Normal  Pulled     3m20s  kubelet            Successfully pulled image "fedora:latest" in 314ms (314ms including waiting). Image size: 69320596 bytes.
  Normal  Created    3m20s  kubelet            Created container: ic-main-xfusion
  Normal  Started    3m20s  kubelet            Started container ic-main-xfusion
thor@jump-host ~$ 

```

<img width="2412" height="1187" alt="image" src="https://github.com/user-attachments/assets/fcae2ea6-4152-49e1-8021-f15a425d3a46" />


```sh
thor@jump-host ~$ history
    1  vi deploymentDay61.yaml
    2  cat deploymentDay61.yaml 
    3  kubectl apply -f deploymentDay61.yaml 
    4  vi deploymentDay61.yaml 
    5  cat deploymentDay61.yaml 
    6  kubectl apply -f deploymentDay61.yaml \
    7  kubectl apply -f deploymentDay61.yaml
    8  vi deploymentDay61.yaml 
    9  cat deploymentDay61.yaml 
   10  kubectl apply -f deploymentDay61.yaml 
   11  vi deploymentDay61.yaml 
   12  cat deploymentDay61.yaml 
   13  kubectl apply -f deploymentDay61.yaml 
   14  vi deploymentDay61.yaml 
   15  vi deploymentDay61.yaml 
   16  cat deploymentDay61.yaml 
   17  kubectl apply -f deploymentDay61.yaml 
   18  kubectl get deploy
   19  kubectl get pods
   20  kubectl logs ic-deploy-xfusion-8d8fbd48f-dlq9r ic-m
   21  kubectl logs ic-deploy-xfusion-8d8fbd48f-dlq9r
   22  kubectl describe deploy
   23  kubectl describe pods
   24  history
thor@jump-host ~$ 
```

<img width="2332" height="1170" alt="image" src="https://github.com/user-attachments/assets/5756d3da-2d8a-4e4f-8155-8a1e305f0352" />
<img width="2377" height="1182" alt="image" src="https://github.com/user-attachments/assets/d4f62b2f-9b8f-4c3b-91e2-d519d060d86b" />
<img width="2390" height="1191" alt="image" src="https://github.com/user-attachments/assets/eb127f7e-37a8-4b95-9d2c-eb1374cdbac5" />
<img width="965" height="578" alt="image" src="https://github.com/user-attachments/assets/6b5a6fa9-ac20-4d45-8b81-4e346b679a33" />
<img width="801" height="510" alt="image" src="https://github.com/user-attachments/assets/89575fb8-23ac-49bd-8402-905af879295e" />

