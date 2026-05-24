# Day 51: Execute Rolling Updates in Kubernetes

[reference 1](https://medium.com/@rkasthuri2002/100-days-of-devops-with-kodekloud-days-51-60-mastering-kubernetes-deployments-and-b02216146544)  
[reference 2](https://dev.to/wycliffealphus/100-days-of-devops-day-51-1nnm)

<img width="530" height="387" alt="image" src="https://github.com/user-attachments/assets/4e568252-afbc-4949-b1a3-95daf46be45f" />

<img width="765" height="372" alt="image" src="https://github.com/user-attachments/assets/bf7f69b9-feef-4971-a391-6a75830f1eaf" />

An application currently running on the Kubernetes cluster employs the nginx web server.  
The Nautilus application development team has introduced some recent changes that need deployment.  
They've crafted an image nginx:1.17 with the latest updates.  

Execute a rolling update for this application, integrating the nginx:1.17 image. The deployment is named nginx-deployment.  

Ensure all pods are operational post-update.  

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.  

```sh
thor@jump-host ~$ kubectl get deploy
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   3/3     3            3           2m57s
thor@jump-host ~$ kubectl get pods
NAME                               READY   STATUS    RESTARTS   AGE
nginx-deployment-fc677cbc9-cdr6p   1/1     Running   0          3m7s
nginx-deployment-fc677cbc9-dww89   1/1     Running   0          3m7s
nginx-deployment-fc677cbc9-pwbvl   1/1     Running   0          3m7s
thor@jump-host ~$ kubectl set image deployment/nginx-deployment nginx=nginx:1.17
error: unable to find container named "nginx"
thor@jump-host ~$ kubectl set image deployment/nginx-deployment nginx-container=nginx:1.17
deployment.apps/nginx-deployment image updated
thor@jump-host ~$ kubectl rollout status deployment/nginx-deployment
deployment "nginx-deployment" successfully rolled out
thor@jump-host ~$ kubectl get pods -o wide
NAME                                READY   STATUS    RESTARTS   AGE   IP           NODE        NOMINATED NODE   READINESS GATES
nginx-deployment-544f9896c8-27b4k   1/1     Running   0          31s   10.22.0.14   jump-host   <none>           <none>
nginx-deployment-544f9896c8-2dpm5   1/1     Running   0          32s   10.22.0.13   jump-host   <none>           <none>
nginx-deployment-544f9896c8-7497m   1/1     Running   0          36s   10.22.0.12   jump-host   <none>           <none>


thor@jump-host ~$ kubectl describe deployment nginx-deployment
Name:                   nginx-deployment
Namespace:              default
CreationTimestamp:      Sun, 24 May 2026 15:32:11 +0000
Labels:                 app=nginx-app
                        type=front-end
Annotations:            deployment.kubernetes.io/revision: 2
Selector:               app=nginx-app
Replicas:               3 desired | 3 updated | 3 total | 3 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=nginx-app
  Containers:
   nginx-container:
    Image:         nginx:1.17
    Port:          <none>
    Host Port:     <none>
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
OldReplicaSets:  nginx-deployment-fc677cbc9 (0/0 replicas created)
NewReplicaSet:   nginx-deployment-544f9896c8 (3/3 replicas created)
Events:
  Type    Reason             Age    From                   Message
  ----    ------             ----   ----                   -------
  Normal  ScalingReplicaSet  10m    deployment-controller  Scaled up replica set nginx-deployment-fc677cbc9 from 0 to 3
  Normal  ScalingReplicaSet  2m50s  deployment-controller  Scaled up replica set nginx-deployment-544f9896c8 from 0 to 1
  Normal  ScalingReplicaSet  2m46s  deployment-controller  Scaled down replica set nginx-deployment-fc677cbc9 from 3 to 2
  Normal  ScalingReplicaSet  2m46s  deployment-controller  Scaled up replica set nginx-deployment-544f9896c8 from 1 to 2
  Normal  ScalingReplicaSet  2m45s  deployment-controller  Scaled down replica set nginx-deployment-fc677cbc9 from 2 to 1
  Normal  ScalingReplicaSet  2m45s  deployment-controller  Scaled up replica set nginx-deployment-544f9896c8 from 2 to 3
  Normal  ScalingReplicaSet  2m44s  deployment-controller  Scaled down replica set nginx-deployment-fc677cbc9 from 1 to 0
thor@jump-host ~$ 
```

<img width="2397" height="1198" alt="image" src="https://github.com/user-attachments/assets/421aaa0d-a791-4f48-be0b-6934068013f4" />
<img width="1365" height="1022" alt="image" src="https://github.com/user-attachments/assets/03c2f1f9-25ed-43f9-9224-ba02b78afde8" />
