# Day 67: Deploy Guest Book App on Kubernetes

<img width="820" height="1072" alt="image" src="https://github.com/user-attachments/assets/7624946a-6450-4539-8497-d1ad4a0e8aaa" />
<img width="792" height="702" alt="image" src="https://github.com/user-attachments/assets/5f0c4456-de16-4e92-9849-8a4098026317" />

The Nautilus Application development team has finished development of one of the applications and it is ready for deployment. It is a guestbook application that will be used to manage entries for guests/visitors. As per discussion with the DevOps team, they have finalized the infrastructure that will be deployed on Kubernetes cluster. Below you can find more details about it.

## BACK-END TIER

1. Create a deployment named redis-master for Redis master.

  a.) Replicas count should be 1.
  b.) Container name should be master-redis-datacenter and it should use image redis.
  c.) Request resources as CPU should be 100m and Memory should be 100Mi.
  d.) Container port should be redis default port i.e 6379.

2. Create a service named redis-master for Redis master. Port and targetPort should be Redis default port i.e 6379.

3. Create another deployment named redis-slave for Redis slave.

  a.) Replicas count should be 2.
  b.) Container name should be slave-redis-datacenter and it should use gcr.io/google_samples/gb-redisslave:v3 image.
  c.) Requests resources as CPU should be 100m and Memory should be 100Mi.
  d.) Define an environment variable named GET_HOSTS_FROM and its value should be dns.
  e.) Container port should be Redis default port i.e 6379.

4. Create another service named redis-slave. It should use Redis default port i.e 6379.

5. Create another service named redis-follower. Port and targetPort should be Redis default port i.e 6379. Its selector app should be redis-slave.

## FRONT END TIER

1. Create a deployment named frontend.

  a.) Replicas count should be 3.
  b.) Container name should be php-redis-datacenter and it should use gcr.io/google-samples/gb-frontend@sha256:a908df8486ff66f2c4daa0d3d8a2fa09846a1fc8efd65649c0109695c7c5cbff image.
  c.) Request resources as CPU should be 100m and Memory should be 100Mi.
  d.) Define an environment variable named as GET_HOSTS_FROM and its value should be dns.
  e.) Container port should be 80.

2Create a service named frontend. Its type should be NodePort, port should be 80 and its nodePort should be 30009.

Finally, you can check the guestbook app by clicking on App button.

You can use any labels as per your choice.

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.


```sh
thor@jump-host ~$ ls
thor@jump-host ~$ vi backendtier.yaml
thor@jump-host ~$ cat backendtier.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: redis-master
  name: redis-master
spec:
  replicas: 1
  selector:
    matchLabels:
      app: redis-master
  strategy: {}
  template:
    metadata:
      labels:
        app: redis-master
    spec:
      containers:
        - image: redis:alpine
          name: master-redis-devops
          resources:
            requests:
              cpu: "100m"
              memory: "100Mi"
          ports:
            - containerPort: 6379
thor@jump-host ~$ 

```

```sh
thor@jump-host ~$ vi backendtier.yaml 
thor@jump-host ~$ cat backendtier.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: redis-master
  name: redis-master
spec:
  replicas: 1
  selector:
    matchLabels:
      app: redis-master
  strategy: {}
  template:
    metadata:
      labels:
        app: redis-master
    spec:
      containers:
        - image: redis:alpine
          name: master-redis-devops
          resources:
            requests:
              cpu: "100m"
              memory: "100Mi"
          ports:
            - containerPort: 6379
---
apiVersion: v1
kind: Service
metadata:
  name: redis-master
  labels:
    app: redis-master
spec:
  ports:
  - port: 6379
    targetPort: 6379
  selector:
    app: redis-master
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis-slave
  labels:
    app: redis-slave
spec:
  replicas: 2
  selector:
    matchLabels:
      app: redis-slave
  template:
    metadata:
      labels:
        app: redis-slave
    spec:
      containers:
      - name: slave-redis-devops
        image: gcr.io/google_samples/gb-redisslave:v3
        ports:
        - containerPort: 6379
        env:
        - name: GET_HOSTS_FROM
          value: dns
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
---
apiVersion: v1
kind: Service
metadata:
  name: redis-slave
  labels:
    app: redis-slave
spec:
  ports:
  - port: 6379
    targetPort: 6379
  selector:
    app: redis-slave
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  replicas: 3
  selector:
    matchLabels:
      app: guestbook
      tier: frontend
  template:
    metadata:
      labels:
        app: guestbook
        tier: frontend
    spec:
      containers:
      - name: php-frontend-devops
        image: gcr.io/google_samples/gb-frontend:v4
        ports:
        - containerPort: 80
        env:
        - name: GET_HOSTS_FROM
          value: dns
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
---
apiVersion: v1
kind: Service
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  type: NodePort
  ports:
  - port: 80
    targetPort: 80
    nodePort: 30009
  selector:
    app: guestbook
    tier: frontend
thor@jump-host ~$ 

thor@jump-host ~$ kubectl apply -f backendtier.yaml 
deployment.apps/redis-master created
service/redis-master created
deployment.apps/redis-slave created
service/redis-slave created
deployment.apps/frontend created
service/frontend created
thor@jump-host ~$ 
```

<img width="1980" height="1352" alt="image" src="https://github.com/user-attachments/assets/168188d3-3258-4bba-8955-9dff0903fc9f" />

<img width="582" height="1052" alt="image" src="https://github.com/user-attachments/assets/abae5fd2-88f3-4416-932a-1a86759731cf" />


<img width="592" height="1042" alt="image" src="https://github.com/user-attachments/assets/d8b68288-0b89-4cb9-90fd-23b8e1e68a31" />
<img width="582" height="1077" alt="image" src="https://github.com/user-attachments/assets/009f5ef4-16c9-4577-9197-8d452283467e" />


```sh
thor@jump-host ~$ vi frontendtier.yaml
thor@jump-host ~$ cat frontendtier.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  replicas: 3
  selector:
    matchLabels:
      app: guestbook
      tier: frontend
  template:
    metadata:
      labels:
        app: guestbook
        tier: frontend
    spec:
      containers:
      - name: php-frontend-devops
        image: gcr.io/google_samples/gb-frontend:v4
        ports:
        - containerPort: 80
        env:
        - name: GET_HOSTS_FROM
          value: dns
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
---
apiVersion: v1
kind: Service
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  type: NodePort
  ports:
  - port: 80
    targetPort: 80
    nodePort: 30009
  selector:
    app: guestbook
    tier: frontend
thor@jump-host ~$
```

# re worte the backend file

```sh
thor@jump-host ~$ vi backendtier.yaml 
thor@jump-host ~$ cat backendtier.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: redis-master
  name: redis-master
spec:
  replicas: 1
  selector:
    matchLabels:
      app: redis-master
  strategy: {}
  template:
    metadata:
      labels:
        app: redis-master
    spec:
      containers:
        - image: redis:alpine
          name: master-redis-devops
          resources:
            requests:
              cpu: "100m"
              memory: "100Mi"
          ports:
            - containerPort: 6379
---
apiVersion: v1
kind: Service
metadata:
  name: redis-master
  labels:
    app: redis-master
spec:
  ports:
  - port: 6379
    targetPort: 6379
  selector:
    app: redis-master
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis-slave
  labels:
    app: redis-slave
spec:
  replicas: 2
  selector:
    matchLabels:
      app: redis-slave
  template:
    metadata:
      labels:
        app: redis-slave
    spec:
      containers:
      - name: slave-redis-devops
        image: gcr.io/google_samples/gb-redisslave:v3
        ports:
        - containerPort: 6379
        env:
        - name: GET_HOSTS_FROM
          value: dns
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
---
apiVersion: v1
kind: Service
metadata:
  name: redis-slave
  labels:
    app: redis-slave
spec:
  ports:
  - port: 6379
    targetPort: 6379
  selector:
    app: redis-slave
thor@jump-host ~$ 
```

```sh
thor@jump-host ~$ kubectl apply -f backendtier.yaml 
deployment.apps/redis-master unchanged
service/redis-master unchanged
deployment.apps/redis-slave unchanged
service/redis-slave unchanged
thor@jump-host ~$ kubectl get all
NAME                                READY   STATUS             RESTARTS   AGE
pod/frontend-567f774997-275gq       0/1     ImagePullBackOff   0          8m29s
pod/frontend-567f774997-2szxm       0/1     ImagePullBackOff   0          8m29s
pod/frontend-567f774997-lnnpk       0/1     ImagePullBackOff   0          8m29s
pod/redis-master-795dcdc75c-jbkw2   1/1     Running            0          8m29s
pod/redis-slave-f94878647-9mmmn     1/1     Running            0          8m29s
pod/redis-slave-f94878647-tz2c6     1/1     Running            0          8m29s

NAME                   TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/frontend       NodePort    10.43.19.32     <none>        80:30009/TCP   8m29s
service/kubernetes     ClusterIP   10.43.0.1       <none>        443/TCP        59m
service/redis-master   ClusterIP   10.43.136.132   <none>        6379/TCP       8m29s
service/redis-slave    ClusterIP   10.43.215.202   <none>        6379/TCP       8m29s

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/frontend       0/3     3            0           8m29s
deployment.apps/redis-master   1/1     1            1           8m29s
deployment.apps/redis-slave    2/2     2            2           8m29s

NAME                                      DESIRED   CURRENT   READY   AGE
replicaset.apps/frontend-567f774997       3         3         0       8m29s
replicaset.apps/redis-master-795dcdc75c   1         1         1       8m29s
replicaset.apps/redis-slave-f94878647     2         2         2       8m29s
thor@jump-host ~$ 



thor@jump-host ~$ kubectl delete all
error: resource(s) were provided, but no name was specified
thor@jump-host ~$ kubectl delete deploy
error: resource(s) were provided, but no name was specified
thor@jump-host ~$ kubectl detele all -A
error: unknown command "detele" for "kubectl"

Did you mean this?
        delete
thor@jump-host ~$ kubectl delete all -A
error: resource(s) were provided, but no name was specified
thor@jump-host ~$ kubectl delete all --all -A
pod "frontend-567f774997-275gq" deleted from default namespace
pod "frontend-567f774997-2szxm" deleted from default namespace
pod "frontend-567f774997-lnnpk" deleted from default namespace
pod "redis-master-795dcdc75c-jbkw2" deleted from default namespace
pod "redis-slave-f94878647-9mmmn" deleted from default namespace
pod "redis-slave-f94878647-tz2c6" deleted from default namespace
pod "coredns-7896679cc-4559l" deleted from kube-system namespace
pod "helm-install-traefik-crd-6qh6j" deleted from kube-system namespace
pod "helm-install-traefik-lqvwk" deleted from kube-system namespace
pod "local-path-provisioner-578895bd58-nwm89" deleted from kube-system namespace
pod "metrics-server-7b9c9c4b9c-47p7j" deleted from kube-system namespace
pod "svclb-traefik-e9dea218-xbdfr" deleted from kube-system namespace
pod "traefik-6f986b958c-f6q59" deleted from kube-system namespace
service "frontend" deleted from default namespace
service "kubernetes" deleted from default namespace
service "redis-master" deleted from default namespace
service "redis-slave" deleted from default namespace
service "kube-dns" deleted from kube-system namespace
service "metrics-server" deleted from kube-system namespace
service "traefik" deleted from kube-system namespace
deployment.apps "frontend" deleted from default namespace
deployment.apps "redis-master" deleted from default namespace
deployment.apps "redis-slave" deleted from default namespace
deployment.apps "coredns" deleted from kube-system namespace
deployment.apps "local-path-provisioner" deleted from kube-system namespace
deployment.apps "metrics-server" deleted from kube-system namespace
deployment.apps "traefik" deleted from kube-system namespace
job.batch "helm-install-traefik" deleted from kube-system namespace
job.batch "helm-install-traefik-crd" deleted from kube-system namespace

```


```sh
^Cthor@jump-host ~$ ^C
thor@jump-host ~$ kubectl apply -f backendtier.yaml 
deployment.apps/redis-master created
service/redis-master created
deployment.apps/redis-slave created
service/redis-slave created
thor@jump-host ~$ kubectl apply -f frontendtier.yaml 
deployment.apps/frontend created
service/frontend created

thor@jump-host ~$ kubectl get all
NAME                                READY   STATUS             RESTARTS   AGE
pod/frontend-567f774997-279j7       0/1     ImagePullBackOff   0          24s
pod/frontend-567f774997-kfv9b       0/1     ImagePullBackOff   0          24s
pod/frontend-567f774997-vrwvt       0/1     ImagePullBackOff   0          24s
pod/redis-master-795dcdc75c-t5zbd   1/1     Running            0          40s
pod/redis-slave-f94878647-svhnq     1/1     Running            0          40s
pod/redis-slave-f94878647-z4ck4     1/1     Running            0          40s

NAME                   TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/frontend       NodePort    10.43.123.109   <none>        80:30009/TCP   24s
service/kubernetes     ClusterIP   10.43.0.1       <none>        443/TCP        3m33s
service/redis-master   ClusterIP   10.43.225.64    <none>        6379/TCP       40s
service/redis-slave    ClusterIP   10.43.156.224   <none>        6379/TCP       40s

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/frontend       0/3     3            0           24s
deployment.apps/redis-master   1/1     1            1           40s
deployment.apps/redis-slave    2/2     2            2           40s

NAME                                      DESIRED   CURRENT   READY   AGE
replicaset.apps/frontend-567f774997       3         3         0       24s
replicaset.apps/redis-master-795dcdc75c   1         1         1       40s
replicaset.apps/redis-slave-f94878647     2         2         2       40s
thor@jump-host ~$

thor@jump-host ~$ kubectl get all
NAME                                READY   STATUS             RESTARTS   AGE
pod/frontend-567f774997-279j7       0/1     ImagePullBackOff   0          24s
pod/frontend-567f774997-kfv9b       0/1     ImagePullBackOff   0          24s
pod/frontend-567f774997-vrwvt       0/1     ImagePullBackOff   0          24s
pod/redis-master-795dcdc75c-t5zbd   1/1     Running            0          40s
pod/redis-slave-f94878647-svhnq     1/1     Running            0          40s
pod/redis-slave-f94878647-z4ck4     1/1     Running            0          40s

NAME                   TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/frontend       NodePort    10.43.123.109   <none>        80:30009/TCP   24s
service/kubernetes     ClusterIP   10.43.0.1       <none>        443/TCP        3m33s
service/redis-master   ClusterIP   10.43.225.64    <none>        6379/TCP       40s
service/redis-slave    ClusterIP   10.43.156.224   <none>        6379/TCP       40s

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/frontend       0/3     3            0           24s
deployment.apps/redis-master   1/1     1            1           40s
deployment.apps/redis-slave    2/2     2            2           40s

NAME                                      DESIRED   CURRENT   READY   AGE
replicaset.apps/frontend-567f774997       3         3         0       24s
replicaset.apps/redis-master-795dcdc75c   1         1         1       40s
replicaset.apps/redis-slave-f94878647     2         2         2       40s
thor@jump-host ~$
```

# Describe ALL the resources
```

thor@jump-host ~$ kubectl describe all
Name:             frontend-567f774997-279j7
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.81.38
Start Time:       Mon, 08 Jun 2026 08:46:43 +0000
Labels:           app=guestbook
                  pod-template-hash=567f774997
                  tier=frontend
Annotations:      <none>
Status:           Pending
IP:               10.22.0.33
IPs:
  IP:           10.22.0.33
Controlled By:  ReplicaSet/frontend-567f774997
Containers:
  php-frontend-devops:
    Container ID:   
    Image:          gcr.io/google_samples/gb-frontend:v4
    Image ID:       
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Requests:
      cpu:     100m
      memory:  100Mi
    Environment:
      GET_HOSTS_FROM:  dns
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-kjbtt (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-kjbtt:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    Optional:                false
    DownwardAPI:             true
QoS Class:                   Burstable
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                From               Message
  ----     ------     ----               ----               -------
  Normal   Scheduled  42s                default-scheduler  Successfully assigned default/frontend-567f774997-279j7 to jump-host
  Normal   BackOff    14s (x2 over 41s)  kubelet            Back-off pulling image "gcr.io/google_samples/gb-frontend:v4"
  Warning  Failed     14s (x2 over 41s)  kubelet            Error: ImagePullBackOff
  Normal   Pulling    3s (x3 over 43s)   kubelet            Pulling image "gcr.io/google_samples/gb-frontend:v4"
  Warning  Failed     3s (x3 over 42s)   kubelet            Failed to pull image "gcr.io/google_samples/gb-frontend:v4": rpc error: code = NotFound desc = failed to pull and unpack image "gcr.io/google_samples/gb-frontend:v4": failed to resolve reference "gcr.io/google_samples/gb-frontend:v4": gcr.io/google_samples/gb-frontend:v4: not found
  Warning  Failed     3s (x3 over 42s)   kubelet            Error: ErrImagePull


Name:             frontend-567f774997-kfv9b
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.81.38
Start Time:       Mon, 08 Jun 2026 08:46:43 +0000
Labels:           app=guestbook
                  pod-template-hash=567f774997
                  tier=frontend
Annotations:      <none>
Status:           Pending
IP:               10.22.0.34
IPs:
  IP:           10.22.0.34
Controlled By:  ReplicaSet/frontend-567f774997
Containers:
  php-frontend-devops:
    Container ID:   
    Image:          gcr.io/google_samples/gb-frontend:v4
    Image ID:       
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Requests:
      cpu:     100m
      memory:  100Mi
    Environment:
      GET_HOSTS_FROM:  dns
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-czh64 (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-czh64:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    Optional:                false
    DownwardAPI:             true
QoS Class:                   Burstable
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                From               Message
  ----     ------     ----               ----               -------
  Normal   Scheduled  42s                default-scheduler  Successfully assigned default/frontend-567f774997-kfv9b to jump-host
  Normal   BackOff    14s (x2 over 41s)  kubelet            Back-off pulling image "gcr.io/google_samples/gb-frontend:v4"
  Warning  Failed     14s (x2 over 41s)  kubelet            Error: ImagePullBackOff
  Normal   Pulling    1s (x3 over 43s)   kubelet            Pulling image "gcr.io/google_samples/gb-frontend:v4"
  Warning  Failed     1s (x3 over 42s)   kubelet            Failed to pull image "gcr.io/google_samples/gb-frontend:v4": rpc error: code = NotFound desc = failed to pull and unpack image "gcr.io/google_samples/gb-frontend:v4": failed to resolve reference "gcr.io/google_samples/gb-frontend:v4": gcr.io/google_samples/gb-frontend:v4: not found
  Warning  Failed     1s (x3 over 42s)   kubelet            Error: ErrImagePull


Name:             frontend-567f774997-vrwvt
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.81.38
Start Time:       Mon, 08 Jun 2026 08:46:43 +0000
Labels:           app=guestbook
                  pod-template-hash=567f774997
                  tier=frontend
Annotations:      <none>
Status:           Pending
IP:               10.22.0.32
IPs:
  IP:           10.22.0.32
Controlled By:  ReplicaSet/frontend-567f774997
Containers:
  php-frontend-devops:
    Container ID:   
    Image:          gcr.io/google_samples/gb-frontend:v4
    Image ID:       
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Requests:
      cpu:     100m
      memory:  100Mi
    Environment:
      GET_HOSTS_FROM:  dns
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-vbbtg (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-vbbtg:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    Optional:                false
    DownwardAPI:             true
QoS Class:                   Burstable
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                From               Message
  ----     ------     ----               ----               -------
  Normal   Scheduled  42s                default-scheduler  Successfully assigned default/frontend-567f774997-vrwvt to jump-host
  Normal   BackOff    16s (x2 over 41s)  kubelet            Back-off pulling image "gcr.io/google_samples/gb-frontend:v4"
  Warning  Failed     16s (x2 over 41s)  kubelet            Error: ImagePullBackOff
  Normal   Pulling    2s (x3 over 43s)   kubelet            Pulling image "gcr.io/google_samples/gb-frontend:v4"
  Warning  Failed     2s (x3 over 42s)   kubelet            Failed to pull image "gcr.io/google_samples/gb-frontend:v4": rpc error: code = NotFound desc = failed to pull and unpack image "gcr.io/google_samples/gb-frontend:v4": failed to resolve reference "gcr.io/google_samples/gb-frontend:v4": gcr.io/google_samples/gb-frontend:v4: not found
  Warning  Failed     2s (x3 over 42s)   kubelet            Error: ErrImagePull


Name:             redis-master-795dcdc75c-t5zbd
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.81.38
Start Time:       Mon, 08 Jun 2026 08:46:27 +0000
Labels:           app=redis-master
                  pod-template-hash=795dcdc75c
Annotations:      <none>
Status:           Running
IP:               10.22.0.29
IPs:
  IP:           10.22.0.29
Controlled By:  ReplicaSet/redis-master-795dcdc75c
Containers:
  master-redis-devops:
    Container ID:   containerd://85aa3c51e3a06842dc61b5c05d247be8f62bfc91334874753f4fabb690117da3
    Image:          redis:alpine
    Image ID:       docker.io/library/redis@sha256:09160599abd229764c0fb44cb6be640294e1d360a54b19985ab4843dcf2d90f1
    Port:           6379/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Mon, 08 Jun 2026 08:46:28 +0000
    Ready:          True
    Restart Count:  0
    Requests:
      cpu:        100m
      memory:     100Mi
    Environment:  <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-9c6zn (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-9c6zn:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    Optional:                false
    DownwardAPI:             true
QoS Class:                   Burstable
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  58s   default-scheduler  Successfully assigned default/redis-master-795dcdc75c-t5zbd to jump-host
  Normal  Pulled     58s   kubelet            Container image "redis:alpine" already present on machine
  Normal  Created    58s   kubelet            Created container: master-redis-devops
  Normal  Started    58s   kubelet            Started container master-redis-devops


Name:             redis-slave-f94878647-svhnq
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.81.38
Start Time:       Mon, 08 Jun 2026 08:46:27 +0000
Labels:           app=redis-slave
                  pod-template-hash=f94878647
Annotations:      <none>
Status:           Running
IP:               10.22.0.31
IPs:
  IP:           10.22.0.31
Controlled By:  ReplicaSet/redis-slave-f94878647
Containers:
  slave-redis-devops:
    Container ID:   containerd://b13df9e652bf84ed5b2a3ae2de5c4d7bbf1b87bfd40d7c3fc7d591713ac4683e
    Image:          gcr.io/google_samples/gb-redisslave:v3
    Image ID:       gcr.io/google_samples/gb-redisslave@sha256:57730a481f97b3321138161ba2c8c9ca3b32df32ce9180e4029e6940446800ec
    Port:           6379/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Mon, 08 Jun 2026 08:46:28 +0000
    Ready:          True
    Restart Count:  0
    Requests:
      cpu:     100m
      memory:  100Mi
    Environment:
      GET_HOSTS_FROM:  dns
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-vvsrh (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-vvsrh:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    Optional:                false
    DownwardAPI:             true
QoS Class:                   Burstable
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  58s   default-scheduler  Successfully assigned default/redis-slave-f94878647-svhnq to jump-host
  Normal  Pulled     58s   kubelet            Container image "gcr.io/google_samples/gb-redisslave:v3" already present on machine
  Normal  Created    58s   kubelet            Created container: slave-redis-devops
  Normal  Started    58s   kubelet            Started container slave-redis-devops


Name:             redis-slave-f94878647-z4ck4
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.81.38
Start Time:       Mon, 08 Jun 2026 08:46:27 +0000
Labels:           app=redis-slave
                  pod-template-hash=f94878647
Annotations:      <none>
Status:           Running
IP:               10.22.0.30
IPs:
  IP:           10.22.0.30
Controlled By:  ReplicaSet/redis-slave-f94878647
Containers:
  slave-redis-devops:
    Container ID:   containerd://c82169dff1f4b3c7e0a138e4f22ac97aef8d5085e6ff8e6036237f4c7a7e29c1
    Image:          gcr.io/google_samples/gb-redisslave:v3
    Image ID:       gcr.io/google_samples/gb-redisslave@sha256:57730a481f97b3321138161ba2c8c9ca3b32df32ce9180e4029e6940446800ec
    Port:           6379/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Mon, 08 Jun 2026 08:46:28 +0000
    Ready:          True
    Restart Count:  0
    Requests:
      cpu:     100m
      memory:  100Mi
    Environment:
      GET_HOSTS_FROM:  dns
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-hkvsm (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-hkvsm:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    Optional:                false
    DownwardAPI:             true
QoS Class:                   Burstable
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  58s   default-scheduler  Successfully assigned default/redis-slave-f94878647-z4ck4 to jump-host
  Normal  Pulled     58s   kubelet            Container image "gcr.io/google_samples/gb-redisslave:v3" already present on machine
  Normal  Created    58s   kubelet            Created container: slave-redis-devops
  Normal  Started    58s   kubelet            Started container slave-redis-devops


Name:                     frontend
Namespace:                default
Labels:                   app=guestbook
                          tier=frontend
Annotations:              <none>
Selector:                 app=guestbook,tier=frontend
Type:                     NodePort
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.43.123.109
IPs:                      10.43.123.109
Port:                     <unset>  80/TCP
TargetPort:               80/TCP
NodePort:                 <unset>  30009/TCP
Endpoints:                
Session Affinity:         None
External Traffic Policy:  Cluster
Internal Traffic Policy:  Cluster
Events:                   <none>


Name:                     kubernetes
Namespace:                default
Labels:                   component=apiserver
                          provider=kubernetes
Annotations:              <none>
Selector:                 <none>
Type:                     ClusterIP
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.43.0.1
IPs:                      10.43.0.1
Port:                     https  443/TCP
TargetPort:               6443/TCP
Endpoints:                10.244.81.38:6443
Session Affinity:         None
Internal Traffic Policy:  Cluster
Events:                   <none>


Name:                     redis-master
Namespace:                default
Labels:                   app=redis-master
Annotations:              <none>
Selector:                 app=redis-master
Type:                     ClusterIP
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.43.225.64
IPs:                      10.43.225.64
Port:                     <unset>  6379/TCP
TargetPort:               6379/TCP
Endpoints:                10.22.0.29:6379
Session Affinity:         None
Internal Traffic Policy:  Cluster
Events:                   <none>


Name:                     redis-slave
Namespace:                default
Labels:                   app=redis-slave
Annotations:              <none>
Selector:                 app=redis-slave
Type:                     ClusterIP
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.43.156.224
IPs:                      10.43.156.224
Port:                     <unset>  6379/TCP
TargetPort:               6379/TCP
Endpoints:                10.22.0.30:6379,10.22.0.31:6379
Session Affinity:         None
Internal Traffic Policy:  Cluster
Events:                   <none>


Name:                   frontend
Namespace:              default
CreationTimestamp:      Mon, 08 Jun 2026 08:46:43 +0000
Labels:                 app=guestbook
                        tier=frontend
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=guestbook,tier=frontend
Replicas:               3 desired | 3 updated | 3 total | 0 available | 3 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=guestbook
           tier=frontend
  Containers:
   php-frontend-devops:
    Image:      gcr.io/google_samples/gb-frontend:v4
    Port:       80/TCP
    Host Port:  0/TCP
    Requests:
      cpu:     100m
      memory:  100Mi
    Environment:
      GET_HOSTS_FROM:  dns
    Mounts:            <none>
  Volumes:             <none>
  Node-Selectors:      <none>
  Tolerations:         <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      False   MinimumReplicasUnavailable
  Progressing    True    ReplicaSetUpdated
OldReplicaSets:  <none>
NewReplicaSet:   frontend-567f774997 (3/3 replicas created)
Events:
  Type    Reason             Age   From                   Message
  ----    ------             ----  ----                   -------
  Normal  ScalingReplicaSet  43s   deployment-controller  Scaled up replica set frontend-567f774997 from 0 to 3


Name:                   redis-master
Namespace:              default
CreationTimestamp:      Mon, 08 Jun 2026 08:46:27 +0000
Labels:                 app=redis-master
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=redis-master
Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=redis-master
  Containers:
   master-redis-devops:
    Image:      redis:alpine
    Port:       6379/TCP
    Host Port:  0/TCP
    Requests:
      cpu:         100m
      memory:      100Mi
    Environment:   <none>
    Mounts:        <none>
  Volumes:         <none>
  Node-Selectors:  <none>
  Tolerations:     <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   redis-master-795dcdc75c (1/1 replicas created)
Events:
  Type    Reason             Age   From                   Message
  ----    ------             ----  ----                   -------
  Normal  ScalingReplicaSet  59s   deployment-controller  Scaled up replica set redis-master-795dcdc75c from 0 to 1


Name:                   redis-slave
Namespace:              default
CreationTimestamp:      Mon, 08 Jun 2026 08:46:27 +0000
Labels:                 app=redis-slave
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=redis-slave
Replicas:               2 desired | 2 updated | 2 total | 2 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=redis-slave
  Containers:
   slave-redis-devops:
    Image:      gcr.io/google_samples/gb-redisslave:v3
    Port:       6379/TCP
    Host Port:  0/TCP
    Requests:
      cpu:     100m
      memory:  100Mi
    Environment:
      GET_HOSTS_FROM:  dns
    Mounts:            <none>
  Volumes:             <none>
  Node-Selectors:      <none>
  Tolerations:         <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   redis-slave-f94878647 (2/2 replicas created)
Events:
  Type    Reason             Age   From                   Message
  ----    ------             ----  ----                   -------
  Normal  ScalingReplicaSet  59s   deployment-controller  Scaled up replica set redis-slave-f94878647 from 0 to 2


Name:           frontend-567f774997
Namespace:      default
Selector:       app=guestbook,pod-template-hash=567f774997,tier=frontend
Labels:         app=guestbook
                pod-template-hash=567f774997
                tier=frontend
Annotations:    deployment.kubernetes.io/desired-replicas: 3
                deployment.kubernetes.io/max-replicas: 4
                deployment.kubernetes.io/revision: 1
Controlled By:  Deployment/frontend
Replicas:       3 current / 3 desired
Pods Status:    0 Running / 3 Waiting / 0 Succeeded / 0 Failed
Pod Template:
  Labels:  app=guestbook
           pod-template-hash=567f774997
           tier=frontend
  Containers:
   php-frontend-devops:
    Image:      gcr.io/google_samples/gb-frontend:v4
    Port:       80/TCP
    Host Port:  0/TCP
    Requests:
      cpu:     100m
      memory:  100Mi
    Environment:
      GET_HOSTS_FROM:  dns
    Mounts:            <none>
  Volumes:             <none>
  Node-Selectors:      <none>
  Tolerations:         <none>
Events:
  Type    Reason            Age   From                   Message
  ----    ------            ----  ----                   -------
  Normal  SuccessfulCreate  43s   replicaset-controller  Created pod: frontend-567f774997-vrwvt
  Normal  SuccessfulCreate  43s   replicaset-controller  Created pod: frontend-567f774997-279j7
  Normal  SuccessfulCreate  43s   replicaset-controller  Created pod: frontend-567f774997-kfv9b


Name:           redis-master-795dcdc75c
Namespace:      default
Selector:       app=redis-master,pod-template-hash=795dcdc75c
Labels:         app=redis-master
                pod-template-hash=795dcdc75c
Annotations:    deployment.kubernetes.io/desired-replicas: 1
                deployment.kubernetes.io/max-replicas: 2
                deployment.kubernetes.io/revision: 1
Controlled By:  Deployment/redis-master
Replicas:       1 current / 1 desired
Pods Status:    1 Running / 0 Waiting / 0 Succeeded / 0 Failed
Pod Template:
  Labels:  app=redis-master
           pod-template-hash=795dcdc75c
  Containers:
   master-redis-devops:
    Image:      redis:alpine
    Port:       6379/TCP
    Host Port:  0/TCP
    Requests:
      cpu:         100m
      memory:      100Mi
    Environment:   <none>
    Mounts:        <none>
  Volumes:         <none>
  Node-Selectors:  <none>
  Tolerations:     <none>
Events:
  Type    Reason            Age   From                   Message
  ----    ------            ----  ----                   -------
  Normal  SuccessfulCreate  59s   replicaset-controller  Created pod: redis-master-795dcdc75c-t5zbd


Name:           redis-slave-f94878647
Namespace:      default
Selector:       app=redis-slave,pod-template-hash=f94878647
Labels:         app=redis-slave
                pod-template-hash=f94878647
Annotations:    deployment.kubernetes.io/desired-replicas: 2
                deployment.kubernetes.io/max-replicas: 3
                deployment.kubernetes.io/revision: 1
Controlled By:  Deployment/redis-slave
Replicas:       2 current / 2 desired
Pods Status:    2 Running / 0 Waiting / 0 Succeeded / 0 Failed
Pod Template:
  Labels:  app=redis-slave
           pod-template-hash=f94878647
  Containers:
   slave-redis-devops:
    Image:      gcr.io/google_samples/gb-redisslave:v3
    Port:       6379/TCP
    Host Port:  0/TCP
    Requests:
      cpu:     100m
      memory:  100Mi
    Environment:
      GET_HOSTS_FROM:  dns
    Mounts:            <none>
  Volumes:             <none>
  Node-Selectors:      <none>
  Tolerations:         <none>
Events:
  Type    Reason            Age   From                   Message
  ----    ------            ----  ----                   -------
  Normal  SuccessfulCreate  59s   replicaset-controller  Created pod: redis-slave-f94878647-z4ck4
  Normal  SuccessfulCreate  59s   replicaset-controller  Created pod: redis-slave-f94878647-svhnq
thor@jump-host ~$ 
```


```sh
thor@jump-host ~$ kubectl get deployments,pods,svc
NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/frontend       0/3     3            0           5m9s
deployment.apps/redis-master   1/1     1            1           5m25s
deployment.apps/redis-slave    2/2     2            2           5m25s

NAME                                READY   STATUS             RESTARTS   AGE
pod/frontend-567f774997-279j7       0/1     ImagePullBackOff   0          5m9s
pod/frontend-567f774997-kfv9b       0/1     ImagePullBackOff   0          5m9s
pod/frontend-567f774997-vrwvt       0/1     ImagePullBackOff   0          5m9s
pod/redis-master-795dcdc75c-t5zbd   1/1     Running            0          5m25s
pod/redis-slave-f94878647-svhnq     1/1     Running            0          5m25s
pod/redis-slave-f94878647-z4ck4     1/1     Running            0          5m25s

NAME                   TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/frontend       NodePort    10.43.123.109   <none>        80:30009/TCP   5m9s
service/kubernetes     ClusterIP   10.43.0.1       <none>        443/TCP        8m18s
service/redis-master   ClusterIP   10.43.225.64    <none>        6379/TCP       5m25s
service/redis-slave    ClusterIP   10.43.156.224   <none>        6379/TCP       5m25s
```

```sh
thor@jump-host ~$ ^C
thor@jump-host ~$ vi frontendtier.yaml 
thor@jump-host ~$ cat frontendtier.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  replicas: 3
  selector:
    matchLabels:
      app: guestbook
      tier: frontend
  template:
    metadata:
      labels:
        app: guestbook
        tier: frontend
    spec:
      containers:
      - name: php-redis-datacenter
        image: gcr.io/google-samples/gb-frontend@sha256:a908df8486ff66f2c4daa0d3d8a2fa09846a1fc8efd65649c0109695c7c5cbff
        resources:
          requests:
            cpu: "100m"
            memory: "100Mi"
        env:
        - name: GET_HOSTS_FROM
          value: "dns"
        ports:
        - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  type: NodePort
  ports:
  - port: 80
    targetPort: 80
    nodePort: 30009
  selector:
    app: guestbook
    tier: frontend

thor@jump-host ~$ kubectl get all
NAME                                READY   STATUS              RESTARTS   AGE
pod/frontend-567f774997-279j7       0/1     ImagePullBackOff    0          11m
pod/frontend-567f774997-kfv9b       0/1     ImagePullBackOff    0          11m
pod/frontend-567f774997-vrwvt       0/1     ImagePullBackOff    0          11m
pod/frontend-5dfccdcf9d-zqwgs       0/1     ContainerCreating   0          19s
pod/redis-master-795dcdc75c-t5zbd   1/1     Running             0          11m
pod/redis-slave-f94878647-svhnq     1/1     Running             0          11m
pod/redis-slave-f94878647-z4ck4     1/1     Running             0          11m

NAME                   TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/frontend       NodePort    10.43.123.109   <none>        80:30009/TCP   11m
service/kubernetes     ClusterIP   10.43.0.1       <none>        443/TCP        14m
service/redis-master   ClusterIP   10.43.225.64    <none>        6379/TCP       11m
service/redis-slave    ClusterIP   10.43.156.224   <none>        6379/TCP       11m

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/frontend       0/3     1            0           11m
deployment.apps/redis-master   1/1     1            1           11m
deployment.apps/redis-slave    2/2     2            2           11m

NAME                                      DESIRED   CURRENT   READY   AGE
replicaset.apps/frontend-567f774997       3         3         0       11m
replicaset.apps/frontend-5dfccdcf9d       1         1         0       19s
replicaset.apps/redis-master-795dcdc75c   1         1         1       11m
replicaset.apps/redis-slave-f94878647     2         2         2       11m
thor@jump-host ~$ 
```


# Alternative way to do this task:

<img width="900" height="362" alt="image" src="https://github.com/user-attachments/assets/6954f0ed-278c-44a3-a1af-40606b61675b" />

```sh
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis-master
  labels:
    app: redis-master
spec:
  replicas: 1
  selector:
    matchLabels:
      app: redis-master
  template:
    metadata:
      labels:
        app: redis-master
    spec:
      containers:
      - name: master-redis-devops
        image: redis
        ports:
        - containerPort: 6379
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
---
apiVersion: v1
kind: Service
metadata:
  name: redis-master
  labels:
    app: redis-master
spec:
  ports:
  - port: 6379
    targetPort: 6379
  selector:
    app: redis-master
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis-slave
  labels:
    app: redis-slave
spec:
  replicas: 2
  selector:
    matchLabels:
      app: redis-slave
  template:
    metadata:
      labels:
        app: redis-slave
    spec:
      containers:
      - name: slave-redis-devops
        image: gcr.io/google_samples/gb-redisslave:v3
        ports:
        - containerPort: 6379
        env:
        - name: GET_HOSTS_FROM
          value: dns
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
---
apiVersion: v1
kind: Service
metadata:
  name: redis-slave
  labels:
    app: redis-slave
spec:
  ports:
  - port: 6379
    targetPort: 6379
  selector:
    app: redis-slave
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  replicas: 3
  selector:
    matchLabels:
      app: guestbook
      tier: frontend
  template:
    metadata:
      labels:
        app: guestbook
        tier: frontend
    spec:
      containers:
      - name: php-frontend-devops
        image: gcr.io/google_samples/gb-frontend:v4
        ports:
        - containerPort: 80
        env:
        - name: GET_HOSTS_FROM
          value: dns
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
---
apiVersion: v1
kind: Service
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  type: NodePort
  ports:
  - port: 80
    targetPort: 80
    nodePort: 30009
  selector:
    app: guestbook
    tier: frontend
```

<img width="930" height="592" alt="image" src="https://github.com/user-attachments/assets/c7c285fd-aa4a-49e5-ab01-ae9d29f4a612" />
<img width="947" height="512" alt="image" src="https://github.com/user-attachments/assets/af9999d4-1838-4d0b-a274-44a2ddd202e5" />
<img width="922" height="552" alt="image" src="https://github.com/user-attachments/assets/cd4e5b13-99ec-47c5-8f27-6cdc2772a731" />
<img width="907" height="407" alt="image" src="https://github.com/user-attachments/assets/20662266-5258-410f-bdc3-2faad9cf225f" />

