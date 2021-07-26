#!/bin/sh

sudo mount /dev/vol/kiss /mnt
sudo cryptsetup open /dev/sda2 boot-crypt
sudo mount /dev/mapper/boot-crypt /mnt/boot
sudo mount /dev/sda1 /mnt/boot/efi
sudo mount /dev/vol/home /mnt/home

sudo mount /boot
sudo mount /boot/efi
