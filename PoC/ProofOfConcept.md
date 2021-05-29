# Proof of Concept for Golem on arm
This outlines the Proof of Concept for Golem on arm, a 0xHackathon Project led by @MarijnStevens and @ControlCplusControlV

## Methodology
1. Two Nodes were setup using the steps outlined in the README, the first node was [demonic-care-aarch64-host](https://golemstats.com/node/0xfc1bd14392e90b1b8dba0ff58a573ea222f406a1 "demonic-care-aarch64-host") which is a Raspberry Pi 4. The 2nd Node that was setup was a Raspberry Pi 3B+ [Pineapple](https://golemstats.com/node/0xb55013851474b24f6f9d8fefa4a75078b6754b6c). During the short duration they were running on both the dev subnet and mainnet they were each able to complete golem tasks assigned by others in the ecosystem. However, to ensure accurate testing they were then moved to a new subnet
2. These nodes were then connected to a new subnet `aarch64-network` to isolate them for further testing. The command to connect to this network is `nohup golemsp run --payment-network rinkeby --subnet aarch64-network > yagna.log &`
3. Once connected, an x86_64 requestor was connected to the network to run the Proof of Concept on this subnet. The task being sent out was a the [Hello World](https://handbook.golem.network/requestor-tutorials/hello-world) from the Golem Handbook.
4. The x86_64 Requestor, which was called "PalmTree" executed the hashcracker on the subnet via `python3 requestor.py --subnet aarch64-network`
5. Task was negotiated and sent to `Pineapple`, which responded with the correct result of `decentralizationist` paying Pineapple a small fee for its work


<img src='images/Pineapple.png'>
