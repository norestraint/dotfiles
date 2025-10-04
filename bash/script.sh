#!/bin/bash


if ! command -v nala &> /dev/null
then
    echo "Installing it nala"
    apt install -y nala
fi

if ! command -v git &> /dev/null
then
    echo "Installing it git."
    nala install -y git
fi

if ! command -v curl &> /dev/null
then
    echo "Installing it curl."
    sudo nala install -y curl
fi

if ! command -v gcc &> /dev/null
then
    echo "Installing it gcc."
    sudo nala install -y build-essential
fi

if ! command -v kitty &> /dev/null
then
    echo "Installing it kitty."
    sudo nala install -y kitty
fi

cd $HOME
mkdir -p packages

if ! command -v nvim &> /dev/null; then
    cd packages
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    ./nvim.appimage --appimage-extract
    sudo mv squashfs-root /
    sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
    cd $HOME
fi

if [ ! -d dotfiles ]; then
    cd $HOME
    git clone https://github.com/norestraint/dotfiles.git
    ln -s $HOME/dotfiles/* $HOME/.config/
    cp dotfiles/fonts/Terminess/* /usr/local/share/fonts/ && fc-cache -fv
    cp dotfiles/fonts/3270/* /usr/local/share/fonts/ && fc-cache -fv
fi

if ! command -v starship &> /dev/null; then
    echo "Starship prompt not found, installing it..."
    curl -sS https://starship.rs/install.sh | sh
    echo "eval \"$(starship init bash)\"" >> $HOME/.bashrc
fi

if ! command -v brave-browser &> /dev/null; then
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo nala update
    sudo nala install -y brave-browser
fi

#if ! command -v nvm &> /dev/null; then
#    echo "NVM not found, installing it..."
#    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
#fi

if ! command -v fzf &> /dev/null; then
    sudo nala update
    sudo nala install -y fzf
fi

if ! command -v lazygit &> /dev/null; then
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
fi

if ! command -v watchmen &> /dev/null; then
    echo "Follow the guide at https://facebook.github.io/watchman/docs/install#buildinstall to install Watchmen"
fi

if ! command -v cargo &> /dev/null; then
    echo "Cargo not found, installing it..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
