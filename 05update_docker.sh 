#!/bin/bash



#UNCOMMENT to update docker, otherwise will be updated on instance init or rebuild
#rm -f /opt/elasticbeanstalk/docker_updated



echo "checking docker..."
if [ ! -f "/opt/elasticbeanstalk/docker_updated" ]; then
yum update docker -y && touch /opt/elasticbeanstalk/docker_updated
echo "YAY! Updated global NPM version to `npm -v`"
else
  echo "Skipping NPM -g version update. To update, please uncomment 40install_node.sh:12"
fi
