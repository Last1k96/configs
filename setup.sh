#!/bin/bash

# exit when any command fails
set -e

echo "Install all essential libraries"
sudo apt update && sudo apt upgrade -y
sudo apt install zsh git fonts-font-awesome
sudo apt install -y build-essential libssl-dev checkinstall zlib1g-dev ninja-build gdb cmake-curses-gui linux-tools-common cppcheck clang-format clang-tidy ccache pipx tar curl zip unzip mc git python3-pip

echo "Configs:"
export CONFIG_DIR=$HOME/.config
export PROGRAMS_DIR=$HOME/programs
export EMAIL="kurinmaksim42@gmail.com"
export NAME="Maxim Kurin"

echo "CONFIG_DIR=$CONFIG_DIR"
echo "PROGRAMS_DIR=$PROGRAMS_DIR"

echo "Setup git"
git config --global user.name $NAME
git config --global user.email $EMAIL
git config --global alias.ch checkout
git config --global alias.br branch
git config --global alias.st status

echo "Set default .zshrc to source from config directory"
echo -e "#!/bin/sh\n\nsource \"$CONFIG_DIR/zsh/.zshrc\"" > $HOME/.zshrc

echo "Clone powerlevel10k to the programs directory"
mkdir -p $PROGRAMS_DIR
[[ ! -d $PROGRAMS_DIR/powerlevel10k ]] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $PROGRAMS_DIR/powerlevel10k

echo "Copy configs"
mkdir -p $CONFIG_DIR
cp -r ./zsh $CONFIG_DIR
cp -r ./p10k $CONFIG_DIR

echo "Changing default shell to zsh..."
chsh -s $(which zsh)

echo "Generate ssh key"
ssh-keygen -t ed25519 -C $EMAIL
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo "ssh public key:"
cat ~/.ssh/id_ed25519.pub

# install MesloLGS NF
# https://github.com/romkatv/powerlevel10k#fonts

echo "Please reboot the PC"
