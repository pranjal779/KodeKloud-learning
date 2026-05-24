# Day 52: Revert Deployment to Previous Version in Kubernetes

[reference](https://medium.com/@rkasthuri2002/100-days-of-devops-with-kodekloud-days-51-60-mastering-kubernetes-deployments-and-b02216146544)  

<img width="752" height="300" alt="image" src="https://github.com/user-attachments/assets/ae8f86a4-e87c-437b-b017-8eadf410a7a5" />  

Earlier today, the Nautilus DevOps team deployed a new release for an application.  
However, a customer has reported a bug related to this recent release. Consequently, the team aims to revert to the previous version.  

There exists a deployment named nginx-deployment; initiate a rollback to the previous revision.  

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.  

```sh
thor@jump-host ~$ kubectl get deploy
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   3/3     3            3           73s
thor@jump-host ~$ kubectl get pods
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-55658c8544-5zf55   1/1     Running   0          65s
nginx-deployment-55658c8544-b4qqr   1/1     Running   0          71s
nginx-deployment-55658c8544-gcz2s   1/1     Running   0          67s
thor@jump-host ~$ kubectl describe deployments nginx-deployment
Name:                   nginx-deployment
Namespace:              default
CreationTimestamp:      Sun, 24 May 2026 15:52:28 +0000
Labels:                 app=nginx-app
                        type=front-end
Annotations:            deployment.kubernetes.io/revision: 2
                        kubernetes.io/change-cause: kubectl set image deployment nginx-deployment nginx-container=nginx:alpine-perl --record=true
Selector:               app=nginx-app
Replicas:               3 desired | 3 updated | 3 total | 3 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=nginx-app
  Containers:
   nginx-container:
    Image:         nginx:alpine-perl
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
NewReplicaSet:   nginx-deployment-55658c8544 (3/3 replicas created)
Events:
  Type    Reason             Age   From                   Message
  ----    ------             ----  ----                   -------
  Normal  ScalingReplicaSet  109s  deployment-controller  Scaled up replica set nginx-deployment-fc677cbc9 from 0 to 3
  Normal  ScalingReplicaSet  99s   deployment-controller  Scaled up replica set nginx-deployment-55658c8544 from 0 to 1
  Normal  ScalingReplicaSet  96s   deployment-controller  Scaled down replica set nginx-deployment-fc677cbc9 from 3 to 2
  Normal  ScalingReplicaSet  96s   deployment-controller  Scaled up replica set nginx-deployment-55658c8544 from 1 to 2
  Normal  ScalingReplicaSet  94s   deployment-controller  Scaled down replica set nginx-deployment-fc677cbc9 from 2 to 1
  Normal  ScalingReplicaSet  93s   deployment-controller  Scaled up replica set nginx-deployment-55658c8544 from 2 to 3
  Normal  ScalingReplicaSet  92s   deployment-controller  Scaled down replica set nginx-deployment-fc677cbc9 from 1 to 0
thor@jump-host ~$

thor@jump-host ~$ kubectl rollout history deployment/nginx-deployment
deployment.apps/nginx-deployment 
REVISION  CHANGE-CAUSE
1         <none>
2         kubectl set image deployment nginx-deployment nginx-container=nginx:alpine-perl --record=true

thor@jump-host ~$

thor@jump-host ~$ kubectl rollout undo deployment/nginx-deployment
deployment.apps/nginx-deployment rolled back

thor@jump-host ~$

thor@jump-host ~$ kubectl rollout history deployment/nginx-deployment
deployment.apps/nginx-deployment 
REVISION  CHANGE-CAUSE
2         kubectl set image deployment nginx-deployment nginx-container=nginx:alpine-perl --record=true
3         <none>

thor@jump-host ~$ 
thor@jump-host ~$ kubectl get pods
NAME                               READY   STATUS    RESTARTS   AGE
nginx-deployment-fc677cbc9-248tb   1/1     Running   0          71s
nginx-deployment-fc677cbc9-2lgb7   1/1     Running   0          72s
nginx-deployment-fc677cbc9-5nl5m   1/1     Running   0          70s
thor@jump-host ~$ 

thor@jump-host ~$ history
    1  kubectl get deploy
    2  kubectl get pods
    3  kubectl describe deployments nginx-deployment
    4  kubectl rollout history deployment/nginx-deployment
    5  kubectl rollout undo deployment/nginx-deployment
    6  kubectl rollout history deployment/nginx-deployment
    7  kubectl get pods
    8  history
thor@jump-host ~$ 

```

<img width="2393" height="1158" alt="image" src="https://github.com/user-attachments/assets/ba351e85-f39a-41e9-98d8-743ac9a1c849" />

