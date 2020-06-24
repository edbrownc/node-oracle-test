#Stop all 
docker stop $(docker ps -a -q)

#Destroy all containers
docker rm $(docker ps -a -q)

#Destroy all images
docker rmi $(docker images -q)