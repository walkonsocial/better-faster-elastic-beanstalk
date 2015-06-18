#!/bin/bash



#UNCOMMENT to update docker, otherwise will be updated on instance init or rebuild
#rm -f /opt/elasticbeanstalk/docker_updated

## clean stopped docker containers
docker rm $(docker ps -a -q)
## clean untagged docker images
docker rmi $(docker images | grep "^<none>" | awk '{print $3}')

echo "checking docker..."
if [ ! -f "/opt/elasticbeanstalk/docker_updated" ]; then
yum update docker -y && touch /opt/elasticbeanstalk/docker_updated
echo "YAY! Updated global NPM version to `docker -v`"
else
  echo "Skipping NPM -g version update. To update, please uncomment 40install_node.sh:12"
fi

echo "restarting docker service..."
service docker restart