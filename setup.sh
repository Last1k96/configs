#!/bin/bash

# config dir
export CONFIG_DIR=$HOME/.config
export PROGRAMS_DIR=$HOME/programs

echo "#!/bin/sh\n\nsource \"$CONFIG_DIR/.config/zsh/.zshrc\"" > $HOME/.zshrc

[[ ! -d $PROGRAMS_DIR/powerlevel10k ]] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $PROGRAMS_DIR/powerlevel10k

mkdir -p $CONFIG_DIR
cp -r ./zsh $CONFIG_DIR
cp -r ./p10k $CONFIG_DIR
