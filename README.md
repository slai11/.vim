## Vimrc files

Set up vim plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Linking code
```
cd ~/
ln -sf $HOME/.vim/vimrc $HOME/.vimrc
```

Perform `:PlugInstall` on vim terminal
