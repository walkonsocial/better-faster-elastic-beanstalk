#!/bin/bash

function error_exit
{
  eventHelper.py --msg "$1" --severity ERROR
  exit $2
}


#UNCOMMENT to update npm, otherwise will be updated on instance init or rebuild
#rm -f /opt/elasticbeanstalk/node-install/npm_updated



echo "checking npm..."
if [ ! -f "/opt/elasticbeanstalk/node-install/npm_updated" ]; then
cd /opt/elasticbeanstalk/node-install/node-v$NODE_VER-linux-$ARCH/bin/ && /opt/elasticbeanstalk/node-install/node-v$NODE_VER-linux-$ARCH/bin/npm update npm -g
touch /opt/elasticbeanstalk/node-install/npm_updated
echo "YAY! Updated global NPM version to `npm -v`"
else
  echo "Skipping NPM -g version update. To update, please uncomment 40install_node.sh:12"
fi

