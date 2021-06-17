FROM ubuntu:latest

LABEL maintainer="yo@paiman.id"

ARG DEBIAN_FRONTEND=noninteractive
ENV ZSH_CUSTOM /root/.oh-my-zsh/custom/

WORKDIR /root

RUN apt-get update -y
RUN apt-get install -y \
    curl \
    wget \
    zsh \
    git \
    neovim \
    fzf \
    ripgrep \
    nodejs \
    npm
RUN npm install -g npx
RUN npm install -g nodemon

RUN apt install -y apt-transport-https ca-certificates gnupg-agent software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN apt update -y
RUN apt install -y docker-ce docker-ce-cli containerd.io

COPY init.vim /root/.config/nvim/init.vim

RUN curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN nvim +PlugInstall +qall

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh 
RUN git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
RUN curl -fLo /root/.oh-my-zsh/themes/lambda-mod.zsh-theme --create-dirs \
    https://raw.githubusercontent.com/halfo/lambda-mod-zsh-theme/master/lambda-mod.zsh-theme

COPY zshrc /root/.zshrc

WORKDIR /docker

CMD ["zsh"]
