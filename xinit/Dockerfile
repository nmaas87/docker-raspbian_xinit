FROM nmaas87/docker-raspbian_qemu:jessie-20161202
MAINTAINER Nico Maas <mail@nico-maas.de>
ENV DEBIAN_FRONTEND noninteractive
RUN [ "cross-build-start" ]
# Install basic system with gui
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
        alsa-utils \
        xinput-calibrator \
        autoconf \
        build-essential \
        git \
        openssh-server \
        xserver-xorg-core \
        xorg \
        libgtk2.0-0 \
        libnotify4 \
        libgconf2-4 \
        libnss3 \
        libasound2 \
        matchbox \
        sudo \
        locales \
        whois \
        gedit \   
    && apt-get autoremove -qqy \
    && apt-get autoclean -y \
    && apt-get clean && rm -rf /var/lib/apt/lists/* && mkdir /var/lib/apt/lists/partial \
    && mkdir /var/run/sshd \
    && echo 'root:resin' | chpasswd \
    && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# Gen Locales
RUN touch /usr/share/locale/locale.alias \
  && sed -i "s/^#\ \+\(de_DE.UTF-8\)/\1/" /etc/locale.gen \
  && locale-gen de_DE de_DE.UTF-8
ENV LANG=de_DE.UTF-8 \
  LC_ALL=de_DE.UTF-8 \
  LANGUAGE=de_DE:de
# Add User pi
RUN useradd \
  --groups=sudo \
  --create-home \
  --home-dir=/home/pi \
  --shell=/bin/bash \
  --password=$(mkpasswd pi) \
  pi \
  && sed -i '/%sudo[[:space:]]/ s/ALL[[:space:]]*$/NOPASSWD:ALL/' /etc/sudoers
#ENTRYPOINT ["/usr/bin/tail", "-f", "/etc/hosts"]

RUN mkdir -p /usr/src/app && ln -s /usr/src/app /app
WORKDIR /usr/src/app
COPY src /usr/src/app
#RUN cd /usr/src/app && grunt build

ENV INITSYSTEM on

COPY src/start.sh /start.sh

CMD ["bash", "/start.sh"]


RUN [ "cross-build-end" ]  