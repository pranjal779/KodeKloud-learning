# Labs: Pods with YAML

<img width="1002" height="817" alt="image" src="https://github.com/user-attachments/assets/b476756d-f68b-426f-848e-80510e8dd5bc" />

<img width="1892" height="901" alt="image" src="https://github.com/user-attachments/assets/b19757dc-f951-49e9-99d4-6feead5bde74" />
<img width="1042" height="632" alt="image" src="https://github.com/user-attachments/assets/9a7e0324-c019-4faa-8880-4abae07588b6" />
<img width="926" height="391" alt="image" src="https://github.com/user-attachments/assets/8e5fcd26-cdc9-4ea1-8476-f18f3d772d4d" />
<img width="838" height="325" alt="image" src="https://github.com/user-attachments/assets/aae00e8a-5854-4368-9fe0-36b7ae55d697" />
<img width="1107" height="965" alt="image" src="https://github.com/user-attachments/assets/94885826-157b-47de-88f8-a388e90f6e1b" />
<img width="2151" height="1173" alt="image" src="https://github.com/user-attachments/assets/311e8bdb-011d-4b62-a251-ffae451dcac2" />
<img width="1868" height="842" alt="image" src="https://github.com/user-attachments/assets/0c94be50-557b-404b-b53a-64fbcb326f36" />
<img width="1826" height="781" alt="image" src="https://github.com/user-attachments/assets/e36329b2-8cd7-4699-9bc5-558fac467c28" />
<img width="857" height="372" alt="image" src="https://github.com/user-attachments/assets/2b4437a0-7496-45e4-a238-c967b6eae2e5" />
<img width="1802" height="548" alt="image" src="https://github.com/user-attachments/assets/d211659b-38a2-42ee-9615-17538a074a71" />
<img width="1316" height="1307" alt="image" src="https://github.com/user-attachments/assets/d9b4eb9e-5711-4727-85ff-996913a69535" />
<img width="1268" height="1361" alt="image" src="https://github.com/user-attachments/assets/7f391155-d8bb-445a-b22b-ad90976e883e" />
<img width="2373" height="1380" alt="image" src="https://github.com/user-attachments/assets/f4110a58-7602-4e44-af36-3376f2f7f470" />
<img width="1028" height="833" alt="image" src="https://github.com/user-attachments/assets/048781ab-23ed-4d4e-8727-43aea7ab87d4" />
<img width="875" height="388" alt="image" src="https://github.com/user-attachments/assets/17005c5a-dbd2-4688-906c-a3ca3768d1f8" />
<img width="1030" height="411" alt="image" src="https://github.com/user-attachments/assets/a1dbbb1a-6f79-46f9-aaf8-0116d271dd40" />
<img width="2531" height="827" alt="image" src="https://github.com/user-attachments/assets/7cb3e468-395e-4bea-96c9-72d1de90c4d4" />
<img width="1032" height="893" alt="image" src="https://github.com/user-attachments/assets/e20b6316-75fc-46e7-8306-cf2f60b1a4e6" />
<img width="2527" height="932" alt="image" src="https://github.com/user-attachments/assets/38fea4fb-19cf-4726-a896-b8af62c93fc7" />
<img width="707" height="342" alt="image" src="https://github.com/user-attachments/assets/9df3df23-a750-4844-a3d6-c8d07913ee28" />
<img width="1067" height="403" alt="image" src="https://github.com/user-attachments/assets/0231861d-8008-4ba8-9297-a2ee99264159" />

```
controlplane ~ ➜  kubectl describe pod webapp
Name:             webapp
Namespace:        default
Priority:         0
Service Account:  default
Node:             controlplane/192.168.104.12
Start Time:       Sat, 20 Dec 2025 15:41:41 +0000
Labels:           <none>
Annotations:      <none>
Status:           Pending
IP:               10.22.0.13
IPs:
  IP:  10.22.0.13
Containers:
  nginx:
    Container ID:   containerd://39d7d6d1e1fd09ebba36e55cea48a81b556a70c8c09a7f27538d1522fb19b34f
    Image:          nginx
    Image ID:       docker.io/library/nginx@sha256:fb01117203ff38c2f9af91db1a7409459182a37c87cced5cb442d1d8fcc66d19
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Sat, 20 Dec 2025 15:41:43 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-99rsp (ro)
  agentx:
    Container ID:   
    Image:          agentx
    Image ID:       
    Port:           <none>
    Host Port:      <none>
    State:          Waiting
      Reason:       ErrImagePull
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-99rsp (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-99rsp:
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
  Type     Reason     Age                 From               Message
  ----     ------     ----                ----               -------
  Normal   Scheduled  110s                default-scheduler  Successfully assigned default/webapp to controlplane
  Normal   Pulling    109s                kubelet            Pulling image "nginx"
  Normal   Pulled     109s                kubelet            Successfully pulled image "nginx" in 155ms (155ms including waiting). Image size: 59795293 bytes.
  Normal   Created    109s                kubelet            Created container: nginx
  Normal   Started    108s                kubelet            Started container nginx
  Normal   Pulling    16s (x4 over 108s)  kubelet            Pulling image "agentx"
  Warning  Failed     15s (x4 over 108s)  kubelet            Failed to pull image "agentx": failed to pull and unpack image "docker.io/library/agentx:latest": failed to resolve reference "docker.io/library/agentx:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     15s (x4 over 108s)  kubelet            Error: ErrImagePull
  Normal   BackOff    1s (x6 over 107s)   kubelet            Back-off pulling image "agentx"
  Warning  Failed     1s (x6 over 107s)   kubelet            Error: ImagePullBackOff

controlplane ~ ➜
```

<img width="2526" height="1387" alt="image" src="https://github.com/user-attachments/assets/8fbf764a-1d76-47c6-b5ac-c307135541f6" />
<img width="1005" height="887" alt="image" src="https://github.com/user-attachments/assets/30c949e7-e74e-42c7-a9da-28aca16884f7" />
<img width="2500" height="1410" alt="image" src="https://github.com/user-attachments/assets/478b92c8-8252-4ebc-9853-8875b6625cfd" />
<img width="2488" height="1370" alt="image" src="https://github.com/user-attachments/assets/7f5bb7e5-b6c1-4981-bcfa-e76765a85b38" />

<img width="1033" height="868" alt="image" src="https://github.com/user-attachments/assets/8c1787bd-3c77-4b28-bd1e-1a400e7c66fb" />
<img width="2511" height="1407" alt="image" src="https://github.com/user-attachments/assets/3938f261-bf64-44f7-8ae3-de4027d1b85c" />
<img width="1012" height="843" alt="image" src="https://github.com/user-attachments/assets/dee8a3b1-b029-4cfb-81ae-ba3c075088c2" />

<img width="1872" height="811" alt="image" src="https://github.com/user-attachments/assets/cdd952c0-43b5-440c-8f22-fcaf2da1d013" />
<img width="1050" height="370" alt="image" src="https://github.com/user-attachments/assets/cb43368e-075b-4c56-a548-81d921b98bd4" />

<img width="1021" height="727" alt="image" src="https://github.com/user-attachments/assets/98cb8ac7-3c7c-4f70-b4f8-aca2dd44baa2" />
<img width="1913" height="806" alt="image" src="https://github.com/user-attachments/assets/881171d5-eec6-41de-9671-37a5c73c0f01" />
<img width="1881" height="837" alt="image" src="https://github.com/user-attachments/assets/7814fc4d-6639-4804-be55-49c7e74dc252" />


<img width="1053" height="856" alt="image" src="https://github.com/user-attachments/assets/d8c31cba-4165-4ff5-b6a9-3d25234123cb" />
<img width="1013" height="472" alt="image" src="https://github.com/user-attachments/assets/0480c3a3-d717-4f8f-9aff-20be0e4bec40" />
<img width="1883" height="842" alt="image" src="https://github.com/user-attachments/assets/80b70f46-755f-4859-90b4-15158177a114" />
<img width="1006" height="623" alt="image" src="https://github.com/user-attachments/assets/f3fdfef1-f8df-4ea3-8baf-670262487698" />
<img width="2407" height="1377" alt="image" src="https://github.com/user-attachments/assets/5243216f-787b-484d-a23e-b34106d627a5" />

<img width="2430" height="1327" alt="image" src="https://github.com/user-attachments/assets/f1105c47-65ec-4a2d-9d2b-0f7e6513994e" />
<img width="1013" height="842" alt="image" src="https://github.com/user-attachments/assets/2c77c234-2f1b-4af9-90e1-3feff05503f3" />
<img width="2500" height="788" alt="image" src="https://github.com/user-attachments/assets/b0cf13f8-496b-42c8-9d0f-ef46b7fe9019" />
<img width="1017" height="503" alt="image" src="https://github.com/user-attachments/assets/d0021cdc-f639-48ca-828b-53b1cb6dd22f" />
<img width="1025" height="586" alt="image" src="https://github.com/user-attachments/assets/fad1e429-2ae8-426e-8f78-b3dc515d3cb4" />
<img width="2442" height="1411" alt="image" src="https://github.com/user-attachments/assets/44efd708-f1eb-4524-a356-6dfc51b8c712" />
<img width="2522" height="838" alt="image" src="https://github.com/user-attachments/assets/2b4e0389-dba1-4db9-a250-3c2c0debf60d" />

<img width="1013" height="792" alt="image" src="https://github.com/user-attachments/assets/09aed139-e1ad-4fd2-b357-469d2fc5c8cf" />
<img width="2532" height="961" alt="image" src="https://github.com/user-attachments/assets/cb3abb56-8e18-4952-b7fd-a13c473e97ec" />
