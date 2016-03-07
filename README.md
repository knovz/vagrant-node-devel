# vagrant-node-devel
Vagrant box for node app development. Based on ubuntu/trusty64.

## Prerequisites
* Vagrant 1.8.1
* VirtualBox 5.0.14

Virtual Box 5.0.6 does not play well with Vagrant 1.8.1, synced folders do not work.
With Virtual Box 5.0.14 it is solved.

With a Windows host you'll need a shell environment that provides ssh. 

## Install
Clone repo. Bring up Vagrant virtual machine.

    $ git clone https://github.com/knovz/vagrant-node-devel.git 
    $ vagrant up

## VirtualBox Guest Additions
ubuntu/trusty has an older version of Guest Additions installed. To automatically check and update, install plugin from
https://github.com/dotless-de/vagrant-vbguest.

    $ vagrant plugin install vagrant-vbguest

## .gitignore
Git is configured to ignore .vagrant folder, and also a "workspace" folder. This allows to place there the app code to develop, 
from a different repo and not have it interfere.

## Vagrant Configuration
You can find this configuration in the Vagrantfile, and change it to suit your needs.

### vm box
Based on ubuntu/trusty64:

    config.vm.box = "ubuntu/trusty64"
    
### hostname and vm name
Hostname, and machine name inside VirtualBox:

    config.vm.hostname = "vg-node-devel"

    config.vm.provider "virtualbox" do |v|
        v.name = "my_vm"
    end

### Network
To access the nodejs app from the host machine, when running, we need to forward the port.

    config.vm.network "forwarded_port", guest: 3000, host: 3000

It is a good policy not to hardcode this port on your apps, but to use the corresponding env var if defined

    listen(process.env.PORT || 3000);


### Synced folders
No additional synced folders have been configured


## Vagrant provisioning
### File
The host "~/.gitconfig" file is copied to the vagrant box, to carry global preferences and configuration.

### Shell
The following software is installed via shell provisioning. 
* Node (https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)
* Git
* Grunt
* Mongodb (https://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/)


    # auto remove, not really necessary, just to clean
    sudo apt-get autoremove -y
    # node and npm
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
    sudo apt-get install -y nodejs
    # Build essentials, for some node modules that need to be compiled
    sudo apt-get install -y build-essential
    # git
    sudo apt-get install -y git
    # grunt
    sudo npm install -g grunt-cli
    # MongoDb
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
    echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
    sudo apt-get update
    sudo apt-get install -y mongodb-org

Please take on account mongo installation should be secured to be used on a production environment.





