# Yagna-binaries for aarch64

[![Youtube Demo](https://img.youtube.com/vi/dX8eNFw-WZ0/0.jpg)](https://www.youtube.com/watch?v=dX8eNFw-WZ0)

Hackathon entry for both @MarijnStevens and @ControlCplusControlV as an entry for the Golem Network Bounty in the 0xHackathon May 2021.

This build is for 64 bit arm architecture, also known as aarch64. This has been tested on both the Raspberry Pi 3 and 4. The Goal of this project was to provide a build of Golem for 64 bit arm as it becomes increasingly more common, especially after adoption from big companies like Apple and Nvidia.

**Setup guide**
1. Install base image from [here](https://ubuntu.com/download/raspberry-pi), make sure its version 21.04 64-Bit, this is needed as the LTS version lacks newer libraries needed to run the runtime.

2. Run ```sudo apt update && sudo apt upgrade```to get your packages up to date
3. Then install a needed dependency via 
 ```sudo apt-get install libpixman-1-0```
4. Then clone this repo via
```git clone https://github.com/MarijnStevens/yagna-binaries.git```
5. Go into the yagna-binaries folder and run the following 
```Bash 
$ chmod +x ./install.sh
$ ./install.sh 
```
6. Lastly, give the executing user KVM permissions:
```sudo adduser $(whoami) kvm```
7. Reboot / Relogin

8. Then run ```./golemsp run``` like normal to setup your node

9. Once configured, restart with ```nohup golemsp run > yagna.log &``` to keep the process running when you disconnect the terminal. 

## Uninstall yagna-binaries
Remove it with ```$ chmod +x ./uninstall.sh```

## Compile from Sources 

You can find the repositories [yagna](https://github.com/MarijnStevens/yagna), [ya-runtime-vm](https://github.com/MarijnStevens/ya-runtime-vm), [ya-runtime-wasi](https://github.com/MarijnStevens/ya-runtime-wasi). They all have `./build.sh` scripts, but you need to have rust support, cross compatible dependencies for aarch64 and docker to build vmrt-x86_64. You can find the instructions to build the runtime in ya-runtime-vm/qemu-aarch64. 
