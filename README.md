# yagna-binaries



These builds are for testing only for aarch64 (running on a raspi4)

Testing guide -
Install base image from <link href = "https://ubuntu.com/download/raspberry-pi">here<link>, make sure its version 21.04 64-Bit
then install a needed dependency via 
 ```sudo apt-get install libpixman-1-dev```
then clone this repo via
```git clone https://github.com/MarijnStevens/yagna-binaries.git```
run both 
```sudo apt update```
then
```sudo apt upgrade```
lastly go into the yagna-binaries folder and run
```Bash 
$ chmod +x ./install.sh
$ chmod +x ./uninstall.sh

$ ./install.sh 
```
# KVM Permissions: 
```sudo adduser $(whoami) kvm```

```sudo chown $(whoami) /dev/kvm```

then ```./golemsp run``` to setup your node
