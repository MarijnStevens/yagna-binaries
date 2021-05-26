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
Give the executing user KVM permissions:

```sudo adduser $(whoami) kvm```

```sudo chown $(whoami) /dev/kvm```

then ```./golemsp run``` to setup your node

# DIY 

You can find the repositories [yagna](https://github.com/MarijnStevens/yagna), [ya-runtime-vm](https://github.com/MarijnStevens/ya-runtime-vm), [ya-runtime-wasi](https://github.com/MarijnStevens/ya-runtime-wasi). They all have build.sh scripts, but you need to have rust support, cross compatible dependencies for aarch64 and docker to build vmrt-x86_64
