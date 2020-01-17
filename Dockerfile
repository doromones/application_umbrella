FROM elixir:1.9.4-slim

RUN apt-get update -yq

RUN apt-get install -yq curl gnupg inotify-tools

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install -yq nodejs
RUN npm install --global yarn

RUN mix local.hex --force && mix local.rebar --force
RUN mix archive.install hex phx_new 1.4.11 --force

WORKDIR /home/app

ADD mix.exs mix.lock ./
ADD apps/admin_web/mix.exs ./apps/admin_web/
ADD apps/api_web/mix.exs ./apps/api_web/
ADD apps/core/mix.exs ./apps/core/

RUN mix do deps.get, deps.compile

ADD apps/admin_web/assets/package.json \
    apps/admin_web/assets/yarn.lock \
    ./apps/admin_web/assets/
RUN yarn install
