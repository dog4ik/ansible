FROM ubuntu:latest
RUN echo 'root:pass' | chpasswd
RUN useradd -ms /bin/bash dog4ik
RUN echo 'dog4ik:pass' | chpasswd
RUN usermod -aG sudo dog4ik
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y software-properties-common sudo && apt-add-repository -y ppa:ansible/ansible && apt update && apt install -y curl git ansible build-essential
COPY . .
USER dog4ik
CMD ["/bin/bash"]
