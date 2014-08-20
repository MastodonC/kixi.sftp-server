FROM ubuntu:14.04.1
MAINTAINER Max Droog Hayes

#
# SFTP Dockerfile
#
############################################
RUN apt-get -y update

RUN apt-get -y install openssh-server --fix-missing

RUN mkdir /var/run/sshd

RUN useradd -m -d /srv/sftp -p password sftpuser

RUN echo 'sftpuser:password' |chpasswd

#RUN sed -i 's/Port 22/Port 2222/' "/etc/ssh/sshd_config"

RUN sed -i 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/' "/etc/ssh/sshd_config"

CMD    ["/usr/sbin/sshd", "-D", "-4"]

# Expose ports.
EXPOSE 2222
