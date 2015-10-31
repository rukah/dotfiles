# dotfiles 自分用メモ

## clone
cd  
git clone https://github.com/rukah/dotfiles.git  

## 初期設定
mkdir swap    
mkdir vimbackup    
mkdir -p ~/dotfiles/.vim/bundle    
ln -sf ~/dotfiles/.vim ~/.vim    
ln -sf ~/dotfiles/.vimrc ~/.vimrc    
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile    

## NeoBundle install
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim  

## vim 起動してプラグイン更新

