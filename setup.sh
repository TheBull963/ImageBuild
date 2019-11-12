#!/usr/bin/env bash

# Change shell to Zsh
chsh -s $(which zsh) $(whoami)

#Install oh my zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# Copy config files into home directory
cp .zshrc ~/.zshrc
cp .tmux.conf ~/.tmux.conf
source ~/.zshrc

# Upgrade OS with non-interactive apt
sudo apt update
sudo apt remove apt-listchanges -y
DEBIAN_FRONTEND=noninteractive sudo apt upgrade -y

# Install packages
sudo apt install -y tmux htop vim zsh

# Change shell to Zsh
chsh -s $(which zsh) $(whoami)

# Setup Tmux plugin manager from scratch (comes with tmux sensible plugin)
rm -rf ~/.tmux/plugins/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Setup zsh theme PowerLevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Reminder to refresh env and reboot
echo "Press prefix+R to ensure tmux plugins are downloaded and then reboot to ensure all changes are applied."
