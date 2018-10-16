# antigen
curl -L git.io/antigen > ~/.antigen.zsh

# Vundle
[[ -d ~/.vim/bundle/Vundle.vim ]] || git clone git@github.com:/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# tmux
[[ -d ~/.tmux ]] || git clone git@github.com:gpakosz/.tmux.git ~/.tmux
ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf

# link
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf.local ~/.tmux.conf.local
