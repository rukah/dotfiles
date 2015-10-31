# dotfiles 自分用メモ

<p align="center">
    <img src="https://raw.githubusercontent.com/rukah/rakugaki/6f332cbaa06c762e9989024ec2e75e29b20fe27a/cirno1.png" alt="cirno">
</p>

## clone
    $ cd
    $ git clone https://github.com/rukah/dotfiles.git

## 初期設定
    $ mkdir ~/swap    
    $ mkdir ~/vimbackup    
    $ mkdir -p ~/dotfiles/.vim/bundle    
    $ ln -sf ~/dotfiles/.vim ~/.vim    
    $ ln -sf ~/dotfiles/.vimrc ~/.vimrc    
    $ ln -sf ~/dotfiles/.bash_profile ~/.bash_profile    

## NeoBundle install
    $ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim  

vim 起動してプラグイン更新    

## その他設定
### g c でgit commit
    $ git config --global alias.c 'commit -v'
