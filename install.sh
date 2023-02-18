echo "Installing packages"

sudo pacman -Syu

sudo pacman -S gvim \
               tmux \
               mutt \
               i3-wm \
               i3blocks \
               i3status \
               i3lock \
               xss-lock \
               feh \
               variety \
               xss-lock \
               feh \
               variety \
               playerctl \
               dmenu \
               gnome-terminal \
               pamixer \
               nvtop \
               redshift \
               zsh

yay -S spideroak-one

echo "Install oh my zsh"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing vundle"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Copy/link config files"

mkdir ~/.config/i3
mkdir ~/.config/i3status
mkdir  ~/.config/i3blocks

ln -sf ~/projects/personal/dotfiles/i3config ~/.config/i3/config
ln -sf ~/projects/personal/dotfiles/i3lock.sh ~/.config/i3/i3lock.sh
ln -sf ~/projects/personal/dotfiles/i3blocksconfig ~/.config/i3blocks/config
ln -sf ~/projects/personal/dotfiles/i3blocks-scripts ~/.config/i3blocks/scripts
ln -sf ~/projects/personal/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/projects/personal/dotfiles/tmux.conf.local ~/.tmux.conf.local
ln -sf ~/projects/personal/dotfiles/vimrc ~/.vimrc
ln -sf ~/projects/personal/dotfiles ~/

cp -f ~/projects/personal/dotfiles/zshrc ~/.zshrc
cp -rf ~/projects/personal/dotfiles/screenlayouts ~/.screenlayouts
