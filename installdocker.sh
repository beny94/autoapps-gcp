#!/bin/bash

USER=beny.putra

OS=$(grep -Po "(?<=^ID=).+" /etc/os-release | sed 's/"//g')

echo "Ready to automation" \
    && echo "====================" && sleep 2 \
    && apt update -y \
    && apt upgrade \
    && echo "update and upgrade done" && sleep 2 \
    && apt install -y curl wget vim apt-transport-https ca-certificates software-properties-common uidmap bash-completion gnupg \
    && echo -ne '\n' | curl -fsSL https://download.docker.com/linux/${OS,}/gpg | apt-key add - \
    && add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/${OS,} \
       $(lsb_release -cs) \
       stable" \
    && echo "OK that works" && sleep 2 \
    && apt update && apt install -y docker-ce \
    && systemctl enable docker \
    && systemctl start docker \
    && curl -L "https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    && wget https://get.docker.com/rootless \
    && chmod +x rootless \
    && sysctl -w kernel.unprivileged_userns_clone=1 \
    && chown $USER:$USER ./rootless
    && su -c './rootless' $USER \
    && loginctl enable-linger $USER \
    && gpasswd -a $USER docker \
    && service docker restart \
    && echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && echo -ne '\n' | curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg \
    && export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s` \
    && echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list \
    && echo -ne '\n' | curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - \
    && sudo apt-get update && sudo apt-get install google-cloud-sdk gcsfuse \
    && rm -f /home/beny.putra/.bashrc \
    && cp bashrc /home/beny.putra/.bashrc \
    && echo "done for everything" \
    && sleep 4 \
    && exit 0
