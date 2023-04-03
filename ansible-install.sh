#!/bin/bash

######Author = Latesh shrama
######Version = v1

#########################################
##############ANSIBLE INSTALL############
#########################################

red="\033[0;31m"
white="\033[0;37m"
green="\033[0;32m"

#==================Functions==============#

function InstallPackage() {
    PackageName=${1}
    if apt install -y ${PackageName}
    then 
        echo -e "${green} ${PackageName} installed sucessfully ${white}"
    else 
        echo -e "${red} ${PackageName} not installed ${white}"
        exit 1
    fi
}

if [[ ! $UID = 0 ]]
then 
    echo -e "${red} E: user not the root user ${white}"
fi

if ! apt update
then 
    echo "update not completed sucessfully"
    exit 1
fi

InstallPackage software-properties-common

add-apt-repository --yes --update ppa:ansible/ansible

InstallPackage ansible

