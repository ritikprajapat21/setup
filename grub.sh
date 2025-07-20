echo "Installing grub"
pacman -S grub efibootmgr dosfstools mtools

echo "Installing in boot partition"
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

echo "Generating grub config"
grub-mkconfig -o /boot/grub/grub.cfg
