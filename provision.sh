#autoremove
sudo apt-get autoremove -y
# Node 
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs
# Sometimes node modules require
sudo apt-get install -y build-essential
# Git
sudo apt-get install -y git
# Use file provision to copy ~/.gitconfig
# Grunt
sudo npm install -g grunt-cli
# MongoDb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org