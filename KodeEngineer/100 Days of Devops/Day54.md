# Day 54: Kubernetes Shared Volumes

[reference 1](https://medium.com/@rkasthuri2002/100-days-of-devops-with-kodekloud-days-51-60-mastering-kubernetes-deployments-and-b02216146544)

<img width="873" height="1211" alt="image" src="https://github.com/user-attachments/assets/e5184c8a-696b-4f2b-baf2-785874e5e64d" />

We are working on an application that will be deployed on multiple containers within a pod on Kubernetes cluster.  
There is a requirement to share a volume among the containers to save some temporary data.  
The Nautilus DevOps team is developing a similar template to replicate the scenario.  
Below you can find more details about it.

1. Create a pod named volume-share-xfusion.
2. For the first container, use image ubuntu with latest tag only and remember to mention the tag i.e ubuntu:latest, container should be named as volume-container-xfusion-1, and run a sleep command for it so that it remains in running state. Volume volume-share should be mounted at path /tmp/beta.
3. For the second container, use image ubuntu with the latest tag only and remember to mention the tag i.e ubuntu:latest, container should be named as volume-container-xfusion-2, and again run a sleep command for it so that it remains in running state. Volume volume-share should be mounted at path /tmp/demo.
4. Volume name should be volume-share of type emptyDir.
5. After creating the pod, exec into the first container i.e volume-container-xfusion-1, and just for testing create a file beta.txt with the content Welcome to xFusionCorp Industries under the mounted path of first container i.e /tmp/beta.
6. The file beta.txt should be present under the mounted path /tmp/demo on the second container volume-container-xfusion-2 as well, since they are using a shared volume.

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.

<img width="1511" height="1287" alt="image" src="https://github.com/user-attachments/assets/5db77c47-f736-4a20-bac9-5b87c7f6d71f" />

```sh
thor@jump-host ~$ vi volume-share-xfusion.yaml
thor@jump-host ~$ cat volume-share-xfusion.yaml
apiVersion: v1
kind: Pod
metadata:
  name: volume-share-xfusion
spec:
  containers:
    - name: volume-container-xfusion-1
      image: ubuntu:latest
      commad: ["sleep", "infinity"]
      volumeMounts:
        - name: volume-share
          mountPath: /tmp/beta
    - name: volume-container-xfusion-2
      image: ubuntu:latest
      command: ["sleep", "infinity"]
      volumeMounts:
        - name: volume-share
          mountPath: /tmp/demo
  volumes:
    - name: volume-share
      emptyDir: {}

thor@jump-host ~$ 


thor@jump-host ~$ kubectl apply -f volume-share-xfusion.yaml 
Error from server (BadRequest): error when creating "volume-share-xfusion.yaml": Pod in version "v1" cannot be handled as a Pod: strict decoding error: unknown field "spec.containers[0].commad"
thor@jump-host ~$ vi volume-share-xfusion.yaml
thor@jump-host ~$ kubectl apply -f volume-share-xfusion.yaml 
pod/volume-share-xfusion created
thor@jump-host ~$ cat volume-share-xfusion.yaml
apiVersion: v1
kind: Pod
metadata:
  name: volume-share-xfusion
spec:
  containers:
    - name: volume-container-xfusion-1
      image: ubuntu:latest
      command: ["sleep", "infinity"]
      volumeMounts:
        - name: volume-share
          mountPath: /tmp/beta
    - name: volume-container-xfusion-2
      image: ubuntu:latest
      command: ["sleep", "infinity"]
      volumeMounts:
        - name: volume-share
          mountPath: /tmp/demo
  volumes:
    - name: volume-share
      emptyDir: {}

thor@jump-host ~$



thor@jump-host ~$ kubectl get pods
NAME                   READY   STATUS    RESTARTS   AGE
volume-share-xfusion   2/2     Running   0          39s
thor@jump-host ~$ kubectl get pods volume-share-xfusion
NAME                   READY   STATUS    RESTARTS   AGE
volume-share-xfusion   2/2     Running   0          59s
thor@jump-host ~$


thor@jump-host ~$ kubectl exec -it volume-share-xfusion -c volume-container-xfusion-1 --bash
error: unknown flag: --bash
See 'kubectl exec --help' for usage.
thor@jump-host ~$

thor@jump-host ~$ kubectl exec -it volume-share-xfusion -c volume-container-xfusion-1 -- bash
root@volume-share-xfusion:/#

thor@jump-host ~$ kubectl exec -it volume-share-xfusion -c volume-container-xfusion-1 -- bash
root@volume-share-xfusion:/# vi beta.txt
bash: vi: command not found
root@volume-share-xfusion:/# echo "Welcome to xFusionCorp Industries" > /tmp/beta/beta.txt
root@volume-share-xfusion:/# ls -la /tmp/beta/
total 12
drwxrwxrwx 2 root root 4096 May 24 18:34 .
drwxrwxrwt 1 root root 4096 May 24 18:28 ..
-rw-r--r-- 1 root root   34 May 24 18:34 beta.txt
root@volume-share-xfusion:/#
root@volume-share-xfusion:/# exit
exit
thor@jump-host ~$

thor@jump-host ~$ kubectl exec -it volume-share-xfusion -c volume-container-xfusion-2 -- bash
root@volume-share-xfusion:/# ls -la /tmp/demo/
total 12
drwxrwxrwx 2 root root 4096 May 24 18:34 .
drwxrwxrwt 1 root root 4096 May 24 18:28 ..
-rw-r--r-- 1 root root   34 May 24 18:34 beta.txt
root@volume-share-xfusion:/# 

thor@jump-host ~$ history
    1  vi volume-share-xfusion.yaml
    2  cat volume-share-xfusion.yaml
    3  kubectl apply -f volume-share-xfusion.yaml 
    4  vi volume-share-xfusion.yaml
    5  kubectl apply -f volume-share-xfusion.yaml 
    6  cat volume-share-xfusion.yaml
    7  kubectl get pods
    8  kubectl get pods volume-share-xfusion
    9  kubectl exec -it volume-share-xfusion -c volume-container-xfusion-1 --bash
   10  kubectl exec --help
   11  kubectl exec -it volume-share-xfusion -c volume-container-xfusion-1 -- bash
   12  kubectl exec -it volume-share-xfusion -c volume-container-xfusion-2 -- bash
   13  history
thor@jump-host ~$ 


```


<img width="1197" height="267" alt="image" src="https://github.com/user-attachments/assets/8cf1c03b-6f74-461c-9564-933aef692b7a" />

<img width="2251" height="1282" alt="image" src="https://github.com/user-attachments/assets/d25fe3f9-fbde-4350-93cd-b87fd715316d" />
<img width="2135" height="1097" alt="image" src="https://github.com/user-attachments/assets/cf117afd-5eb8-4606-a46b-ec5cd99babc1" />
<img width="2162" height="1393" alt="image" src="https://github.com/user-attachments/assets/a3cf7b43-3a02-4e2e-83f5-2c6da0ec1a58" />


```sh
thor@jump-host ~$ history
    1  vi volume-share-xfusion.yaml
    2  cat volume-share-xfusion.yaml
    3  kubectl apply -f volume-share-xfusion.yaml 
    4  vi volume-share-xfusion.yaml
    5  kubectl apply -f volume-share-xfusion.yaml 
    6  cat volume-share-xfusion.yaml
    7  kubectl get pods
    8  kubectl get pods volume-share-xfusion
    9  kubectl exec -it volume-share-xfusion -c volume-container-xfusion-1 --bash
   10  kubectl exec --help
   11  kubectl exec -it volume-share-xfusion -c volume-container-xfusion-1 -- bash
   12  kubectl exec -it volume-share-xfusion -c volume-container-xfusion-2 -- bash
   13  history
thor@jump-host ~$
```


```sh
thor@jump-host ~$ kubectl exec --help
Execute a command in a container.

Examples:
  # Get output from running the 'date' command from pod mypod, using the first container by default
  kubectl exec mypod -- date
  
  # Get output from running the 'date' command in ruby-container from pod mypod
  kubectl exec mypod -c ruby-container -- date
  
  # Switch to raw terminal mode; sends stdin to 'bash' in ruby-container from pod mypod
  # and sends stdout/stderr from 'bash' back to the client
  kubectl exec mypod -c ruby-container -i -t -- bash -il
  
  # List contents of /usr from the first container of pod mypod and sort by modification time
  # If the command you want to execute in the pod has any flags in common (e.g. -i),
  # you must use two dashes (--) to separate your command's flags/arguments
  # Also note, do not surround your command and its flags/arguments with quotes
  # unless that is how you would execute it normally (i.e., do ls -t /usr, not "ls -t /usr")
  kubectl exec mypod -i -t -- ls -t /usr
  
  # Get output from running 'date' command from the first pod of the deployment mydeployment, using the first container
by default
  kubectl exec deploy/mydeployment -- date
  
  # Get output from running 'date' command from the first pod of the service myservice, using the first container by
default
  kubectl exec svc/myservice -- date

Options:
    -c, --container='':
        Container name. If omitted, use the kubectl.kubernetes.io/default-container annotation for selecting the
        container to be attached or the first container in the pod will be chosen

    -f, --filename=[]:
        to use to exec into the resource

    --pod-running-timeout=1m0s:
        The length of time (like 5s, 2m, or 3h, higher than zero) to wait until at least one pod is running

    -q, --quiet=false:
        Only print output from the remote session

    -i, --stdin=false:
        Pass stdin to the container

    -t, --tty=false:
        Stdin is a TTY

Usage:
  kubectl exec (POD | TYPE/NAME) [-c CONTAINER] [flags] -- COMMAND [args...] [options]

Use "kubectl options" for a list of global command-line options (applies to all commands).
thor@jump-host ~$
```
