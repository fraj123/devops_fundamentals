#!/bin/bash

NAME=$1

if [[ $# -eq 0 ]] ; then
    echo "Must provide name of virtual machine"
    exit 0
fi

echo -e "\nCreating Virtual Machine: $NAME"

echo -e "\nPlease input virtual machine specs (Just numbers)."
echo -e "\nRAM MEMORY[MB]:"
read MEMORY
echo -e "\nCPUs Number:"
read CPU
echo ""

vboxmanage createvm --name $NAME --ostype Ubuntu_64 --register --basefolder '/Volumes/Storage - Data/Luis/Documents/devops_fundamentals/class02/virtualbox/'
vboxmanage modifyvm $NAME --ioapic on
vboxmanage modifyvm $NAME --memory $MEMORY --cpus $CPU
vboxmanage modifyvm $NAME --nic1 nat

# To do, create storage and attach it
VBoxManage createhd --filename "/Volumes/Storage - Data/Luis/Documents/devops_fundamentals/class02/virtualbox/$NAME/$NAME_DISK.vdi" --size 8000 --format VDI        
VBoxManage storagectl $NAME --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach $NAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium  "/Volumes/Storage - Data/Luis/Documents/devops_fundamentals/class02/virtualbox/$NAME/$NAME_DISK.vdi"


