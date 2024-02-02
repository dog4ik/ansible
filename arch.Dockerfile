FROM archlinux:latest
RUN echo 'root:pass' | chpasswd
RUN useradd -ms /bin/bash dog4ik
RUN echo 'dog4ik:pass' | chpasswd
RUN pacman --noconfirm -Syu && pacman --noconfirm -S sudo
WORKDIR /usr/local/bin
RUN pacman --noconfirm -S curl git ansible
RUN echo "dog4ik ALL=(ALL) ALL" >> /etc/sudoers.d/00_dog4ik
COPY . .
USER dog4ik
CMD ["/bin/bash"]
