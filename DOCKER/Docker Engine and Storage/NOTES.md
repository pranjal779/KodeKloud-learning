# Docker Engine
<img width="1542" height="873" alt="image" src="https://github.com/user-attachments/assets/709571c8-2262-4064-9a13-8e512d3ec027" />
<img width="1680" height="908" alt="image" src="https://github.com/user-attachments/assets/2698dbea-c214-47ad-8624-3c4c249c8d23" />
<img width="1697" height="1025" alt="image" src="https://github.com/user-attachments/assets/d00666f3-9e42-402f-97ee-71706b80de02" />

# containerization
<img width="1697" height="1025" alt="image" src="https://github.com/user-attachments/assets/6a1eff41-6750-4f29-957f-f3b74b0c3c46" />

# Namespace - PID
## Process ID
**Process ID are unique and two processes cannot have the same process ID.**
<img width="1532" height="1011" alt="image" src="https://github.com/user-attachments/assets/5516adb5-da1b-4a5c-a107-e20beaf2ad11" />
<img width="1447" height="1012" alt="image" src="https://github.com/user-attachments/assets/59c6ac8f-89a5-4158-81ef-c5c78038e7f1" />
<img width="1575" height="1070" alt="image" src="https://github.com/user-attachments/assets/db7526a6-f763-4866-8055-d56ba4ada8d1" />


https://github.com/user-attachments/assets/20895087-5f8c-4196-a050-a90109fd5455


# Cgroups
- So We Learned that underlying Docker Host as well as the containers share the same system resources such as CPU and Memory.
- How much of the resources are dedicated to the host and the containers?
- How much does Docker manage and share the resources between the containers?
- By default, there is no restriction as to how much of a resource a container can use.
- And hence, a container may end up utilizing all of the resources on the underlying host.
- But there is a way to restrict the amount of CPU or memeory a container can use.
- Docker uses Cgroups or control groups to restrict the amount of hardware resources allocated to each container
- THis can be Done by providing the --cpu option to the Docker run command
- <img width="1962" height="1145" alt="image" src="https://github.com/user-attachments/assets/5621d664-d465-446b-828e-972f95f6eca5" />
- <img width="1207" height="1051" alt="image" src="https://github.com/user-attachments/assets/6b379f38-826c-4966-95e3-935964f68df8" /> 
