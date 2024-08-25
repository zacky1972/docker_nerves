FROM --platform=linux/x86_64 elixir:1.17.2-otp-27

ENV DEBIAN_FRONTEND noninteractive

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    build-essential automake autoconf git squashfs-tools ssh-askpass \
    pkg-config curl libmnl-dev && \
  curl -OL https://github.com/fwup-home/fwup/releases/download/v1.10.2/fwup_1.10.2_amd64.deb && \
  apt install -y ./fwup_1.10.2_amd64.deb && \  
  apt-get install -y libssl-dev libncurses5-dev bc m4 unzip cmake python3 && \
  apt-get autoclean && \
  apt-get autoremove && \
  apt-get -y clean && \
  rm -rf /var/lib/apt/lists/* 

RUN \
  mix local.hex --force && \
  mix local.rebar --force && \
  mix archive.install hex nerves_bootstrap --force

