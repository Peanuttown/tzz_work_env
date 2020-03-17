from ubuntu:18.04
workdir /app
RUN apt-get update -y
RUN apt-get install git -y
RUN apt-get install wget -y
RUN git clone https://github.com/Peanuttown/nvimConfig.git
RUN wget https://github.com/neovim/neovim/releases/download/v0.4.3/nvim-linux64.tar.gz
RUN tar -xf nvim-linux64.tar.gz
RUN mv nvim-linux64 nvim
RUN export PATH=$PATH:~/app/nvim/bin
cmd ["sh"]
