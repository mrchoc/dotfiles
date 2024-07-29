sudo apt update
sudo apt install vim snapd zsh zsh-syntax-highlighting sway


sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/dracula/zsh.git
cd zsh && mv dracula.zsh-theme ~/.oh-my-zsh/themes && mv lib ~/.oh-my-zsh/themes

git clone -b linux https://github.com/mrchoc/dotfiles.git

cp -r ~/dotfiles/.config/* ~/.config
cp ~/dotfiles/.zshrc ~

source /etc/profile
sudo snap install alacritty

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/RobotoMono.zip \
&& cd ~/.local/share/fonts \
&& unzip RobotoMono.zip \
&& rm RobotoMono.zip \
&& fc-cache -fv

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
