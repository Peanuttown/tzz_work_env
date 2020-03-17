from ubuntu:18.04
workdir /app
RUN export DEBIAN_FRONTEND=noninteractive
# set your timezone
RUN apt-get update -y && \
	apt-get install -y tzdata
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
	dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get install -y tar && \
	apt-get install git -y && \
	apt-get install curl -y && \
	apt-get install wget -y && \
	apt-get install expect -y && \
	git clone https://github.com/Peanuttown/nvimConfig.git && \
	mkdir ~/.config && \
	mv nvimConfig ~/.config/nvim && \
	wget https://github.com/neovim/neovim/releases/download/v0.4.3/nvim-linux64.tar.gz && \
	tar -xf nvim-linux64.tar.gz  && \
	mv nvim-linux64 nvim && \
	#zsh
	mkdir ~/.zsh && \
	apt install zsh -y && \
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions && \
	curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh && \
	mv install.sh installOhMyZsh.sh && \
	git clone https://github.com/Peanuttown/zshrc.git && \
	#fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
	~/.fzf/install && \
	#clang
	#apt-get install clang -y 
	#golang
	wget https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
	#tar -xf go1.14.2.linux-amd64.tar.gz && \
	#mv go1.14.2.linux-amd64.tar.gz go
RUN rm ~/.bashrc
COPY ./customeTzz.zsh ./customeTzz.zsh
COPY ./bashrc .
RUN mv bashrc ~/.bashrc && link customeTzz.zsh ~/.customeTzz.zsh
#node
COPY ./nodejs ./nodejs
#gopls
COPY ./gopls ./gopls
#customTzzBase
COPY ./.customeTzz.zsh  ~/
#RUN apt install clandg-9 -y
COPY ./installVimPlug.expect ./installOhMyZsh.expect ./
RUN expect installVimPlug.expect && expect installOhMyZsh.expect  
COPY ./init.sh .
CMD ["sh"]
