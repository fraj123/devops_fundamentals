#!/bin/bash

# NAME=$1

# if [[ $# -eq 0 ]] ; then
#     echo "Must provide name of virtual machine"
#     exit 0
# fi

# echo -e "\nCreating Virtual Machine: $NAME"

# echo -e "\nPlease input virtual machine specs (Just numbers)."
# echo -e "\nRAM MEMORY[MB]:"
# read MEMORY
# echo -e "\nCPUs Number:"
# read CPU
# echo ""

# Commands to run on Windows from D:\Oracle\VirtualBox

SET PATH=%PATH%;D:\Oracle\VirtualBox
vboxmanage createvm --name testingVM --ostype Ubuntu_64 --register --basefolder D:\JS\DevOps\class02\class02\virtualbox --default
vboxmanage modifyvm testingVM --ioapic on
vboxmanage modifyvm testingVM --memory 1024
vboxmanage modifyvm testingVM --cpus 1
vboxmanage modifyvm testingVM --nic1 nat
vboxmanage modifyvm testingVM --vram 12
vboxmanage createhd --size 10000 --filename D:\JS\DevOps\class02\class02\virtualbox\disks\disk_01
vboxmanage storageattach testingVM --storagectl "SATA" --device 0 --port 0 --type hdd --medium D:\JS\DevOps\class02\class02\virtualbox\disks\disk_01.vdi

# To do, create storage and attach it


