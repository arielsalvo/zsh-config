FROM ubuntu:latest

ARG USERNAME=zshtester
ARG USERPASS=Pass1234

ARG LOCALE_INPUT=en_US
ARG LOCALE_CHARMAP=UTF-8

ARG TZ=America/Argentina/Buenos_Aires

RUN apt update \
  && DEBIAN_FRONTEND="noninteractive" apt upgrade -y \
  && ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime \
  && DEBIAN_FRONTEND="noninteractive" apt install -y \
    autoconf \
    automake \
    bsdextrautils \
    curl \
    file \
    gcc \
    git \
    locales \
    make \
    sudo \
    tree \
    tzdata \
    unzip \
    vim \
    zsh \
  && rm -rf /var/lib/apt/lists/* \
  && dpkg-reconfigure --frontend noninteractive tzdata \
	&& localedef -i ${LOCALE_INPUT} -c -f ${LOCALE_CHARMAP} -A /usr/share/locale/locale.alias ${LOCALE_INPUT}.${LOCALE_CHARMAP}

ADD ./files/docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh \
  && useradd --shell /usr/bin/zsh -c "ZSH testing user" -m -U -G sudo -p $(openssl passwd -6 -salt xyz ${USERPASS}) ${USERNAME} \
  && mkdir -p /home/${USERNAME}/.config/zsh \
  && chown -R ${USERNAME} /home/${USERNAME}/.config

USER ${USERNAME}
WORKDIR /home/${USERNAME}

VOLUME [ \
          "/home/${USERNAME}/.config/zsh/.zshenv", \
          "/home/${USERNAME}/.config/zsh/.zshrc", \
          "/home/${USERNAME}/.config/zsh/zshrc.d", \
          "/home/${USERNAME}/.config/zsh/files.d", \
          "/home/${USERNAME}/.config/zsh/functions.d", \
          "/home/${USERNAME}/.config/zsh/aliases.d", \
]

RUN ln -s .config/zsh/.zshenv .zshenv

ENTRYPOINT ["bash", "/docker-entrypoint.sh"]
