# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# antigen
curl -L git.io/antigen > ~/.antigen.zsh

# stuff 
brew install zsh tmux 

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# pip stuff
sudo pip install -r requirements.txt

# tmux
cd
git clone https://github.com/gpakosz/.tmux.git.
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
