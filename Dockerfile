FROM elixir:1.9.4-slim

RUN apt-get update -yq

RUN apt-get install -yq curl gnupg inotify-tools

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install -yq nodejs
RUN npm install --global yarn

RUN mix local.hex --force && mix local.rebar --force
RUN mix archive.install hex phx_new 1.4.11 --force

WORKDIR /home/app

COPY . .

RUN mix do deps.get, deps.compile

RUN yarn install
