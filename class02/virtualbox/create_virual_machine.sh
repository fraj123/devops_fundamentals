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
echo -e "\nDISK SIZE[MB]:"
read DISK
echo ""

vboxmanage createvm --name $NAME --ostype Ubuntu_64 --register --basefolder C:\Jala\Devops\vm --default
vboxmanage modifyvm $NAME --ioapic on
vboxmanage modifyvm $NAME --memory $MEMORY --cpus $CPU
vboxmanage modifyvm $NAME --nic1 nat
vboxmanage createhd --size $DISK --filename C:\Jala\Devops\vm\$NAME\disks\$NAME_disk
vboxmanage storageattach $NAME --storagectl "SATA" --device 0 --port 0 --type hdd --medium C:\Jala\Devops\vm\$NAME\disks\$NAME_disk.vdi
