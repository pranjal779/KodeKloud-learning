# Automating Jenkins using CLI and APIs

Automating Jenkins using its Command Line Interface (CLI) and Remote Access API (REST API) refers to the practice of programmatically interacting with and managing Jenkins instances, rather than relying solely on the graphical user interface (GUI). This allows for greater efficiency, consistency, and integration with other tools in a CI/CD pipeline. 
Jenkins CLI: 
The Jenkins CLI provides a command-line interface to perform various administrative and operational tasks on a Jenkins instance. You can use it to: 

• Manage Jobs: Create, copy, delete, build, and view job configurations. 
• Manage Nodes: Add, remove, and configure build agents (nodes). 
• Manage Plugins: Install, uninstall, and update Jenkins plugins. 
• System Administration: Shut down, restart, or reload Jenkins configuration. 
• Execute Groovy Scripts: Run Groovy scripts for advanced automation and troubleshooting. 

The CLI can be accessed over SSH or by downloading and executing the jenkins-cli.jar file. 
Jenkins Remote Access API (REST API): 
The Jenkins Remote Access API provides a RESTful interface to interact with Jenkins programmatically using HTTP requests. This allows for: 

• Integration with External Systems: Connect Jenkins with other tools, scripts, and applications that can send and receive HTTP requests. 
• Building Custom Tools: Develop custom applications or scripts to manage Jenkins. 
• Accessing Data: Retrieve information about jobs, builds, plugins, and other Jenkins components in various formats (XML, JSON). 
• Triggering Actions: Initiate builds, update job configurations, and perform other actions remotely. 

Benefits of Automation with CLI and APIs: 

• Repeatability and Consistency: Automate tasks to ensure consistent configurations and actions across multiple Jenkins instances or projects. 
• Efficiency: Reduce manual effort and potential for human error by scripting routine tasks. 
• Integration: Seamlessly integrate Jenkins into broader CI/CD workflows and external tools. 
• Version Control: Store Jenkins configurations as code, enabling version control and collaborative management. 
• Scalability: Manage and scale Jenkins environments more effectively. 

# Jenkins CLI - SSH
<img width="2031" height="1092" alt="image" src="https://github.com/user-attachments/assets/069ad3c3-dc81-4364-8db1-412dd6f8e150" />

# Jenkins CLI - JAR
* The Default transport for the CLI client is HTTP, which eliminates the need to open additional ports in a firewall.
<img width="1928" height="1042" alt="image" src="https://github.com/user-attachments/assets/3afa9baf-f6d4-407a-b16b-41ac2f86a8d0" />
<img width="2502" height="1371" alt="image" src="https://github.com/user-attachments/assets/2533d8f6-41fb-4960-aac8-030d83973077" />

# Jenkins REST API
<img width="1898" height="948" alt="image" src="https://github.com/user-attachments/assets/7dae9d86-90ee-43fa-bfe5-dd8f7384d8d1" />


# Jenkins CLI - Build a job DEMO
<img width="2480" height="1413" alt="image" src="https://github.com/user-attachments/assets/b991f540-10a6-4fae-a505-48a72143950a" />
<img width="2423" height="925" alt="image" src="https://github.com/user-attachments/assets/51918ad0-dcd1-4b7d-9316-f3f09a9d1350" />
<img width="1588" height="792" alt="image" src="https://github.com/user-attachments/assets/bf37005b-7d6c-4447-9307-65007bd0b16b" />
<img width="1292" height="607" alt="image" src="https://github.com/user-attachments/assets/2df1ef76-2199-4939-a264-2a12dea6480f" />
<img width="1491" height="787" alt="image" src="https://github.com/user-attachments/assets/75a50939-8997-4cfc-92c2-72f6824ce1db" />
<img width="1955" height="922" alt="image" src="https://github.com/user-attachments/assets/e6adbe71-1f2f-4f43-82f2-3a7878b964e5" />
<img width="1657" height="1028" alt="image" src="https://github.com/user-attachments/assets/1912f3e0-2ec7-41e4-95ca-536033882f62" />
<img width="1652" height="920" alt="image" src="https://github.com/user-attachments/assets/e0c91c22-d881-4e72-a099-579e56a0a3c2" />
<img width="1780" height="1170" alt="image" src="https://github.com/user-attachments/assets/7afa7e93-b487-471f-8f3f-097e20eec106" />
<img width="1847" height="1096" alt="image" src="https://github.com/user-attachments/assets/ffed192d-6a39-4b29-bb7f-8ce10f5926c8" />
<img width="2040" height="773" alt="image" src="https://github.com/user-attachments/assets/ed5d2660-2a4d-476d-b3ba-38e30f5fb5d0" />
<img width="2052" height="292" alt="image" src="https://github.com/user-attachments/assets/0fc67663-18e3-4176-96f0-72de2350ef65" />
**add another parameter to log the console output in the terminal refer the commands**
<img width="2078" height="450" alt="image" src="https://github.com/user-attachments/assets/d28adc17-aa3d-422f-aff0-88660b0f5065" />
<img width="1091" height="188" alt="image" src="https://github.com/user-attachments/assets/e43bf49f-8d7e-49d1-8ee0-9fb2555edd4f" />
<img width="2067" height="1223" alt="image" src="https://github.com/user-attachments/assets/8206ad51-f36d-46bd-8ab5-697cec4c447e" />
<img width="2043" height="275" alt="image" src="https://github.com/user-attachments/assets/458c32eb-a52e-429f-92e1-7423a5aa8fa6" />
<img width="2031" height="932" alt="image" src="https://github.com/user-attachments/assets/766d8421-0afa-4d44-9cdd-389341c2f992" />
<img width="2026" height="537" alt="image" src="https://github.com/user-attachments/assets/a3829c32-3eea-428f-9de6-9ffb085ec49f" />
<img width="2005" height="1162" alt="image" src="https://github.com/user-attachments/assets/974b6311-4a4c-4c79-b9f4-ab3c1ef94b6b" />

