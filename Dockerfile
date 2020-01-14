FROM debian:latest

RUN apt-get update
RUN apt-get install --yes build-essential inotify-tools git

RUN git clone https://github.com/asdf-vm/asdf.git /opt/asdf --branch v0.7.6

RUN echo -e '\n. /opt/asdf/asdf.sh' >> /etc/profile
RUN echo -e '\n. /opt/asdf/completions/asdf.bash' >> /etc/profile

RUN asdf-install-plugins
RUN asdf-install-versions
