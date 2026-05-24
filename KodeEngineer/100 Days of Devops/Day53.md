# Day 53: Resolve VolumeMounts Issue in Kubernetes

[reference 1](https://medium.com/@rkasthuri2002/100-days-of-devops-with-kodekloud-days-51-60-mastering-kubernetes-deployments-and-b02216146544)
[reference 2](https://chris-young.net/53-100/)
[reference 3](https://dev.to/wycliffealphus/100-days-of-devops-day-53-3ida)

<img width="788" height="477" alt="image" src="https://github.com/user-attachments/assets/33739b9b-214c-469b-b49f-aa549c6115c0" />

We encountered an issue with our Nginx and PHP-FPM setup on the Kubernetes cluster this morning, which halted its functionality. Investigate and rectify the issue:  

The pod name is nginx-phpfpm and configmap name is nginx-config. Identify and fix the problem.  

Once resolved, copy /home/thor/index.php file from the jump host to the nginx-container within the nginx document root.  
After this, you should be able to access the website using Website button on the top bar.  

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.  



<img width="1366" height="1120" alt="image" src="https://github.com/user-attachments/assets/82954c13-4be7-4ab7-9d67-4a401d5718ba" />
<img width="1413" height="1103" alt="image" src="https://github.com/user-attachments/assets/ab0cf5a7-084c-4d3d-8260-cc40de17c1e9" />
<img width="1422" height="411" alt="image" src="https://github.com/user-attachments/assets/359eaabb-77ce-42e6-95ce-4b6de642b8a6" />
<img width="1077" height="1093" alt="image" src="https://github.com/user-attachments/assets/af1fc7a6-a580-4082-a22b-aad4b0106db5" />
<img width="1571" height="1133" alt="image" src="https://github.com/user-attachments/assets/061e28ca-112b-4f28-af8a-db23e9659be2" />




```sh
thor@jump-host /tmp$ ls -la
total 120
drwxrwxrwx    2 root     root          4096 May 24 16:20 .
dr-xr-xr-x    1 root     root          4096 May 24 16:21 ..
-rw-rw-rw-    1 thor     thor         89082 May 24 16:21 demofile2.json
-rw-r--r--    1 thor     thor          5291 May 24 16:07 nginx
-rw-r--r--    1 thor     thor          5283 May 24 16:20 nginx.yaml
-rwxr-xr-x    1 root     root           208 May 24 15:59 startup-script.sh
thor@jump-host /tmp$

thor@jump-host /tmp$ kubectl delete pod nginx-phpfpm --now
pod "nginx-phpfpm" deleted from default namespace
thor@jump-host /tmp$ kubectl apply -f nginx.yaml
pod/nginx-phpfpm created
thor@jump-host /tmp$


thor@jump-host /tmp$ kubectl get pods
NAME           READY   STATUS    RESTARTS   AGE
nginx-phpfpm   2/2     Running   0          61s
thor@jump-host /tmp$


thor@jump-host ~$ kubectl cp /home/thor/index.php nginx-phpfpm:/var/www/html/ -c nginx-container
thor@jump-host ~$

thor@jump-host ~$ kubectl exec -it nginx-phpfpm -c nginx-container -- curl -I http://localhost:8099
HTTP/1.1 200 OK
Server: nginx/1.31.1
Date: Sun, 24 May 2026 16:25:55 GMT
Content-Type: text/html; charset=UTF-8
Connection: keep-alive
X-Powered-By: PHP/7.2.34

thor@jump-host ~$ 
```

<img width="1892" height="667" alt="image" src="https://github.com/user-attachments/assets/21b77d39-e68d-480a-8dff-05b3b9d48b78" />
<img width="786" height="773" alt="image" src="https://github.com/user-attachments/assets/f8920ba1-d352-4d64-8563-436d815cdc03" />


<img width="947" height="447" alt="image" src="https://github.com/user-attachments/assets/79eddcda-3e3a-4e17-8083-8d0a2c976f02" />
<img width="922" height="792" alt="image" src="https://github.com/user-attachments/assets/a0c134cd-5acb-4a40-96b7-8de91885420f" />
<img width="868" height="962" alt="image" src="https://github.com/user-attachments/assets/304338f0-c8b9-461e-aea1-e3ffff15f950" />
<img width="862" height="1013" alt="image" src="https://github.com/user-attachments/assets/0c9cfbc0-f755-49b8-abd7-a9d3456803ac" />
<img width="912" height="512" alt="image" src="https://github.com/user-attachments/assets/7aab445b-d5c9-4fd4-9ffd-c4328d735f31" />




```sh
thor@jump-host ~$ kubectl get pods
NAME           READY   STATUS    RESTARTS   AGE
nginx-phpfpm   2/2     Running   0          76s
thor@jump-host ~$ kubectl get deploy
No resources found in default namespace.
thor@jump-host ~$ kubect describe pods nginx-phpfpm
bash: kubect: command not found
thor@jump-host ~$ kubectl describe pods nginx-phpfpm
Name:             nginx-phpfpm
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.153.161
Start Time:       Sun, 24 May 2026 15:59:15 +0000
Labels:           app=php-app
Annotations:      <none>
Status:           Running
IP:               10.22.0.9
IPs:
  IP:  10.22.0.9
Containers:
  php-fpm-container:
    Container ID:   containerd://4cd1df8798efe33b070f0b73646e42688cf17047087fc92575f435da9d465f1b
    Image:          php:7.2-fpm-alpine
    Image ID:       docker.io/library/php@sha256:2e2d92415f3fc552e9a62548d1235f852c864fcdc94bcf2905805d92baefc87f
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Sun, 24 May 2026 15:59:18 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /usr/share/nginx/html from shared-files (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-fz7c7 (ro)
  nginx-container:
    Container ID:   containerd://37d8944521c873963c0460a5dbab7cfb6b7113e7402c7f0ef11360d5a66bf4b0
    Image:          nginx:latest
    Image ID:       docker.io/library/nginx@sha256:5aca99593157f4ae539a5dec1092a0ad8762f8e2eb1789085a13a0f5622369f6
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Sun, 24 May 2026 15:59:21 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /etc/nginx/nginx.conf from nginx-config-volume (rw,path="nginx.conf")
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-fz7c7 (ro)
      /var/www/html from shared-files (rw)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  shared-files:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  nginx-config-volume:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      nginx-config
    Optional:  false
  kube-api-access-fz7c7:
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
  Normal  Scheduled  2m23s  default-scheduler  Successfully assigned default/nginx-phpfpm to jump-host
  Normal  Pulling    2m23s  kubelet            Pulling image "php:7.2-fpm-alpine"
  Normal  Pulled     2m21s  kubelet            Successfully pulled image "php:7.2-fpm-alpine" in 2.077s (2.077s including waiting). Image size: 30733687 bytes.
  Normal  Created    2m21s  kubelet            Created container: php-fpm-container
  Normal  Started    2m20s  kubelet            Started container php-fpm-container
  Normal  Pulling    2m20s  kubelet            Pulling image "nginx:latest"
  Normal  Pulled     2m17s  kubelet            Successfully pulled image "nginx:latest" in 3.133s (3.133s including waiting). Image size: 63120520 bytes.
  Normal  Created    2m17s  kubelet            Created container: nginx-container
  Normal  Started    2m17s  kubelet            Started container nginx-container
thor@jump-host ~$

thor@jump-host ~$ kubectl get configmap 
NAME               DATA   AGE
kube-root-ca.crt   1      42m
nginx-config       1      3m55s
thor@jump-host ~$

thor@jump-host ~$ kubectl describe configmap nginx-config
Name:         nginx-config
Namespace:    default
Labels:       <none>
Annotations:  <none>

Data
====
nginx.conf:
----
events {
}
http {
  server {
    listen 8099 default_server;
    listen [::]:8099 default_server;

    # Set nginx to serve files from the shared volume!
    root /var/www/html;
    index  index.html index.htm index.php;
    server_name _;
    location / {
      try_files $uri $uri/ =404;
    }
    location ~ \.php$ {
      include fastcgi_params;
      fastcgi_param REQUEST_METHOD $request_method;
      fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
      fastcgi_pass 127.0.0.1:9000;
    }
  }
}



BinaryData
====

Events:  <none>
thor@jump-host ~$

thor@jump-host ~$ kubectl get pod nginx-phpfpm -o yaml > /tmp/nginx.yaml


thor@jump-host ~$ cat /tmp/nginx.yaml
apiVersion: v1
kind: Pod
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","kind":"Pod","metadata":{"annotations":{},"labels":{"app":"php-app"},"name":"nginx-phpfpm","namespace":"default"},"spec":{"containers":[{"image":"php:7.2-fpm-alpine","name":"php-fpm-container","volumeMounts":[{"mountPath":"/usr/share/nginx/html","name":"shared-files"}]},{"image":"nginx:latest","name":"nginx-container","volumeMounts":[{"mountPath":"/var/www/html","name":"shared-files"},{"mountPath":"/etc/nginx/nginx.conf","name":"nginx-config-volume","subPath":"nginx.conf"}]}],"volumes":[{"emptyDir":{},"name":"shared-files"},{"configMap":{"name":"nginx-config"},"name":"nginx-config-volume"}]}}
  creationTimestamp: "2026-05-24T15:59:15Z"
  generation: 1
  labels:
    app: php-app
  name: nginx-phpfpm
  namespace: default
  resourceVersion: "1429"
  uid: 0903d2c8-e312-45be-bde0-572abbec8428
spec:
  containers:
  - image: php:7.2-fpm-alpine
    imagePullPolicy: IfNotPresent
    name: php-fpm-container
    resources: {}
    terminationMessagePath: /dev/termination-log
    terminationMessagePolicy: File
    volumeMounts:
    - mountPath: /usr/share/nginx/html
      name: shared-files
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-fz7c7
      readOnly: true
  - image: nginx:latest
    imagePullPolicy: Always
    name: nginx-container
    resources: {}
    terminationMessagePath: /dev/termination-log
    terminationMessagePolicy: File
    volumeMounts:
    - mountPath: /var/www/html
      name: shared-files
    - mountPath: /etc/nginx/nginx.conf
      name: nginx-config-volume
      subPath: nginx.conf
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-fz7c7
      readOnly: true
  dnsPolicy: ClusterFirst
  enableServiceLinks: true
  nodeName: jump-host
  preemptionPolicy: PreemptLowerPriority
  priority: 0
  restartPolicy: Always
  schedulerName: default-scheduler
  securityContext: {}
  serviceAccount: default
  serviceAccountName: default
  terminationGracePeriodSeconds: 30
  tolerations:
  - effect: NoExecute
    key: node.kubernetes.io/not-ready
    operator: Exists
    tolerationSeconds: 300
  - effect: NoExecute
    key: node.kubernetes.io/unreachable
    operator: Exists
    tolerationSeconds: 300
  volumes:
  - emptyDir: {}
    name: shared-files
  - configMap:
      defaultMode: 420
      name: nginx-config
    name: nginx-config-volume
  - name: kube-api-access-fz7c7
    projected:
      defaultMode: 420
      sources:
      - serviceAccountToken:
          expirationSeconds: 3607
          path: token
      - configMap:
          items:
          - key: ca.crt
            path: ca.crt
          name: kube-root-ca.crt
      - downwardAPI:
          items:
          - fieldRef:
              apiVersion: v1
              fieldPath: metadata.namespace
            path: namespace
status:
  conditions:
  - lastProbeTime: null
    lastTransitionTime: "2026-05-24T15:59:22Z"
    observedGeneration: 1
    status: "True"
    type: PodReadyToStartContainers
  - lastProbeTime: null
    lastTransitionTime: "2026-05-24T15:59:15Z"
    observedGeneration: 1
    status: "True"
    type: Initialized
  - lastProbeTime: null
    lastTransitionTime: "2026-05-24T15:59:22Z"
    observedGeneration: 1
    status: "True"
    type: Ready
  - lastProbeTime: null
    lastTransitionTime: "2026-05-24T15:59:22Z"
    observedGeneration: 1
    status: "True"
    type: ContainersReady
  - lastProbeTime: null
    lastTransitionTime: "2026-05-24T15:59:15Z"
    observedGeneration: 1
    status: "True"
    type: PodScheduled
  containerStatuses:
  - containerID: containerd://37d8944521c873963c0460a5dbab7cfb6b7113e7402c7f0ef11360d5a66bf4b0
    image: docker.io/library/nginx:latest
    imageID: docker.io/library/nginx@sha256:5aca99593157f4ae539a5dec1092a0ad8762f8e2eb1789085a13a0f5622369f6
    lastState: {}
    name: nginx-container
    ready: true
    resources: {}
    restartCount: 0
    started: true
    state:
      running:
        startedAt: "2026-05-24T15:59:21Z"
    volumeMounts:
    - mountPath: /var/www/html
      name: shared-files
    - mountPath: /etc/nginx/nginx.conf
      name: nginx-config-volume
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-fz7c7
      readOnly: true
      recursiveReadOnly: Disabled
  - containerID: containerd://4cd1df8798efe33b070f0b73646e42688cf17047087fc92575f435da9d465f1b
    image: docker.io/library/php:7.2-fpm-alpine
    imageID: docker.io/library/php@sha256:2e2d92415f3fc552e9a62548d1235f852c864fcdc94bcf2905805d92baefc87f
    lastState: {}
    name: php-fpm-container
    ready: true
    resources: {}
    restartCount: 0
    started: true
    state:
      running:
        startedAt: "2026-05-24T15:59:18Z"
    volumeMounts:
    - mountPath: /usr/share/nginx/html
      name: shared-files
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-fz7c7
      readOnly: true
      recursiveReadOnly: Disabled
  hostIP: 10.244.153.161
  hostIPs:
  - ip: 10.244.153.161
  observedGeneration: 1
  phase: Running
  podIP: 10.22.0.9
  podIPs:
  - ip: 10.22.0.9
  qosClass: BestEffort
  startTime: "2026-05-24T15:59:15Z"
thor@jump-host ~$ 

thor@jump-host ~$ kubectl logs nginx-phpfpm -c nginx-container
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
thor@jump-host ~$

thor@jump-host ~$ kubectl get configmap nginx-config -o yaml
apiVersion: v1
data:
  nginx.conf: |
    events {
    }
    http {
      server {
        listen 8099 default_server;
        listen [::]:8099 default_server;

        # Set nginx to serve files from the shared volume!
        root /var/www/html;
        index  index.html index.htm index.php;
        server_name _;
        location / {
          try_files $uri $uri/ =404;
        }
        location ~ \.php$ {
          include fastcgi_params;
          fastcgi_param REQUEST_METHOD $request_method;
          fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
          fastcgi_pass 127.0.0.1:9000;
        }
      }
    }
kind: ConfigMap
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","data":{"nginx.conf":"events {\n}\nhttp {\n  server {\n    listen 8099 default_server;\n    listen [::]:8099 default_server;\n\n    # Set nginx to serve files from the shared volume!\n    root /var/www/html;\n    index  index.html index.htm index.php;\n    server_name _;\n    location / {\n      try_files $uri $uri/ =404;\n    }\n    location ~ \\.php$ {\n      include fastcgi_params;\n      fastcgi_param REQUEST_METHOD $request_method;\n      fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;\n      fastcgi_pass 127.0.0.1:9000;\n    }\n  }\n}\n"},"kind":"ConfigMap","metadata":{"annotations":{},"name":"nginx-config","namespace":"default"}}
  creationTimestamp: "2026-05-24T15:59:15Z"
  name: nginx-config
  namespace: default
  resourceVersion: "1410"
  uid: 5411feca-a692-4cec-b2f3-1a75a0f23381
thor@jump-host ~$ 

thor@jump-host ~$ vi /tmp/nginx.yaml
thor@jump-host ~$ cat /tmp/nginx.yaml
apiVersion: v1
kind: Pod
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","kind":"Pod","metadata":{"annotations":{},"labels":{"app":"php-app"},"name":"nginx-phpfpm","namespace":"default"},"spec":{"containers":[{"image":"php:7.2-fpm-alpine","name":"php-fpm-container","volumeMounts":[{"mountPath":"/usr/share/nginx/html","name":"shared-files"}]},{"image":"nginx:latest","name":"nginx-container","volumeMounts":[{"mountPath":"/var/www/html","name":"shared-files"},{"mountPath":"/etc/nginx/nginx.conf","name":"nginx-config-volume","subPath":"nginx.conf"}]}],"volumes":[{"emptyDir":{},"name":"shared-files"},{"configMap":{"name":"nginx-config"},"name":"nginx-config-volume"}]}}
  creationTimestamp: "2026-05-24T15:59:15Z"
  generation: 1
  labels:
    app: php-app
  name: nginx-phpfpm
  namespace: default
  resourceVersion: "1429"
  uid: 0903d2c8-e312-45be-bde0-572abbec8428
spec:
  containers:
  - image: php:7.2-fpm-alpine
    imagePullPolicy: IfNotPresent
    name: php-fpm-container
    resources: {}
    terminationMessagePath: /dev/termination-log
    terminationMessagePolicy: File
    volumeMounts:
    - mountPath: /var/www/html
      name: shared-files
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-fz7c7
      readOnly: true
  - image: nginx:latest
    imagePullPolicy: Always
    name: nginx-container
    resources: {}
    terminationMessagePath: /dev/termination-log
    terminationMessagePolicy: File
    volumeMounts:
    - mountPath: /var/www/html
      name: shared-files
    - mountPath: /etc/nginx/nginx.conf
      name: nginx-config-volume
      subPath: nginx.conf
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-fz7c7
      readOnly: true
  dnsPolicy: ClusterFirst
  enableServiceLinks: true
  nodeName: jump-host
  preemptionPolicy: PreemptLowerPriority
  priority: 0
  restartPolicy: Always
  schedulerName: default-scheduler
  securityContext: {}
  serviceAccount: default
  serviceAccountName: default
  terminationGracePeriodSeconds: 30
  tolerations:
  - effect: NoExecute
    key: node.kubernetes.io/not-ready
    operator: Exists
    tolerationSeconds: 300
  - effect: NoExecute
    key: node.kubernetes.io/unreachable
    operator: Exists
    tolerationSeconds: 300
  volumes:
  - emptyDir: {}
    name: shared-files
  - configMap:
      defaultMode: 420
      name: nginx-config
    name: nginx-config-volume
  - name: kube-api-access-fz7c7
    projected:
      defaultMode: 420
      sources:
      - serviceAccountToken:
          expirationSeconds: 3607
          path: token
      - configMap:
          items:
          - key: ca.crt
            path: ca.crt
          name: kube-root-ca.crt
      - downwardAPI:
          items:
          - fieldRef:
              apiVersion: v1
              fieldPath: metadata.namespace
            path: namespace
status:
  conditions:
  - lastProbeTime: null
    lastTransitionTime: "2026-05-24T15:59:22Z"
    observedGeneration: 1
    status: "True"
    type: PodReadyToStartContainers
  - lastProbeTime: null
    lastTransitionTime: "2026-05-24T15:59:15Z"
    observedGeneration: 1
    status: "True"
    type: Initialized
  - lastProbeTime: null
    lastTransitionTime: "2026-05-24T15:59:22Z"
    observedGeneration: 1
    status: "True"
    type: Ready
  - lastProbeTime: null
    lastTransitionTime: "2026-05-24T15:59:22Z"
    observedGeneration: 1
    status: "True"
    type: ContainersReady
  - lastProbeTime: null
    lastTransitionTime: "2026-05-24T15:59:15Z"
    observedGeneration: 1
    status: "True"
    type: PodScheduled
  containerStatuses:
  - containerID: containerd://37d8944521c873963c0460a5dbab7cfb6b7113e7402c7f0ef11360d5a66bf4b0
    image: docker.io/library/nginx:latest
    imageID: docker.io/library/nginx@sha256:5aca99593157f4ae539a5dec1092a0ad8762f8e2eb1789085a13a0f5622369f6
    lastState: {}
    name: nginx-container
    ready: true
    resources: {}
    restartCount: 0
    started: true
    state:
      running:
        startedAt: "2026-05-24T15:59:21Z"
    volumeMounts:
    - mountPath: /var/www/html
      name: shared-files
    - mountPath: /etc/nginx/nginx.conf
      name: nginx-config-volume
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-fz7c7
      readOnly: true
      recursiveReadOnly: Disabled
  - containerID: containerd://4cd1df8798efe33b070f0b73646e42688cf17047087fc92575f435da9d465f1b
    image: docker.io/library/php:7.2-fpm-alpine
    imageID: docker.io/library/php@sha256:2e2d92415f3fc552e9a62548d1235f852c864fcdc94bcf2905805d92baefc87f
    lastState: {}
    name: php-fpm-container
    ready: true
    resources: {}
    restartCount: 0
    started: true
    state:
      running:
        startedAt: "2026-05-24T15:59:18Z"
    volumeMounts:
    - mountPath: /usr/share/nginx/html
      name: shared-files
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-fz7c7
      readOnly: true
      recursiveReadOnly: Disabled
  hostIP: 10.244.153.161
  hostIPs:
  - ip: 10.244.153.161
  observedGeneration: 1
  phase: Running
  podIP: 10.22.0.9
  podIPs:
  - ip: 10.22.0.9
  qosClass: BestEffort
  startTime: "2026-05-24T15:59:15Z"
thor@jump-host ~$

thor@jump-host /tmp$ ls -la
total 120
drwxrwxrwx    2 root     root          4096 May 24 16:20 .
dr-xr-xr-x    1 root     root          4096 May 24 16:21 ..
-rw-rw-rw-    1 thor     thor         89082 May 24 16:21 demofile2.json
-rw-r--r--    1 thor     thor          5291 May 24 16:07 nginx
-rw-r--r--    1 thor     thor          5283 May 24 16:20 nginx.yaml
-rwxr-xr-x    1 root     root           208 May 24 15:59 startup-script.sh
thor@jump-host /tmp$



```

