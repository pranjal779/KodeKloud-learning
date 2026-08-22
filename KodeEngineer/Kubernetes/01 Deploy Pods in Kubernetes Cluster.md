# Deploy Pods in Kubernetes Cluster

The Nautilus DevOps team is diving into Kubernetes for application management. One team member has a task to create a pod according to the details below:

1. Create a pod named pod-httpd using the httpd image with the latest tag. Ensure to specify the tag as httpd:latest.

2. Set the app label to httpd_app, and name the container as httpd-container.

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.

<img width="876" height="567" alt="image" src="https://github.com/user-attachments/assets/240117ca-2b38-433f-b6ed-5e3c5bb11b09" />

---

```sh
thor@jump-host ~$ vi task.yaml
thor@jump-host ~$ cat task.yaml 
apiVersion: v1
kind: Pod
metadata:
  name: pod-httpd
  labels:
    app: httpd_app
spec:
  containers:
    - name: httpd-container
      image: httpd:latest
thor@jump-host ~$ 
thor@jump-host ~$ 
thor@jump-host ~$ kubectl apply -f task.yaml 
pod/pod-httpd created
thor@jump-host ~$ kubectl get pods
NAME        READY   STATUS    RESTARTS   AGE
pod-httpd   1/1     Running   0          13s
thor@jump-host ~$ kubectl describe pod httpd-container
Error from server (NotFound): pods "httpd-container" not found
thor@jump-host ~$ kubectl describe pod pod-httpd
Name:             pod-httpd
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.244.151
Start Time:       Sat, 22 Aug 2026 14:21:02 +0000
Labels:           app=httpd_app
Annotations:      <none>
Status:           Running
IP:               10.22.0.9
IPs:
  IP:  10.22.0.9
Containers:
  httpd-container:
    Container ID:   containerd://9d5c8d4142b855fcc07024a4b30a636a01ab7d7cc89961ddc86e3c82793e64b9
    Image:          httpd:latest
    Image ID:       docker.io/library/httpd@sha256:2920ed8587277d6aa8ea785e143e970835057123dc7bf1199d102c60c80a73bb
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Sat, 22 Aug 2026 14:21:06 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-sn5cc (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-sn5cc:
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
  Normal  Scheduled  106s  default-scheduler  Successfully assigned default/pod-httpd to jump-host
  Normal  Pulling    106s  kubelet            Pulling image "httpd:latest"
  Normal  Pulled     102s  kubelet            Successfully pulled image "httpd:latest" in 4.057s (4.057s including waiting). Image size: 45261674 bytes.
  Normal  Created    102s  kubelet            Created container: httpd-container
  Normal  Started    102s  kubelet            Started container httpd-container
thor@jump-host ~$

```

<img width="2340" height="1172" alt="image" src="https://github.com/user-attachments/assets/63626285-0349-41da-926e-428dbb80d4c3" />

<img width="2356" height="1182" alt="image" src="https://github.com/user-attachments/assets/ed54fefa-dc0c-4811-8f99-f50ee6022ad8" />
