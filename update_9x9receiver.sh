#!/bin/bash
# update_9x9receiver.sh: init & deploy 9x9receiver

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

RECEIVER_HOME=/var/www/9x9/9x9_receiver
RECEIVER_GIT=git@bitbucket.org:9x9group/9x9_receiver.git


##########################
# Check related pacakges #
##########################
init_receiver () {
	# Check Node.js
	if ! dpkg -s nodejs &>/dev/null; then
		sudo apt-get update
		sudo apt-get install -y python-software-properties python g++ make
		sudo add-apt-repository -y ppa:chris-lea/node.js
		sudo apt-get update
		sudo apt-get install -y nodejs
	fi
	
	# Check Ruby, Rubygems
	if ! dpkg -s rubygems &>/dev/null; then
		sudo apt-get install -y ruby rubygems
	fi
	
	# Check Compass
	if ! gem list -i compass &>/dev/null; then
		sudo gem install compass
	fi
	
	# Check Yeoman
	if ! npm list -g | grep 'yo@' &>/dev/null; then
		sudo npm install -g yo
	fi
	
	
	# Check 9x9 chromecase receiver
	if [ ! -d "$RECEIVER_HOME" ]; then
		mkdir -p $RECEIVER_HOME
		cd $(dirname $RECEIVER_HOME)
		git clone $RECEIVER_GIT $(basename $RECEIVER_HOME)
		cd $RECEIVER_HOME
		git checkout develop
		npm install 
		bower install
	fi
}

# Build 
update_receiver () {
	cd $RECEIVER_HOME
	git checkout develop &>/dev/null
	if git pull | grep -v 'up-to-date' &>/dev/null; then
		grunt build
		grunt debug
	fi
}

case $1 in
	"init")
		init_receiver
		update_receiver
	;;
	"update")
		update_receiver
	;;
esac
	

