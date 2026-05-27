# Day 60: Persistent Volumes in Kubernetes

[reference 1](https://medium.com/@rkasthuri2002/100-days-of-devops-with-kodekloud-days-51-60-mastering-kubernetes-deployments-and-b02216146544)
[reference 2](https://chris-young.net/60-100/)
[reference 3](https://tundedamian.medium.com/day-60-of-100-days-of-devops-working-with-persistent-volumes-pods-in-kubernetes-74c3f4c72886)

The Nautilus DevOps team is working on a Kubernetes template to deploy a web application on the cluster.  
There are some requirements to create/use persistent volumes to store the application code, and the template needs to be designed accordingly.  
Please find more details below:  


1. Create a PersistentVolume named as pv-devops. Configure the spec as storage class should be manual, set capacity to 5Gi, set access mode to ReadWriteOnce, volume type should be hostPath and set path to /mnt/itadmin (this directory is already created, you might not be able to access it directly, so you need not to worry about it).
2. Create a PersistentVolumeClaim named as pvc-devops. Configure the spec as storage class should be manual, request 3Gi of the storage, set access mode to ReadWriteOnce.
3. Create a pod named as pod-devops, mount the persistent volume you created with claim name pvc-devops at document root of the web server, the container within the pod should be named as container-devops using image nginx with latest tag only (remember to mention the tag i.e nginx:latest).
4. Create a node port type service named web-devops using node port 30008 to expose the web server running within the pod.

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.


<img width="795" height="713" alt="image" src="https://github.com/user-attachments/assets/f5a12f54-7948-4817-bc85-8f96ac6c845a" />

```sh
thor@jump-host ~$ vi presistentVol.yaml
thor@jump-host ~$
thor@jump-host ~$ cat presistentVol.yaml 
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-devops
spec:
  storageClassName: manual
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /mnt/data
thor@jump-host ~$ 

```
<img width="1305" height="1150" alt="image" src="https://github.com/user-attachments/assets/86132fd7-10a5-405e-bf03-d1c473c1aba4" />

```sh
thor@jump-host ~$ vi presistentVol.yaml
thor@jump-host ~$ cat presistentVol.yaml 
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-devops
spec:
  storageClassName: manual
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /mnt/itadmin
thor@jump-host ~$ 

thor@jump-host ~$ vi persistentVolClaim.yaml
thor@jump-host ~$ cat persistentVolClaim.yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-devops
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 3Gi
thor@jump-host ~$

thor@jump-host ~$ kubectl apply -f persistentVol.yaml
error: the path "persistentVol.yaml" does not exist
thor@jump-host ~$ kubectl apply -f presistentVol.yaml
persistentvolume/pv-devops created
thor@jump-host ~$ kubectl apply -f persistentVolClaim.yaml 
persistentvolumeclaim/pvc-devops created
thor@jump-host ~$




```

<img width="2230" height="1332" alt="image" src="https://github.com/user-attachments/assets/94be0773-9274-41df-92cb-706c2d1d6eaa" />

```sh
thor@jump-host ~$ cat pod.yaml 
apiVersion: v1
kind: Pod
metadata:
  name: pod-devops
  labels:
    app: web-server
spec:
  containers:
    - name: container-devops
      image: nginx:latest
      volumeMount:
        - name: container-storage
          mountPath: /usr/share/nginx/html
  volumes:
    - name: container-storage
      presistentVolumeClaim:
        claimName: pvc-devops
      
thor@jump-host ~$ 


```



```sh
thor@jump-host ~$ vi service-devops.yaml
thor@jump-host ~$ cat service-devops.yaml 
apiVersion: v1
kind: Service
metadata:
  name: web-devops
spec:
  type: NodePort
  selector:
    app: web-server
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30008

thor@jump-host ~$

```

<img width="2347" height="1256" alt="image" src="https://github.com/user-attachments/assets/b9870ead-c67e-43c5-9017-c02cd315b58a" />


```sh
thor@jump-host ~$ kubectl apply -f presistentVol.yaml 
persistentvolume/pv-devops unchanged
thor@jump-host ~$ kubectl apply -f persistentVolClaim.yaml 
persistentvolumeclaim/pvc-devops unchanged
thor@jump-host ~$ kubectl apply -f pod.yaml 
Error from server (BadRequest): error when creating "pod.yaml": Pod in version "v1" cannot be handled as a Pod: strict decoding error: unknown field "spec.containers[0].volumeMount", unknown field "spec.volumes[0].presistentVolumeClaim"
thor@jump-host ~$

thor@jump-host ~$ vi pod.yaml
thor@jump-host ~$ cat pod.yaml 
apiVersion: v1
kind: Pod
metadata:
  name: pod-devops
  labels:
    app: web-server
spec:
  containers:
    - name: container-devops
      image: nginx:latest
      volumeMounts:
        - name: container-storage
          mountPath: /usr/share/nginx/html
  volumes:
    - name: container-storage
      presistentVolumeClaim:
        claimName: pvc-devops
      
thor@jump-host ~$ kubectl apply -f pod.yaml 
Error from server (BadRequest): error when creating "pod.yaml": Pod in version "v1" cannot be handled as a Pod: strict decoding error: unknown field "spec.volumes[0].presistentVolumeClaim"
thor@jump-host ~$

thor@jump-host ~$ vi pod.yaml
thor@jump-host ~$ cat pod.yaml 
apiVersion: v1
kind: Pod
metadata:
  name: pod-devops
  labels:
    app: web-server
spec:
  containers:
    - name: container-devops
      image: nginx:latest
      volumeMounts:
        - name: container-storage
          mountPath: /usr/share/nginx/html
  volumes:
    - name: container-storage
      presistentVolumeClaim:
        claimName: pvc-devops
      
thor@jump-host ~$ kubectl apply -f pod.yaml 
Error from server (BadRequest): error when creating "pod.yaml": Pod in version "v1" cannot be handled as a Pod: strict decoding error: unknown field "spec.volumes[0].presistentVolumeClaim"
thor@jump-host ~$

thor@jump-host ~$ kubectl apply -f service-devops.yaml 
service/web-devops created
thor@jump-host ~$ 

```

<img width="617" height="820" alt="image" src="https://github.com/user-attachments/assets/ce4a99b7-558e-4556-b435-5f1ef362ed2d" />
<img width="640" height="542" alt="image" src="https://github.com/user-attachments/assets/ffac81b5-18e2-40c9-9f26-ae3c41eb2730" />
<img width="607" height="757" alt="image" src="https://github.com/user-attachments/assets/a361bc32-0376-4a45-ac28-95cb3cbd22f0" />
<img width="592" height="567" alt="image" src="https://github.com/user-attachments/assets/5531485b-bb11-41a8-b21b-1af395150421" />

```sh
thor@jump-host ~$ kubectl get pv,pvc,pod,svc
NAME                         CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                STORAGECLASS   VOLUMEATTRIBUTESCLASS   REASON   AGE
persistentvolume/pv-devops   5Gi        RWO            Retain           Bound    default/pvc-devops   manual         <unset>                          18m

NAME                               STATUS   VOLUME      CAPACITY   ACCESS MODES   STORAGECLASS   VOLUMEATTRIBUTESCLASS   AGE
persistentvolumeclaim/pvc-devops   Bound    pv-devops   5Gi        RWO            manual         <unset>                 18m

NAME             READY   STATUS    RESTARTS   AGE
pod/pod-devops   1/1     Running   0          100s

NAME                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/kubernetes   ClusterIP   10.43.0.1       <none>        443/TCP        76m
service/web-devops   NodePort    10.43.142.214   <none>        80:30008/TCP   64s
thor@jump-host ~$

```


```sh
thor@jump-host ~$ kubectl apply -f service-devops.yaml 
service/web-devops created
thor@jump-host ~$ kubectl get pv,pvc,pod,svc
NAME                         CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                STORAGECLASS   VOLUMEATTRIBUTESCLASS   REASON   AGE
persistentvolume/pv-devops   5Gi        RWO            Retain           Bound    default/pvc-devops   manual         <unset>                          18m

NAME                               STATUS   VOLUME      CAPACITY   ACCESS MODES   STORAGECLASS   VOLUMEATTRIBUTESCLASS   AGE
persistentvolumeclaim/pvc-devops   Bound    pv-devops   5Gi        RWO            manual         <unset>                 18m

NAME             READY   STATUS    RESTARTS   AGE
pod/pod-devops   1/1     Running   0          100s

NAME                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/kubernetes   ClusterIP   10.43.0.1       <none>        443/TCP        76m
service/web-devops   NodePort    10.43.142.214   <none>        80:30008/TCP   64s
thor@jump-host ~$ kubectl get pods
NAME         READY   STATUS    RESTARTS   AGE
pod-devops   1/1     Running   0          2m1s
thor@jump-host ~$ kubectl get svc
NAME         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
kubernetes   ClusterIP   10.43.0.1       <none>        443/TCP        76m
web-devops   NodePort    10.43.142.214   <none>        80:30008/TCP   92s
thor@jump-host ~$ kubectl get persistentvolume
NAME        CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                STORAGECLASS   VOLUMEATTRIBUTESCLASS   REASON   AGE
pv-devops   5Gi        RWO            Retain           Bound    default/pvc-devops   manual         <unset>                          19m
thor@jump-host ~$ kubectl get presist
error: the server doesn't have a resource type "presist"
thor@jump-host ~$ kubectl get pvc-devops
error: the server doesn't have a resource type "pvc-devops"
thor@jump-host ~$ kubectl get container-devops
error: the server doesn't have a resource type "container-devops"
thor@jump-host ~$ kubectl get all -o wide
NAME             READY   STATUS    RESTARTS   AGE     IP          NODE        NOMINATED NODE   READINESS GATES
pod/pod-devops   1/1     Running   0          6m24s   10.22.0.9   jump-host   <none>           <none>

NAME                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE     SELECTOR
service/kubernetes   ClusterIP   10.43.0.1       <none>        443/TCP        81m     <none>
service/web-devops   NodePort    10.43.142.214   <none>        80:30008/TCP   5m48s   app=web-server
thor@jump-host ~$ k get all -o wide
NAME             READY   STATUS    RESTARTS   AGE     IP          NODE        NOMINATED NODE   READINESS GATES
pod/pod-devops   1/1     Running   0          6m33s   10.22.0.9   jump-host   <none>           <none>

NAME                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE     SELECTOR
service/kubernetes   ClusterIP   10.43.0.1       <none>        443/TCP        81m     <none>
service/web-devops   NodePort    10.43.142.214   <none>        80:30008/TCP   5m57s   app=web-server
thor@jump-host ~$
```

<img width="1511" height="1113" alt="image" src="https://github.com/user-attachments/assets/443da4ce-2d3d-4e9b-a52c-61947af37b5e" />

<img width="1547" height="1081" alt="image" src="https://github.com/user-attachments/assets/deff6b1a-9d92-4400-87d2-3230732ad03a" />

<img width="1652" height="1087" alt="image" src="https://github.com/user-attachments/assets/2c9979fc-c4cb-498d-8e8e-38fd14087166" />

<img width="1632" height="1057" alt="image" src="https://github.com/user-attachments/assets/440b2cf0-6d3e-4e2a-987a-c0ff0471458a" />

<img width="1497" height="917" alt="image" src="https://github.com/user-attachments/assets/fe17c938-b100-456d-b9f6-be66608bf991" />


<img width="1631" height="427" alt="image" src="https://github.com/user-attachments/assets/5870d3ee-74df-4aef-b822-e7b5d0d356ae" />

<img width="1540" height="1083" alt="image" src="https://github.com/user-attachments/assets/0c2596d4-db66-423f-8c1f-8d16602f18f8" />


```sh
thor@jump-host ~$ history
    1  vi presistentVol.yaml
    2  cat presistentVol.yaml 
    3  vi persistentVolClaim.yaml
    4  vi presistentVol.yaml
    5  cat presistentVol.yaml 
    6  vi persistentVolClaim.yaml
    7  cat presistentVolClaim.yaml
    8  cat persistentVolClaim.yaml
    9  kubectl apply -f persistentVol.yaml
   10* kubectl apply -f presistentVol.
   11  kubectl apply -f persistentVolClaim.yaml 
   12  vi pod.yaml
   13  cat pod.yaml 
   14  vi service-devops.yaml
   15  cat service-devops.yaml 
   16  kubectl apply -f presistentVol.yaml 
   17  kubectl apply -f persistentVolClaim.yaml 
   18  kubectl apply -f pod.yaml 
   19  vi pod.yaml
   20  cat pod.yaml 
   21  kubectl apply -f pod.yaml 
   22  vi pod.yaml
   23* 
   24  vi pod.yaml
   25  cat pod.yaml 
   26  kubectl apply -f pod.yaml 
   27  cat service-devops.yaml 
   28  kubectl apply -f service-devops.yaml 
   29  kubectl get pv,pvc,pod,svc
   30  kubectl get pods
   31  kubectl get svc
   32  kubectl get persistentvolume
   33  kubectl get presist
   34  kubectl get pvc-devops
   35  kubectl get container-devops
   36  kubectl get all -o wide
   37  k get all -o wide
   38  history
thor@jump-host ~$

```

<img width="2430" height="1167" alt="image" src="https://github.com/user-attachments/assets/75ceb260-f18f-481e-8baf-4638e3f560ba" />

<img width="2341" height="1200" alt="image" src="https://github.com/user-attachments/assets/cc1de376-5b4f-4a70-a631-82a631d8e111" />

<img width="2385" height="1207" alt="image" src="https://github.com/user-attachments/assets/3fa24057-a21c-4f03-84fb-83b16349b103" />
<img width="1015" height="642" alt="image" src="https://github.com/user-attachments/assets/8a51424f-9789-4185-80c8-3b4d98bdbece" />
<img width="888" height="547" alt="image" src="https://github.com/user-attachments/assets/fa97c8e5-fbb4-4b28-ac70-8c86ddc52e6f" />

