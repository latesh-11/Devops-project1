#!/bin/bash

#######AUTHOR=Latesh sharma
#######VERSION=v1

#########################################
#############JINKINS INSTALL#############
#########################################

red="\033[0;31m"
green="\033[0;32m"
white="\033[0;37m"


#............Functions..............#

function InstallPackage() {
    local PackageName=${1}
    if apt-get install -y ${PackageName}
    then 
        echo -e "${green} ${PackageName} sucessfully installed ${white}"
    else
        echo -e "${red} E: ${PackageName} not install ${white}"
        exit 1
    fi
}

function update() {

if ! apt-get update
then
    echo -e "${red} E: update unsucessful ${white}"
    exit 1
fi
}


if [[ $UID != 0 ]]
then
    echo -e "${red} E: user not a root user ${white}"
    exit
fi

#===============INSTALL JAVA================#
update
InstallPackage openjdk-11-jre

#===============INSTALL JENKINS==============#

curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

update
InstallPackage jenkins
