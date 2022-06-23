FROM ubuntu:latest

RUN mkdir /var/ssh
WORKDIR /var/ssh
COPY . .

RUN apt update && apt install  openssh-server sudo -y

ENV user=theusername
ENV userFolderSSH=/home/$user/.ssh

RUN adduser $user --disabled-password --gecos ""

RUN mkdir $userFolderSSH && \
    chmod 700 $userFolderSSH && \
    touch $userFolderSSH/authorized_keys && \
    chmod 600 $userFolderSSH/authorized_keys

RUN cat /var/ssh/keys/theusername/theusername.pub >> $userFolderSSH/authorized_keys

RUN chown -R $user:$user $userFolderSSH

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]