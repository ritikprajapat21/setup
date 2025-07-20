#! bin/bash
echo "Setting hyde config"
git clone https://github.com/HyDE-Project/HyDE.git ~/hyde
cd ~/hyde/Scripts
bash ./install.sh
cd ~

sudo pacman -Syu ghostty neovim vlc

yay google-chrome-stable
yay brave-bin

# Setting up Neovim
echo "Cloning nvim git repo"
git clone https://github.com/ritikprajapat21/NvChadConfig ~/.config/nvim
cd ~/.config/nvim
git checkout lazyvim
cd ~

# Setting ghostty
echo "Cloning ghostty repo"
git clone https://github.com/ritikprajapat21/ghostty-config ~/.config/ghostty
cd ~

# Github ssh setup
echo "Enter your email for ssh key generation:"
read email

ssh-keygen -t ed25519 -C $email

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

echo "Your ssh public key:"
cat ~/.ssh/id_ed25519.pub
