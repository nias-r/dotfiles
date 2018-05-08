# antigen
curl -L git.io/antigen > ~/.antigen.zsh

# Vundle
git clone git@github.com:/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# tmux
cd
git clone git@github.com:gpakosz/.tmux.git 
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
