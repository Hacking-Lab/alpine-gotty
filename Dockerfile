FROM hackinglab/alpine-base:3.2
MAINTAINER Ivan Buetler <ivan.buetler@compass-security.com>

ENV LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    TERM="xterm"

RUN apk -U upgrade && \
    apk --update add \
      bash \
      sudo \
      curl \
      fping \
      go git \
      htop \
      iftop iotop \
      jq \
      nmap \
      rsync \
      screen \
      wget \
      tar tmux tree \
      vim \
      xz \
      zsh \
      && \
    GOPATH=/tmp/gotty go get github.com/yudai/gotty && \
    mv /tmp/gotty/bin/gotty /usr/local/bin/ && \
    apk del go musl-dev && \
    echo 'set-option -g default-shell /bin/zsh' >> /root/.tmux.conf && \
    rm -rf /tmp/gotty /var/cache/apk/* /tmp/src

ADD root /

EXPOSE 8080


