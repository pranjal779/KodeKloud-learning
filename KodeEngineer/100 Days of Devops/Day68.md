# Day 68: Set Up Jenkins Server  

The DevOps team at xFusionCorp Industries is initiating the setup of CI/CD pipelines and has decided to utilize Jenkins as their server. Execute the task according to the provided requirements:  

1. Install Jenkins on the jenkins server using the apt utility only, and start it using the service command.  

If you face a timeout issue while starting the Jenkins service, first check the service status with service jenkins status  
Then review the logs in /var/log/jenkins/jenkins.log to identify the cause.  
2. Jenkin's admin user name should be theadmin, password should be Adm!n321, full name should be Anita and email should be anita@jenkins.stratos.xfusioncorp.com.  

Note:  
1. To access the jenkins server, connect from the jump host using the root user with the password S3curePass.  
2. After Jenkins server installation, click the Jenkins button on the top bar to access the Jenkins UI and follow on-screen instructions to create an admin user.

<img width="855" height="677" alt="image" src="https://github.com/user-attachments/assets/acc0fd26-2011-40ae-bcd8-1e5f56109ca0" />

<img width="1657" height="1062" alt="image" src="https://github.com/user-attachments/assets/d5484df5-d96b-474d-ac0d-f196dc48888b" />
<img width="1992" height="1135" alt="image" src="https://github.com/user-attachments/assets/4ef6115b-7216-44d1-8218-96e05cc0165f" />


```sh
root@jenkins ~ ➜  cat /var/log/jenkins/jenkins.log 
Running with Java 11 from /usr/lib/jvm/java-11-openjdk-amd64, which is older than the minimum required version (Java 21).
Supported Java versions are: [21, 25]
See https://jenkins.io/redirect/java-support/ for more information.
Running from: /usr/share/java/jenkins.war
2026-06-10 11:22:06.424+0000 [id=1]     INFO    winstone.Logger#logInternal: Beginning extraction from war file
2026-06-10 11:22:07.408+0000 [id=1]     WARNING o.e.j.ee9.nested.ContextHandler#setContextPath: Empty contextPath
2026-06-10 11:22:07.440+0000 [id=1]     INFO    org.eclipse.jetty.server.Server#doStart: jetty-12.1.8; built: 2026-04-01T01:09:18.991Z; git: c9cdc9aaa434a3665b8a53b4d1cc3684992da649; jvm 21.0.11+10-1-24.04.2-Ubuntu
2026-06-10 11:22:08.342+0000 [id=1]     INFO    o.e.j.e.w.StandardDescriptorProcessor#visitServlet: NO JSP Support for /, did not find org.eclipse.jetty.ee9.jsp.JettyJspServlet
2026-06-10 11:22:08.433+0000 [id=1]     INFO    o.e.j.s.DefaultSessionIdManager#doStart: Session workerName=node0
2026-06-10 11:22:09.348+0000 [id=1]     INFO    hudson.WebAppMain#contextInitialized: Jenkins home directory: /var/lib/jenkins found at: EnvVars.masterEnvVars.get("JENKINS_HOME")
2026-06-10 11:22:09.537+0000 [id=1]     INFO    o.e.j.s.handler.ContextHandler#doStart: Started oeje9n.ContextHandler$CoreContextHandler@21f8e55f{Jenkins v2.555.2,/,b=file:///var/cache/jenkins/war/,a=AVAILABLE,h=oeje9n.ContextHandler$CoreContextHandler$CoreToNestedHandler@d5ce97f{STARTED}}
2026-06-10 11:22:09.613+0000 [id=1]     INFO    o.e.j.server.AbstractConnector#doStart: Started oejs.ServerConnector@43ae1ce4{HTTP/1.1, (http/1.1)}{0.0.0.0:8080}
2026-06-10 11:22:09.616+0000 [id=1]     INFO    org.eclipse.jetty.server.Server#doStart: Started oejs.Server@468be356{STARTING}[12.1.8,sto=0] @2174ms
2026-06-10 11:22:09.617+0000 [id=55]    INFO    winstone.Logger#logInternal: Winstone Servlet Engine running: controlPort=disabled
2026-06-10 11:22:09.749+0000 [id=51]    INFO    jenkins.model.Jenkins#<init>: Starting version 2.555.2
2026-06-10 11:22:09.933+0000 [id=63]    INFO    jenkins.InitReactorRunner$1#onAttained: Started initialization
2026-06-10 11:22:10.016+0000 [id=83]    INFO    jenkins.InitReactorRunner$1#onAttained: Listed all plugins
2026-06-10 11:22:11.819+0000 [id=91]    INFO    jenkins.InitReactorRunner$1#onAttained: Prepared all plugins
2026-06-10 11:22:11.822+0000 [id=64]    INFO    jenkins.InitReactorRunner$1#onAttained: Started all plugins
2026-06-10 11:22:11.822+0000 [id=64]    INFO    jenkins.InitReactorRunner$1#onAttained: Augmented all extensions
2026-06-10 11:22:12.331+0000 [id=87]    INFO    jenkins.InitReactorRunner$1#onAttained: System config loaded
2026-06-10 11:22:12.332+0000 [id=86]    INFO    jenkins.InitReactorRunner$1#onAttained: System config adapted
2026-06-10 11:22:12.332+0000 [id=61]    INFO    jenkins.InitReactorRunner$1#onAttained: Loaded all jobs
2026-06-10 11:22:12.334+0000 [id=62]    INFO    jenkins.InitReactorRunner$1#onAttained: Configuration for all jobs updated
2026-06-10 11:22:12.424+0000 [id=108]   INFO    hudson.util.Retrier#start: Attempt #1 to do the action check updates server
2026-06-10 11:22:13.815+0000 [id=62]    INFO    jenkins.install.SetupWizard#init: 
[LF]> 
[LF]> *************************************************************
[LF]> *************************************************************
[LF]> *************************************************************
[LF]> 
[LF]> Jenkins initial setup is required. An admin user has been created and a password generated.
[LF]> Please use the following password to proceed to installation:
[LF]> 
[LF]> 604a2452a4bb430cb768b2f97fdd227c
[LF]> 
[LF]> This may also be found at: /var/lib/jenkins/secrets/initialAdminPassword
[LF]> 
[LF]> *************************************************************
[LF]> *************************************************************
[LF]> *************************************************************

2026-06-10 11:22:21.632+0000 [id=88]    INFO    jenkins.InitReactorRunner$1#onAttained: Completed initialization
2026-06-10 11:22:21.716+0000 [id=51]    INFO    hudson.lifecycle.Lifecycle#onReady: Jenkins is fully up and running
2026-06-10 11:22:22.255+0000 [id=108]   INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tasks.Maven.MavenInstaller
2026-06-10 11:22:22.258+0000 [id=108]   INFO    hudson.util.Retrier#start: Performed the action check updates server successfully at the attempt #1

root@jenkins ~ ➜



root@jenkins ~ ➜  history
    1  sudo apt update
    2  sudo apt install jenkins -y
    3  sudo service jenkins start
    4  sudo apt install openjdk-11-jdk -y
    5  curl -fsSL https://jenkins.io | sudo tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    6  echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://jenkins.io binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
    7  sudo apt install jenkins -y
    8  sudo systemctl start jenkins
    9  sudo service jenkins start
   10  sudo nano /etc/wsl.conf
   11  cat /var/log/jenkins/jenkins.log
   12  sudo apt update
   13  sudo apt install openjdk-17-jre fontconfig -y
   14  sudo apt update
   15  java -version
   16  sudo apt install fontconfig openjdk-21-jre
   17  java -version
   18  sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc   https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
   19  echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]"   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
   20  sudo apt update
   21  sudo apt install jenkins
   22  sudo systemctl start jenkins
   23  sudo service start jenkins
   24  sudo service jenkins start
   25  cat /var/log/jenkins/jenkins.log 
   26  history

root@jenkins ~ ➜  

```

<img width="2337" height="1116" alt="image" src="https://github.com/user-attachments/assets/9363a19f-9f41-4ba5-84ce-06e8130ac563" />
<img width="2336" height="1132" alt="image" src="https://github.com/user-attachments/assets/8ca062c5-264b-493b-8871-bed332d46d09" />
<img width="2425" height="1050" alt="image" src="https://github.com/user-attachments/assets/7ee4bb7c-b05c-40e2-880e-df0eefb79110" />
<img width="2397" height="1137" alt="image" src="https://github.com/user-attachments/assets/b5577747-a631-46b1-b2f2-f774a84f5840" />

