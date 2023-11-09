ARG base=debian:bookworm
From ${base}
ARG base

ARG ver_node=18

RUN apt update; apt install -y git make curl gnupg2 bash-completion screen vim
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | apt-key add - ;\
    echo "deb https://deb.nodesource.com/node_${ver_node}.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list; \
    apt update

RUN apt install -y nodejs build-essential
RUN npm install -g npm; \
    npm install n8n -g

EXPOSE 5678
CMD n8n start
