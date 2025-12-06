# Run - Start a container
docker run nginx

# ps - List containers
docker ps

docker ps -a

docker stop <imageName>
# or
docker stop <ContainerID>

docker ps -a # to check if the container is stopped
# a stopped container still exist and can be seen in the docker ps -a command output
# it will be in Exited status

# RM - Remove a container
docker rm <Name>

docker ps -a

# Images - List images
docker images

# rmi - Remove Images
docker rmi nginx # Delete all dependent containers to remove images


# Pull - download an image
docker run nginx

docker pull nginx


docker run ubuntu

docker ps

docker ps -a

# Append a Command
docker run ubuntu

docker run ubuntu sleep 5

# Exec - execute a command
docker ps -a

docker exec <name> cat /etc/hosts

# Run - attach and detach
docker run kodekloud/simple-webapp

docker run -d kodekloud/simple-webapp

docker ps

docker attach <name Or ID first few characters of ID>

