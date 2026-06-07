<img width="2477" height="1307" alt="image" src="https://github.com/user-attachments/assets/715d1720-2f8f-4849-9120-9a3705c5fc58" /><img width="2097" height="1176" alt="image" src="https://github.com/user-attachments/assets/46938009-bea6-45ad-8c2d-0f17d56224d2" /># Day 66: Deploy MySQL on Kubernetes

[reference 1](https://medium.com/@janemils/kodekloud-engineer-day-66-deploy-mysql-on-kubernetes-3b3c3b560472)  
[reference 2](https://dev.to/wycliffealphus/100-days-of-devops-day-66-3d35)

A new MySQL server needs to be deployed on Kubernetes cluster. The Nautilus DevOps team was working on to gather the requirements.  
Recently they were able to finalize the requirements and shared them with the team members to start working on it. Below you can find the details:  

1.) Create a PersistentVolume mysql-pv, its capacity should be 250Mi, set other parameters as per your preference.

2.) Create a PersistentVolumeClaim to request this PersistentVolume storage. Name it as mysql-pv-claim and request a 250Mi of storage. Set other parameters as per your preference.

3.) Create a deployment named mysql-deployment, use any mysql image as per your preference. Mount the PersistentVolume at mount path /var/lib/mysql.

4.) Create a NodePort type service named mysql and set nodePort to 30007.

5.) Create a secret named mysql-root-pass having a key pair value, where key is password and its value is YUIidhb667, create another secret named mysql-user-pass having some key pair values, where first key is username and its value is kodekloud_sam, second key is password and value is YchZHRcLkL, create one more secret named mysql-db-url, key name is database and value is kodekloud_db6

6.) Define some environment variables within the container:

a.) name: MYSQL_ROOT_PASSWORD, should pick value from secretKeyRef name: mysql-root-pass and key: password

b.) name: MYSQL_DATABASE, should pick value from secretKeyRef name: mysql-db-url and key: database

c.) name: MYSQL_USER, should pick value from secretKeyRef name: mysql-user-pass key key: username

d.) name: MYSQL_PASSWORD, should pick value from secretKeyRef name: mysql-user-pass and key: password

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.

<img width="631" height="1170" alt="image" src="https://github.com/user-attachments/assets/2b0d7713-b0ae-4a55-8953-a6ffddd127bd" />


```sh
thor@jump-host ~$ vi pv.yaml
thor@jump-host ~$ cat pv.yaml 
apiVersion: v1
kind: PresistentVolume
metadata:
  name: mysql-pv
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 250Mi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/mnt/dba"
thor@jump-host ~$ 

```
<img width="1477" height="1412" alt="image" src="https://github.com/user-attachments/assets/e31970ab-6e60-4360-a871-be982265528e" />


```sh
thor@jump-host ~$ vi pv.yaml
thor@jump-host ~$ cat pv.yaml 
apiVersion: v1
kind: PresistentVolume
metadata:
  name: mysql-pv
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 250Mi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/mnt/dba"
thor@jump-host ~$ kubectl apply -f pv.yaml
error: resource mapping not found for name: "mysql-pv" namespace: "" from "pv.yaml": no matches for kind "PresistentVolume" in version "v1"
ensure CRDs are installed first
thor@jump-host ~$ rm pv.yaml
thor@jump-host ~$ ls
thor@jump-host ~$ vi mysql-secrets.yaml
thor@jump-host ~$ cat mysql-secrets.yaml 
apiVersion: v1
kind: Secret
metadata:
  name: mysql-root-pass
type: Opaque
stringData:
  password: YUIidhb667
---
apiVersion: v1
kind: Secret
metadata:
  name: mysql-user-pass
type: Opaque
stringData:
  username: kodekloud_cap
  password: B4zNgHA7Ya
---
apiVersion: v1
kind: Secret
metadata:
  name: mysql-db-url
type: Opaque
stringData:
  database: kodekloud_db1
thor@jump-host ~$ 

```
<img width="2097" height="1176" alt="image" src="https://github.com/user-attachments/assets/49b9a603-c768-4d28-9d62-7fe64170ce5b" />



```sh
thor@jump-host ~$ vi mysql-storage.yaml
thor@jump-host ~$ cat mysql-storage.yaml 
apiVersion: v1
kind: PersistentVolume
metadata:
  name: mysql-pv
spec:
  capacity:
    storage: 250Mi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/mnt/data" # Example path
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mysql-pv-claim
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 250Mi

thor@jump-host ~$ 

```

<img width="2177" height="1255" alt="image" src="https://github.com/user-attachments/assets/5c820588-a224-47f6-b795-40dd3e4fea73" />

```sh
thor@jump-host ~$ vi mysql-deployment.yaml
thor@jump-host ~$ cat mysql-deployment.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql-deployment
spec:
  selector:
    matchLabels:
      app: mysql
  template:
    metadata:
      labels:
        app: mysql
    spec:
      containers:
      - name: mysql
        image: mysql:latest
        env:
        - name: MYSQL_ROOT_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-root-pass
              key: password
        - name: MYSQL_DATABASE
          valueFrom:
            secretKeyRef:
              name: mysql-db-url
              key: database
        - name: MYSQL_USER
          valueFrom:
            secretKeyRef:
              name: mysql-user-pass
              key: username
        - name: MYSQL_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-user-pass
              key: password
        ports:
        - containerPort: 3306
        volumeMounts:
        - name: mysql-persistent-storage
          mountPath: /var/lib/mysql
      volumes:
      - name: mysql-persistent-storage
        persistentVolumeClaim:
          claimName: mysql-pv-claim

thor@jump-host ~$ 

```
<img width="2187" height="1307" alt="image" src="https://github.com/user-attachments/assets/41509807-4e20-445b-8e5b-f92779164972" />

```sh
thor@jump-host ~$ vi mysql-service.yaml
thor@jump-host ~$ cat mysql-service.yaml 
apiVersion: v1
kind: Service
metadata:
  name: mysql
spec:
  type: NodePort
  ports:
  - port: 3306
    targetPort: 3306
    nodePort: 30007
  selector:
    app: mysql

thor@jump-host ~$ 
```
<img width="2246" height="1177" alt="image" src="https://github.com/user-attachments/assets/7b4f2e4a-144f-4b5a-a97e-ee6ba1febb4b" />
<img width="2211" height="660" alt="image" src="https://github.com/user-attachments/assets/44c589aa-4c63-4489-8d3a-27b6302410b0" />

```sh
thor@jump-host ~$ kubectl apply -f mysql-secrets.yaml
secret/mysql-root-pass created
secret/mysql-user-pass created
secret/mysql-db-url created
thor@jump-host ~$ kubectl apply -f mysql-storage.yaml
persistentvolume/mysql-pv created
persistentvolumeclaim/mysql-pv-claim created
thor@jump-host ~$ kubectl apply -f mysql-deployment.yaml
deployment.apps/mysql-deployment created
thor@jump-host ~$ kubectl apply -f mysql-service.yaml
service/mysql created
thor@jump-host ~$
```
<img width="2131" height="682" alt="image" src="https://github.com/user-attachments/assets/f48cc9ce-864b-4cb6-a8c1-4d23d64af3c2" />  

<img width="2477" height="1307" alt="image" src="https://github.com/user-attachments/assets/4dd61b4b-f2a9-4a50-8367-ae52db2b5780" />  

```sh
thor@jump-host ~$ kubectl get svc all
Error from server (NotFound): services "all" not found
thor@jump-host ~$ kubectl get svc -a
error: unknown shorthand flag: 'a' in -a
See 'kubectl get --help' for usage.
thor@jump-host ~$ kubectl get all svc
error: you must specify only one resource
thor@jump-host ~$ kubectl get svc
NAME         TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
kubernetes   ClusterIP   10.43.0.1      <none>        443/TCP          73m
mysql        NodePort    10.43.85.184   <none>        3306:30007/TCP   76s
thor@jump-host ~$ kubectl get deploy
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
mysql-deployment   1/1     1            1           96s
thor@jump-host ~$ kubectl get deploys
error: the server doesn't have a resource type "deploys"
thor@jump-host ~$ kubectl get pv
NAME                                       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM                    STORAGECLASS   VOLUMEATTRIBUTESCLASS   REASON   AGE
mysql-pv                                   250Mi      RWO            Retain           Available                                           <unset>                          2m16s
pvc-43c55111-3e62-4c6b-824d-a6c3a333935e   250Mi      RWO            Delete           Bound       default/mysql-pv-claim   local-path     <unset>                          2m2s
thor@jump-host ~$ kubectl get secrets
NAME              TYPE     DATA   AGE
mysql-db-url      Opaque   1      2m35s
mysql-root-pass   Opaque   1      2m35s
mysql-user-pass   Opaque   2      2m35s
thor@jump-host ~$ kubectl get all
NAME                                    READY   STATUS    RESTARTS   AGE
pod/mysql-deployment-5774744b85-5vq4n   1/1     Running   0          2m22s

NAME                 TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/kubernetes   ClusterIP   10.43.0.1      <none>        443/TCP          74m
service/mysql        NodePort    10.43.85.184   <none>        3306:30007/TCP   2m13s

NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/mysql-deployment   1/1     1            1           2m22s

NAME                                          DESIRED   CURRENT   READY   AGE
replicaset.apps/mysql-deployment-5774744b85   1         1         1       2m22s
thor@jump-host ~$

```

<img width="677" height="965" alt="image" src="https://github.com/user-attachments/assets/388a7c30-4498-489c-9ada-1400309485bd" />

```sh
thor@jump-host ~$ kubectl describe svc
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
Endpoints:                10.244.153.178:6443
Session Affinity:         None
Internal Traffic Policy:  Cluster
Events:                   <none>


Name:                     mysql
Namespace:                default
Labels:                   <none>
Annotations:              <none>
Selector:                 app=mysql
Type:                     NodePort
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.43.85.184
IPs:                      10.43.85.184
Port:                     <unset>  3306/TCP
TargetPort:               3306/TCP
NodePort:                 <unset>  30007/TCP
Endpoints:                10.22.0.10:3306
Session Affinity:         None
External Traffic Policy:  Cluster
Internal Traffic Policy:  Cluster
Events:                   <none>
thor@jump-host ~$
```


<img width="822" height="902" alt="image" src="https://github.com/user-attachments/assets/b56702d5-d79e-4625-9c81-d179065dadf1" />

```sh
thor@jump-host ~$ kubectl describe secrets
Name:         mysql-db-url
Namespace:    default
Labels:       <none>
Annotations:  <none>

Type:  Opaque

Data
====
database:  13 bytes


Name:         mysql-root-pass
Namespace:    default
Labels:       <none>
Annotations:  <none>

Type:  Opaque

Data
====
password:  10 bytes


Name:         mysql-user-pass
Namespace:    default
Labels:       <none>
Annotations:  <none>

Type:  Opaque

Data
====
password:  10 bytes
username:  13 bytes
thor@jump-host ~$ 

```

<img width="1017" height="1237" alt="image" src="https://github.com/user-attachments/assets/fb9f893e-da61-4663-b7a2-8f47e5cbfd18" />

```sh
thor@jump-host ~$ kubectl describe deploy
Name:                   mysql-deployment
Namespace:              default
CreationTimestamp:      Sun, 07 Jun 2026 08:12:25 +0000
Labels:                 <none>
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=mysql
Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=mysql
  Containers:
   mysql:
    Image:      mysql:latest
    Port:       3306/TCP
    Host Port:  0/TCP
    Environment:
      MYSQL_ROOT_PASSWORD:  <set to the key 'password' in secret 'mysql-root-pass'>  Optional: false
      MYSQL_DATABASE:       <set to the key 'database' in secret 'mysql-db-url'>     Optional: false
      MYSQL_USER:           <set to the key 'username' in secret 'mysql-user-pass'>  Optional: false
      MYSQL_PASSWORD:       <set to the key 'password' in secret 'mysql-user-pass'>  Optional: false
    Mounts:
      /var/lib/mysql from mysql-persistent-storage (rw)
  Volumes:
   mysql-persistent-storage:
    Type:          PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:     mysql-pv-claim
    ReadOnly:      false
  Node-Selectors:  <none>
  Tolerations:     <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   mysql-deployment-5774744b85 (1/1 replicas created)
Events:
  Type    Reason             Age    From                   Message
  ----    ------             ----   ----                   -------
  Normal  ScalingReplicaSet  4m32s  deployment-controller  Scaled up replica set mysql-deployment-5774744b85 from 0 to 1
thor@jump-host ~$ 

```


<img width="996" height="1072" alt="image" src="https://github.com/user-attachments/assets/a31ab0df-574d-4ec6-b3f5-acb8dc1291fa" />

```sh
thor@jump-host ~$ kubectl describe pv
Name:            mysql-pv
Labels:          <none>
Annotations:     <none>
Finalizers:      [kubernetes.io/pv-protection]
StorageClass:    
Status:          Available
Claim:           
Reclaim Policy:  Retain
Access Modes:    RWO
VolumeMode:      Filesystem
Capacity:        250Mi
Node Affinity:   <none>
Message:         
Source:
    Type:          HostPath (bare host directory volume)
    Path:          /mnt/data
    HostPathType:  
Events:            <none>


Name:              pvc-43c55111-3e62-4c6b-824d-a6c3a333935e
Labels:            <none>
Annotations:       local.path.provisioner/selected-node: jump-host
                   pv.kubernetes.io/provisioned-by: rancher.io/local-path
Finalizers:        [kubernetes.io/pv-protection]
StorageClass:      local-path
Status:            Bound
Claim:             default/mysql-pv-claim
Reclaim Policy:    Delete
Access Modes:      RWO
VolumeMode:        Filesystem
Capacity:          250Mi
Node Affinity:     
  Required Terms:  
    Term 0:        kubernetes.io/hostname in [jump-host]
Message:           
Source:
    Type:  LocalVolume (a persistent volume backed by local storage on a node)
    Path:  /var/lib/rancher/k3s/storage/pvc-43c55111-3e62-4c6b-824d-a6c3a333935e_default_mysql-pv-claim
Events:    <none>
thor@jump-host ~$ 
```

<img width="992" height="1172" alt="image" src="https://github.com/user-attachments/assets/6a06e1d6-239d-4f8a-a352-76f147f672b8" />
<img width="995" height="712" alt="image" src="https://github.com/user-attachments/assets/42c805d2-322f-44e2-99f8-c92648701443" />


```sh
thor@jump-host ~$ kubectl describe pods
Name:             mysql-deployment-5774744b85-5vq4n
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.153.178
Start Time:       Sun, 07 Jun 2026 08:12:29 +0000
Labels:           app=mysql
                  pod-template-hash=5774744b85
Annotations:      <none>
Status:           Running
IP:               10.22.0.10
IPs:
  IP:           10.22.0.10
Controlled By:  ReplicaSet/mysql-deployment-5774744b85
Containers:
  mysql:
    Container ID:   containerd://9539af2c683ab02b3683ffc8c204980b6d1db8ffdeedfbb53a545fdce6809ff6
    Image:          mysql:latest
    Image ID:       docker.io/library/mysql@sha256:c11782aa2a96624c1efc121768641d96954faa136d6aa82751b032d8c426ffbc
    Port:           3306/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Sun, 07 Jun 2026 08:12:43 +0000
    Ready:          True
    Restart Count:  0
    Environment:
      MYSQL_ROOT_PASSWORD:  <set to the key 'password' in secret 'mysql-root-pass'>  Optional: false
      MYSQL_DATABASE:       <set to the key 'database' in secret 'mysql-db-url'>     Optional: false
      MYSQL_USER:           <set to the key 'username' in secret 'mysql-user-pass'>  Optional: false
      MYSQL_PASSWORD:       <set to the key 'password' in secret 'mysql-user-pass'>  Optional: false
    Mounts:
      /var/lib/mysql from mysql-persistent-storage (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-gd6p5 (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  mysql-persistent-storage:
    Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:  mysql-pv-claim
    ReadOnly:   false
  kube-api-access-gd6p5:
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
  Normal  Scheduled  6m32s  default-scheduler  Successfully assigned default/mysql-deployment-5774744b85-5vq4n to jump-host
  Normal  Pulling    6m32s  kubelet            Pulling image "mysql:latest"
  Normal  Pulled     6m19s  kubelet            Successfully pulled image "mysql:latest" in 12.88s (12.88s including waiting). Image size: 273458070 bytes.
  Normal  Created    6m19s  kubelet            Created container: mysql
  Normal  Started    6m19s  kubelet            Started container mysql
thor@jump-host ~$ 
```

<img width="1042" height="1077" alt="image" src="https://github.com/user-attachments/assets/a83b3896-3a0d-484f-b3e1-db68130c988f" />
```sh
thor@jump-host ~$ kubectl describe replicaset
Name:           mysql-deployment-5774744b85
Namespace:      default
Selector:       app=mysql,pod-template-hash=5774744b85
Labels:         app=mysql
                pod-template-hash=5774744b85
Annotations:    deployment.kubernetes.io/desired-replicas: 1
                deployment.kubernetes.io/max-replicas: 2
                deployment.kubernetes.io/revision: 1
Controlled By:  Deployment/mysql-deployment
Replicas:       1 current / 1 desired
Pods Status:    1 Running / 0 Waiting / 0 Succeeded / 0 Failed
Pod Template:
  Labels:  app=mysql
           pod-template-hash=5774744b85
  Containers:
   mysql:
    Image:      mysql:latest
    Port:       3306/TCP
    Host Port:  0/TCP
    Environment:
      MYSQL_ROOT_PASSWORD:  <set to the key 'password' in secret 'mysql-root-pass'>  Optional: false
      MYSQL_DATABASE:       <set to the key 'database' in secret 'mysql-db-url'>     Optional: false
      MYSQL_USER:           <set to the key 'username' in secret 'mysql-user-pass'>  Optional: false
      MYSQL_PASSWORD:       <set to the key 'password' in secret 'mysql-user-pass'>  Optional: false
    Mounts:
      /var/lib/mysql from mysql-persistent-storage (rw)
  Volumes:
   mysql-persistent-storage:
    Type:          PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:     mysql-pv-claim
    ReadOnly:      false
  Node-Selectors:  <none>
  Tolerations:     <none>
Events:
  Type    Reason            Age    From                   Message
  ----    ------            ----   ----                   -------
  Normal  SuccessfulCreate  7m33s  replicaset-controller  Created pod: mysql-deployment-5774744b85-5vq4n
thor@jump-host ~$

```

```sh
thor@jump-host ~$ history
    1  vi pv.yaml
    2  cat pv.yaml 
    3  kubectl apply -f pv.yaml
    4  rm pv.yaml
    5  ls
    6  vi mysql-secrets.yaml
    7  cat mysql-secrets.yaml 
    8  vi mysql-storage.yaml
    9  cat mysql-storage.yaml 
   10  vi mysql-deployment.yaml
   11  cat mysql-deployment.yaml 
   12  vi mysql-service.yaml
   13  cat mysql-service.yaml 
   14  kubectl apply -f mysql-secrets.yaml
   15  kubectl apply -f mysql-storage.yaml
   16  kubectl apply -f mysql-deployment.yaml
   17  kubectl apply -f mysql-service.yaml
   18  kubectl get svc all
   19  kubectl get svc -a
   20  kubectl get all svc
   21  kubectl get svc
   22  kubectl get deploy
   23  kubectl get deploys
   24  kubectl get pv
   25  kubectl get secrets
   26  kubectl get all
   27  kubectl describe svc
   28  kubectl describe secrets
   29  kubectl describe deploy
   30  kubectl describe pv
   31  kubectl describe pods
   32  kubectl describe replicaset
   33  history
thor@jump-host ~$
```

<img width="2460" height="1302" alt="image" src="https://github.com/user-attachments/assets/5b683a2c-5e07-49ec-bb0a-a3ef191ee476" />
<img width="1707" height="1277" alt="image" src="https://github.com/user-attachments/assets/1ef535d4-9236-42e4-9b19-9f18df97ecf1" />
<img width="906" height="556" alt="image" src="https://github.com/user-attachments/assets/ada1be05-d771-4d34-9f5d-a5a776b0285c" />
<img width="847" height="516" alt="image" src="https://github.com/user-attachments/assets/d3db4911-a2c4-4189-8d6c-1ec6ef9e6564" />

