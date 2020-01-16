FROM elixir:1.9.4

RUN apt-get update -yq

RUN apt-get install -yq curl gnupg

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install -yq nodejs
RUN npm install --global yarn
