# Day 63: Deploy Iron Gallery App on Kubernetes

[reference 1](https://dev.to/wycliffealphus/100-days-of-devops-day-63-1d33)  
[reference 2](https://tundedamian.medium.com/day-63-of-100-days-of-devops-deploying-the-iron-gallery-app-with-kubernetes-4f47c2ee7e1d)  


There is an iron gallery app that the Nautilus DevOps team was developing. They have recently customized the app and are going to deploy the same on the Kubernetes cluster. Below you can find more details:  

1. Create a namespace iron-namespace-nautilus

2. Create a deployment iron-gallery-deployment-nautilus for iron gallery under the same namespace you created.

  :- Labels run should be iron-gallery.

  :- Replicas count should be 1.

  :- Selector's matchLabels run should be iron-gallery.

  :- Template labels run should be iron-gallery under metadata.

  :- The container should be named as iron-gallery-container-nautilus, use kodekloud/irongallery:2.0 image ( use exact image name / tag ).

  :- Resources limits for memory should be 100Mi and for CPU should be 50m.

  :- First volumeMount name should be config, its mountPath should be /usr/share/nginx/html/data.

  :- Second volumeMount name should be images, its mountPath should be /usr/share/nginx/html/uploads.

  :- First volume name should be config and give it emptyDir and second volume name should be images, also give it emptyDir.

3. Create a deployment iron-db-deployment-nautilus for iron db under the same namespace.

  :- Labels db should be mariadb.

  :- Replicas count should be 1.

  :- Selector's matchLabels db should be mariadb.

  :- Template labels db should be mariadb under metadata.

  :- The container name should be iron-db-container-nautilus, use kodekloud/irondb:2.0 image ( use exact image name / tag ).

  :- Define environment, set MYSQL_DATABASE its value should be database_blog, set MYSQL_ROOT_PASSWORD and MYSQL_PASSWORD value should be with some complex passwords for DB connections, and MYSQL_USER value should be any custom user ( except root ).

  :- Volume mount name should be db and its mountPath should be /var/lib/mysql. Volume name should be db and give it an emptyDir.

4. Create a service for iron db which should be named iron-db-service-nautilus under the same namespace. Configure spec as selector's db should be mariadb. Protocol should be TCP, port and targetPort should be 3306 and its type should be ClusterIP.

5. Create a service for iron gallery which should be named iron-gallery-service-nautilus under the same namespace. Configure spec as selector's run should be iron-gallery. Protocol should be TCP, port and targetPort should be 80, nodePort should be 32678 and its type should be NodePort.

Note:  

We don't need to make connection b/w database and front-end now, if the installation page is coming up it should be enough for now.  

The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.  


<img width="943" height="1371" alt="image" src="https://github.com/user-attachments/assets/c6a614ee-7b4f-4468-97b7-8c526395faec" />
<img width="876" height="1062" alt="image" src="https://github.com/user-attachments/assets/fa94f1cb-2f2e-4d6f-8acf-5ef4762d6a07" />

<img width="1887" height="1380" alt="image" src="https://github.com/user-attachments/assets/4e3d09a3-80ab-4533-a0ad-2d218bc2b411" />

```sh
thor@jump-host ~$ vi iron-namespace-nautilus
thor@jump-host ~$ rm -rf 
.bash_profile            .config/                 .viminfo                 
.bashrc                  .kube/                   iron-namespace-nautilus  
thor@jump-host ~$ rm iron-namespace-nautilus 
thor@jump-host ~$ vi iron-namespace-nautilus.yaml
thor@jump-host ~$ cat iron-namespace-nautilus.yaml 
apiVersion: v1
kind: Namespace
metadata:
  name: iron-namespace-datacenter
thor@jump-host ~$ vi iron-gallery-deployment-nautilys.yaml
thor@jump-host ~$ cat iron-gallery-deployment-nautilys.yaml 
apiVersion: v1
kind: Deployment
metadata:
  name: iron-gallery-deployment-nautilus
  namespace: iron-namespace-nautilus
  labels:
    run: iron-gallery
spec:
  replicas: 1
  selector:
    matchLabels:
      run: iron-gallery
  template:
    metadata:
      labels:
        run: iron-gallery
  spec:
    containers:
      - name: iron-gallery-container-nautilus
        image: kodekloud/irongallery:2.0
        resources:
          limits:
            memory: "100Mi"
            cpu: "50m"
        volumeMounts:
          - name: config
            mountPath: /usr/share/nginx/html/data
          - name: images
            mountPath: /usr/share/nginx/html/uploads
  volumes:
    - name: config
      emptyDir: {}
    - name: images
      emptyDir: {}
      
thor@jump-host ~$ 


```

<img width="740" height="1210" alt="image" src="https://github.com/user-attachments/assets/6f752b14-6e65-4c48-a265-ea6aabdc53fd" />
<img width="691" height="488" alt="image" src="https://github.com/user-attachments/assets/f9239741-c25b-43fa-8ed6-0e172d437f52" />


```sh
thor@jump-host ~$ vi iron-name-devops.yaml
thor@jump-host ~$ rm iron-name-devops.yaml 
thor@jump-host ~$ vi iron-namespace-devops.yaml
thor@jump-host ~$ cat iron-namespace-devops.yaml 
apiVersion: v1
kind: Namespace
metadata:
  name: iron-namespace-devops
thor@jump-host ~$ vi iron-gallery-deployment-devops.yaml
thor@jump-host ~$ cat iron-gallery-deployment-devops.yaml 
apiVersion: v1
kind: Deployment
metadata:
  name: iron-gallery-deployment-devops
  namespace: iron-namespace-devops
  labels:
    run: iron-gallery
spec:
  replicas: 1
  selector:
    matachLabels:
      run: iron-gallery
  template:
    metadata:
      labels:
        run: iron-gallery
    spec:
      - name: iron-gallery-container-devops
        image: kodekloud/irongallery:2.0
        resource:
          limits:
            memory: "100Mi"
            cpu: "50m"
        volumeMounts:
          - name: config
            mountPath: /usr/share/nginx/html/data
          - name: images
            mountPath: /usr/share/nginx/html/uploads
    volumes:
      - name: config
        emptyDir: {}
      - name: images
        emptyDir: {}
thor@jump-host ~$

thor@jump-host ~$ vi iron-db-deployment-devops.yaml
thor@jump-host ~$ cat iron-db-deployment-devops.yaml 
apiVersion: v1
kind: Deployment
metadata:
  name: iron-db-deployment-devops
  namespace: iron-namespace-devops
  labels:
    db: mariadb
spec:
  replicas: 1
  selector:
    matchLabels:
      db: mariadb
  template:
    metadata:
      labels:
        db: mariadb
    spec:
      containers:
        - name: iron-db-container-devops
          image: kodekloud/irondb:2.0
          env:
            - name: MYSQL_DATABASE
              value: database_host
            - name: MYSQL_ROOT_PASSWORD
              value: alksjhf
            - name: MYSQL_PASSWORD
              value: aljsfadsf
            - name: MYSQL_USER
              value: kodeuser
          volumeMounts:
            - name: db
              mountPath: /var/lib/mysql
      volumes:
        - name: db
          emptyDir: {}
thor@jump-host ~$

thor@jump-host ~$ vi iron-db-service-devops.yaml
thor@jump-host ~$ cat iron-db-service-devops.yaml 
apiVersion: v1
kind: Service
metadata:
  name: iron-db-service-devops
  namespace: iron-namespace-devops
spec:
  selector:
    db: mariadb
  type: ClusterIP
  ports:
    - protocol: TCP
      port: 3306
      targetPort: 3306
thor@jump-host ~$

thor@jump-host ~$ vi iron-gallery-service-devops.yaml
thor@jump-host ~$ cat iron-gallery-service-devops.yaml 
apiVersion: v1
kind: Service
metadata:
  name: iron-gallery-service-devops
  namespace: iron-namespace-devops
spec:
  selector:
    run: iron-gallery
  type: NodePort
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 32678
thor@jump-host ~$

thor@jump-host ~$ ls
iron-db-deployment-devops.yaml       iron-gallery-deployment-devops.yaml  iron-namespace-devops.yaml
iron-db-service-devops.yaml          iron-gallery-service-devops.yaml
thor@jump-host ~$ kubectl -f iron-namespace-devops.yaml 
error: unknown shorthand flag: 'f' in -f
See 'kubectl --help' for usage.
thor@jump-host ~$ kubectl apply -f iron-namespace-devops.yaml 
namespace/iron-namespace-devops created
thor@jump-host ~$ kubectl apply -f iron-gallery-deployment-devops.yaml 
error: resource mapping not found for name: "iron-gallery-deployment-devops" namespace: "iron-namespace-devops" from "iron-gallery-deployment-devops.yaml": no matches for kind "Deployment" in version "v1"
ensure CRDs are installed first
thor@jump-host ~$ vi iron-gallery-deployment-devops.yaml 
thor@jump-host ~$

thor@jump-host ~$ kubectl apply -f iron-gallery-deployment-devops.yaml 
Error from server (BadRequest): error when creating "iron-gallery-deployment-devops.yaml": Deployment in version "v1" cannot be handled as a Deployment: json: cannot unmarshal array into Go struct field PodTemplateSpec.spec.template.spec of type v1.PodSpec
thor@jump-host ~$ vi iron-gallery-deployment-devops.yaml 
thor@jump-host ~$ 


thor@jump-host ~$ ls
iron-db-deployment-devops.yaml       iron-gallery-deployment-devops.yaml  iron-namespace-devops.yaml
iron-db-service-devops.yaml          iron-gallery-service-devops.yaml
thor@jump-host ~$ kubectl -f iron-namespace-devops.yaml 
error: unknown shorthand flag: 'f' in -f
See 'kubectl --help' for usage.
thor@jump-host ~$ kubectl apply -f iron-namespace-devops.yaml 
namespace/iron-namespace-devops created
thor@jump-host ~$ kubectl apply -f iron-gallery-deployment-devops.yaml 
error: resource mapping not found for name: "iron-gallery-deployment-devops" namespace: "iron-namespace-devops" from "iron-gallery-deployment-devops.yaml": no matches for kind "Deployment" in version "v1"
ensure CRDs are installed first
thor@jump-host ~$ vi iron-gallery-deployment-devops.yaml 
thor@jump-host ~$ vi iron-gallery-deployment-devops.yaml 
thor@jump-host ~$ cat iron-gallery-deployment-devops.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: iron-gallery-deployment-devops
  namespace: iron-namespace-devops
  labels:
    run: iron-gallery
spec:
  replicas: 1
  selector:
    matachLabels:
      run: iron-gallery
  template:
    metadata:
      labels:
        run: iron-gallery
    spec:
      - name: iron-gallery-container-devops
        image: kodekloud/irongallery:2.0
        resource:
          limits:
            memory: "100Mi"
            cpu: "50m"
        volumeMounts:
          - name: config
            mountPath: /usr/share/nginx/html/data
          - name: images
            mountPath: /usr/share/nginx/html/uploads
    volumes:
      - name: config
        emptyDir: {}
      - name: images
        emptyDir: {}
thor@jump-host ~$ kubectl apply -f iron-gallery-deployment-devops.yaml 
Error from server (BadRequest): error when creating "iron-gallery-deployment-devops.yaml": Deployment in version "v1" cannot be handled as a Deployment: json: cannot unmarshal array into Go struct field PodTemplateSpec.spec.template.spec of type v1.PodSpec
thor@jump-host ~$ vi iron-gallery-deployment-devops.yaml 
thor@jump-host ~$ vi iron-gallery-deployment-devops.yaml 
thor@jump-host ~$

hor@jump-host ~$ vi iron-gallery-deployment-devops.yaml 
thor@jump-host ~$ vi iron-gallery-deployment-devops.yaml 
thor@jump-host ~$ kubectl apply -f iron-gallery-deployment-devops.yaml 
Error from server (BadRequest): error when creating "iron-gallery-deployment-devops.yaml": Deployment in version "v1" cannot be handled as a Deployment: json: cannot unmarshal array into Go struct field PodTemplateSpec.spec.template.spec of type v1.PodSpec
thor@jump-host ~$ cat iron-gallery-deployment-devops.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: iron-gallery-deployment-devops
  namespace: iron-namespace-devops
  labels:
    run: iron-gallery
spec:
  replicas: 1
  selector:
    matchLabels:
      run: iron-gallery
  template:
    metadata:
      labels:
        run: iron-gallery
    spec:
      - name: iron-gallery-container-devops
        image: kodekloud/irongallery:2.0
        resource:
          limits:
            memory: "100Mi"
            cpu: "50m"
        volumeMounts:
          - name: config
            mountPath: /usr/share/nginx/html/data
          - name: images
            mountPath: /usr/share/nginx/html/uploads
    volumes:
      - name: config
        emptyDir: {}
      - name: images
        emptyDir: {}
thor@jump-host ~$ kubectl apply -f iron-gallery-deployment-devops.yaml 
Error from server (BadRequest): error when creating "iron-gallery-deployment-devops.yaml": Deployment in version "v1" cannot be handled as a Deployment: json: cannot unmarshal array into Go struct field PodTemplateSpec.spec.template.spec of type v1.PodSpec
thor@jump-host ~$

thor@jump-host ~$ ls
iron-db-deployment-devops.yaml       iron-gallery-deployment-devops.yaml  iron-namespace-devops.yaml
iron-db-service-devops.yaml          iron-gallery-service-devops.yaml
thor@jump-host ~$ kubectl apply -f iron-db-deployment-devops.yaml 
error: resource mapping not found for name: "iron-db-deployment-devops" namespace: "iron-namespace-devops" from "iron-db-deployment-devops.yaml": no matches for kind "Deployment" in version "v1"
ensure CRDs are installed first
thor@jump-host ~$ kubectl apply -f iron-db-service-devops.yaml 
service/iron-db-service-devops created
thor@jump-host ~$ kubectl apply -f iron-gallery-service-devops.yaml 
service/iron-gallery-service-devops created
thor@jump-host ~$ 

```
