#Download base image ubuntu 16.04
FROM ubuntu:16.04

RUN mkdir /opt/sightmachine && useradd -ms /bin/bash sm && chown sm:sm /opt/sightmachine
WORKDIR /opt/sightmachine

# Update Ubuntu Software repository
RUN apt-get update

# Run Apt installs
RUN apt install python -y
RUN apt install htop -y
RUN apt install python-pip -y
RUN apt install git -y
RUN apt-get install zsh -y
RUN apt install python-pip -y
RUN apt install curl -y
RUN apt install python-dev -y
RUN apt install libpq-dev -y

# Run pip installs
RUN pip install IPython==5.0
RUN pip install jupyter
RUN curl -fsSL https://gist.githubusercontent.com/yetijoe/b32926b116e7f5888b2519cc6d3bad92/raw/34b3e3682da67ecb92852132154203413a01671a/requirements.txt | \
  xargs pip install

VOLUME ["/var/notebook", "/data", "/vm"]

EXPOSE 8889

WORKDIR /var/notebook

ENTRYPOINT [ "/usr/local/bin/jupyter", "notebook", "--ip", "0.0.0.0", "--port", "8889", "--allow-root" ]
