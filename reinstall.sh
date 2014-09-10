#!/bin/bash
# this file is used after reinstall the operation system.
# update & upgrade ----------
sudo apt-get update
sudo apt-get upgrade

# add custom sources and PPA's ----------
sudo add-apt-repository -y ppa:gnome3-team/gnome3
## R
sudo add-apt-repository -y "deb http://cran.rstudio.com/bin/linux/ubuntu `lsb_release -cs`/"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
## Lyx
sudo add-apt-repository -y ppa:lyx-devel/release
## Zotero
sudo add-apt-repository ppa:smathot/cogscinl
## Dropbox : it can be installed from the software center
## system load indicator
sudo add-apt-repository ppa:indicator-multiload/stable-daily
## key lock indicator
sudo add-apt-repository ppa:tsbarnes/indicator-keylock




# update again ----------
sudo apt-get update

# download .deb files
cd ~/Downloads
## google chrome
wget -q wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
## rstudio
echo http://download1.rstudio.org/ > tt
	## get the latest version number, for 64 bit systems.
curl http://www.rstudio.com/products/rstudio/download/ | grep -o 'rstudio-.*amd64\.deb' > ttt
paste -d "" tt ttt | xargs wget -q
rm tt ttt
cd ~

# install programs
## when install R curl pkg, we need the following things
sudo apt-get -y install r-base-dev gnupg-curl libcurl3-gnutls libcurl4-gnutls-dev libgmp3-dev 
sudo apt-get -y install lyx zotero-standalone nautilus-dropbox synaptic flashplugin-installer
sudo apt-get -y install indicator-multiload indicator-keylock

# install deb files from directory ---------------
sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb
sudo dpkg -i ~/Downloads/rstudio-*-amd64.deb

# add open in terminal option when right click
sudo apt-get install nautilus-open-terminal
nautilus -q && nautilus &

# at the end -----------
# sudo chown root:root reinstall.sh (change owner of the script)
# sudo chmod a+x reinstall.sh (change permision)
# ./reinstall.sh (run the script)
