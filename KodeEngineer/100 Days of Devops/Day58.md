# Day 58: Deploy Grafana on Kubernetes Cluster

The Nautilus DevOps teams is planning to set up a Grafana tool to collect and analyze analytics from some applications.  
They are planning to deploy it on Kubernetes cluster. Below you can find more details.  

1.) Create a deployment named grafana-deployment-nautilus using any grafana image for Grafana app. Set other parameters as per your choice.  

2.) Create NodePort type service with nodePort 32000 to expose the app.  

You do not need to make any configuration changes inside the Grafana app once deployed; just make sure you can access the Grafana login page.  

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.   

<img width="817" height="543" alt="image" src="https://github.com/user-attachments/assets/44d84c3f-8277-4967-a623-1ce67670a6a4" />

<img width="2325" height="1177" alt="image" src="https://github.com/user-attachments/assets/97cf1793-077e-4e07-96f5-0240bb76149b" />
<img width="2072" height="1022" alt="image" src="https://github.com/user-attachments/assets/95812c35-1756-416e-866d-45f35b809a50" />

```sh
thor@jump-host ~$ vi grafana-deployment-nautilus.yaml
thor@jump-host ~$ cat grafana-deployment-nautilus.yaml 
apiVerison: apps/v1
kind: Deployment
metadata:
  name: grafana-deployment-xfussion
  labels:
    app: grafana
spec:
  replicas: 1
  selector:
    matchLabels:
      app: grafana
  template:
    metadata:
      labels:
        app: grafana
    spec:
      containers:
        - name: grafana
          image: grafana/grafana:latest
          ports:
            - containerPort: 32000
thor@jump-host ~$ vi grafana-nodePort-service.yaml
thor@jump-host ~$ kubectl apply -f grafana-deployment-nautilus.yaml 
error: error validating "grafana-deployment-nautilus.yaml": error validating data: apiVersion not set; if you choose to ignore these errors, turn validation off with --validate=false
thor@jump-host ~$ cat grafana-deployment-nautilus.yaml 
apiVerison: apps/v1
kind: Deployment
metadata:
  name: grafana-deployment-xfussion
  labels:
    app: grafana
spec:
  replicas: 1
  selector:
    matchLabels:
      app: grafana
  template:
    metadata:
      labels:
        app: grafana
    spec:
      containers:
        - name: grafana
          image: grafana/grafana:latest
          ports:
            - containerPort: 32000
thor@jump-host ~$

thor@jump-host ~$ cat grafana-deployment-nautilus.yaml 
apiVerison: apps/v1
kind: Deployment
metadata:
  name: grafana-deployment-xfussion
  labels:
    app: grafana
spec:
  replicas: 1
  selector:
    matchLabels:
      app: grafana
  template:
    metadata:
      labels:
        app: grafana
    spec:
      containers:
        - name: grafana
          image: grafana/grafana:latest
          ports:
            - containerPort: 32000
thor@jump-host ~$ vi grafana-deployment-nautilus.yaml
thor@jump-host ~$ kubectl apply -f grafana-deployment-nautilus.yaml 
error: error validating "grafana-deployment-nautilus.yaml": error validating data: apiVersion not set; if you choose to ignore these errors, turn validation off with --validate=false
thor@jump-host ~$ vi grafana-deployment-nautilus.yaml
thor@jump-host ~$ kubectl apply -f grafana-deployment-nautilus.yaml 
deployment.apps/grafana-deployment-nautilus created
thor@jump-host ~$ 
thor@jump-host ~$ cat grafana-deployment-nautilus.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: grafana-deployment-nautilus
  labels:
    app: grafana
spec:
  replicas: 1
  selector:
    matchLabels:
      app: grafana
  template:
    metadata:
      labels:
        app: grafana
    spec:
      containers:
        - name: grafana
          image: grafana/grafana:latest
          ports:
            - containerPort: 3000
thor@jump-host ~$
thor@jump-host ~$ cat grafana-nodePort-service.yaml 
apiVersion: v1
kind: Service
metadata:
  name: grafana-service
spec:
  type: NodePort
  selector:
    app: grafana
  ports:
    - port: 3000
      targetPort: 3000
      nodePort: 32000
thor@jump-host ~$
thor@jump-host ~$ kubectl apply -f grafana-nodePort-service.yaml 
service/grafana-service created
thor@jump-host ~$

thor@jump-host ~$ kubectl get deployments.apps 
NAME                          READY   UP-TO-DATE   AVAILABLE   AGE
grafana-deployment-nautilus   1/1     1            1           4m29s
thor@jump-host ~$ kubectl get svc
NAME              TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)          AGE
grafana-service   NodePort    10.43.36.48   <none>        3000:32000/TCP   3m42s
kubernetes        ClusterIP   10.43.0.1     <none>        443/TCP          48m
thor@jump-host ~$



# Once the pod is running, you can access the Grafana login page at http://<Node-IP>:32000

thor@jump-host ~$ history
    1  vi grafana-deployment-nautilus.yaml
    2  cat grafana-deployment-nautilus.yaml 
    3  vi grafana-nodePort-service.yaml
    4  kubectl apply -f grafana-deployment-nautilus.yaml 
    5  cat grafana-deployment-nautilus.yaml 
    6  vi grafana-deployment-nautilus.yaml
    7  kubectl apply -f grafana-deployment-nautilus.yaml 
    8  vi grafana-deployment-nautilus.yaml
    9  kubectl apply -f grafana-deployment-nautilus.yaml 
   10  cat grafana-deployment-nautilus.yaml 
   11  cat grafana-nodePort-service.yaml 
   12  kubectl apply -f grafana-nodePort-service.yaml 
   13  kubectl get deployments.apps 
   14  kubectl get svc
   15  history
thor@jump-host ~$ 
```

<img width="2070" height="1323" alt="image" src="https://github.com/user-attachments/assets/43bd5bfb-0a9c-4662-aa39-9023592c388f" />
<img width="2180" height="1155" alt="image" src="https://github.com/user-attachments/assets/0b4d9aed-a6ee-4358-aeec-a1e2dfb372cc" />
<img width="2157" height="1181" alt="image" src="https://github.com/user-attachments/assets/a047547f-5df5-48d8-b573-928a5fe357e7" />


