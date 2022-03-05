#!/bin/bash

# this is a script that installs QEMU/KVM and everything else you will Need for a VM on Arch or An Arch Based Distro

# Installing everything needed

sudo pacman -S libvirt libvirt-glib libvirt-python virt-install virt-manager qemu qemu-arch-extra ovmf vde2 ebtables dnsmasq bridge-utils openbsd-netcat iptables swtpm

# starting LibVirt

sudo systemctl enable libvirtd.service

sudo systemctl start libvirtd.service

sudo enable virtlogd.socket

sudo start virtlogd.socket

# turning on the Network

sudo virsh net-start default

sudo virsh net-autostart default 

# Fixing Virsh

sudo cp -r libvirtd.conf /etc/libvirt/libvirt.conf
sudo cp -r libvirtd.conf ~/.config/libvirt/libvirt.conf

# end MSG

echo "A reboot is needed,type 'y' to reboot now and 'n' to reboot later"
read YN

if [ $YN = 'y' ]
  then
    reboot
  else
  echo "done, just reboot and your good to go!"
fi
