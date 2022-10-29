#!/bin/bash

# exit when any command fails
set -e

sudo apt update
sudo apt install zsh git fonts-font-awesome

# config dir
export CONFIG_DIR=$HOME/.config
export PROGRAMS_DIR=$HOME/programs

echo -e "#!/bin/sh\n\nsource \"$CONFIG_DIR/zsh/.zshrc\"" > $HOME/.zshrc

mkdir -p $PROGRAMS_DIR
[[ ! -d $PROGRAMS_DIR/powerlevel10k ]] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $PROGRAMS_DIR/powerlevel10k

mkdir -p $CONFIG_DIR
cp -r ./zsh $CONFIG_DIR
cp -r ./p10k $CONFIG_DIR

echo "Changing default shell to zsh..."
chsh -s $(which zsh)

echo "Please reboot the PC"
