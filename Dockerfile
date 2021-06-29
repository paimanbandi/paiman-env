FROM ubuntu:focal-20210609

LABEL maintainer="hub@paiman.id"

ARG DEBIAN_FRONTEND=noninteractive
ENV HOME /root
ENV ZSH_CUSTOM $HOME/.oh-my-zsh/custom/

WORKDIR $HOME

RUN apt-get update -y

RUN apt-get install -y \
	curl \
	wget \
	zsh \
	git \
	openssh-client \
	neovim \
	fzf \
	ripgrep \
	nodejs \
	npm

RUN npm install -g nodemon typescript typescript-formatter

#docker
RUN apt install -y apt-transport-https ca-certificates gnupg-agent software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN apt update -y
RUN apt install -y docker-ce docker-ce-cli containerd.io

#neovim
RUN mkdir $HOME/.config/coc

COPY init.vim $HOME/.config/nvim/init.vim

RUN curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN nvim +PlugInstall +qall
RUN nvim +'CocInstall -sync coc-tsserver coc-json' +qall

#zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
RUN git clone https://github.com/zsh-users/zsh-autosuggestions \
	${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
	${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
RUN curl -fLo $HOME/.oh-my-zsh/themes/lambda-mod.zsh-theme --create-dirs \
	https://raw.githubusercontent.com/halfo/lambda-mod-zsh-theme/master/lambda-mod.zsh-theme

COPY zshrc $HOME/.zshrc

WORKDIR /docker

CMD ["zsh"]

