FROM debian:latest

SHELL ["/bin/bash", "-cl"]

RUN apt-get update
RUN apt-get install --yes build-essential inotify-tools curl unzip git bsdmainutils

RUN git clone https://github.com/asdf-vm/asdf.git /opt/asdf --branch v0.7.6
RUN echo -e '\nsource /opt/asdf/asdf.sh' >> ~/.bashrc
RUN echo -e '\nsource /opt/asdf/completions/asdf.bash' >> ~/.bashrc
RUN source ~/.bashrc


RUN asdf plugin-add nodejs
RUN bash /opt/asdf/plugins/nodejs/bin/import-release-team-keyring
RUN asdf plugin-add yarn

RUN apt-get install --yes procps autoconf m4 libncurses5-dev libwxgtk3.0-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop
RUN asdf plugin-add erlang

RUN asdf plugin-add elixir

#RUN ["/bin/bash", "-c", "source ~/.bashrc"]
#RUN ["/bin/bash", "-c", "asdf install"]

WORKDIR /app

COPY .tool-versions .

RUN ls -la
RUN asdf install
