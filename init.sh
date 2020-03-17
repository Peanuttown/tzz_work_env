#init ssh
#expect installOhMyZsh.expect
#tar go
tar -xf go1.14.2.linux-amd64.tar.gz
#use self zshrc
rm ~/.zshrc
link zshrc/.zshrc ~/.zshrc
