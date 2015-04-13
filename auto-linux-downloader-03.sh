#/bin/bash

#This version of the script overwrites itself - only keeping the newest torrent files

torrent_location=/home/petes/public_html

#Raspian
wget http://downloads.raspberrypi.org/raspbian_latest.torrent -O $torrent_location/raspbian.torrent


#Arch Netinst Dual
file=`curl -l ftp://mirror.rackspace.com/archlinux/iso/latest/ | grep torrent` 
file=ftp://mirror.rackspace.com/archlinux/iso/latest/$file
wget $file -O $torrent_location/arch.torrent


#Ubuntu Latest
ubuntu=ftp://releases.ubuntu.com/releases/
release=`curl -l $ubuntu | sort -n -r | awk NR==1`
count=`curl -l $ubuntu/$release/ | grep .torrent | wc -l`
        x=1
    while [  $x -le $count ]; do
                version=`curl -l $ubuntu/$release/ | grep .torrent | awk NR==$x`
                wget $ubuntu/$release/$version -O $torrent_location/ubuntu$x.torrent
                let x=x+1
    done


#Debian DVD amd64 Latest
debian=ftp://cdimage.debian.org/cdimage/release/current/amd64/bt-dvd/
count=`curl -l $debian | grep .torrent | wc -l`
        x=1
    while [  $x -le $count ]; do
                version=`curl -l $debian | grep .torrent | awk NR==$x`
                wget $debian/$version -O $torrent_location/debian64-$x.torrent
                let x=x+1
    done


#Debian DVD i386 Latest
debian=ftp://cdimage.debian.org/cdimage/release/current/i386/bt-dvd/
count=`curl -l $debian | grep .torrent | wc -l`
        x=1
    while [  $x -le $count ]; do
                version=`curl -l $debian | grep .torrent | awk NR==$x`
                wget $debian/$version -O $torrent_location/debian-$x.torrent
                let x=x+1
    done



#OpenSUSE  Latest
suse=ftp://www.gtlib.gatech.edu/pub/opensuse/distribution/openSUSE-stable/iso/
count=`curl -l $suse | grep .torrent | wc -l`
        x=1
    while [  $x -le $count ]; do
                version=`curl -l $suse | grep .torrent | awk NR==$x`
                wget $suse/$version -O $torrent_location/suse$x.torrent
                let x=x+1
    done


#Centos Latest
centos=ftp://mirror.rackspace.com/CentOS/
release=`curl -l $centos | sort -n -r | awk NR==1`
count=`curl -l $centos/$release/isos/x86_64/ | grep .torrent | wc -l`
        x=1
    while [  $x -le $count ]; do
                version=`curl -l $centos/$release/isos/x86_64/ | grep .torrent | awk NR==$x`
                wget $centos/$release/isos/x86_64/$version -O $torrent_location/centos-$x.torrent
                let x=x+1
    done

