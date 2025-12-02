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

