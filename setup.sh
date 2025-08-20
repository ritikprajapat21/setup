#! /bin/bash
echo "Setting hyde config"
git clone https://github.com/HyDE-Project/HyDE.git ~/hyde --depth 1
cd ~/hyde/Scripts
bash ./install.sh
cd ~

sudo pacman -Syu ghostty neovim vlc zoxide tree lazygit

yay google-chrome-stable
yay brave-bin

# git config setup
echo "Enter your github email:"
read email
echo "Enter your name for github:"
read -r name

git config --global user.email $email
git config --global user.name $name

# Setting up Neovim
echo "Cloning nvim git repo"
git clone https://github.com/ritikprajapat21/NvChadConfig ~/.config/nvim
cd ~/.config/nvim
git checkout lazyvim
echo "Enter your github email:"
read email
echo "Enter your name for github:"
read -r name

git config --global user.email $email
git config --global user.name $name
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

# for zoxide
echo 'eval "$(zoxide init zsh)"
alias cd=z' >>$XDG_CONFIG_HOME/zsh/user.zsh
