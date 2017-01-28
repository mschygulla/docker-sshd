FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends openssh-server \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd \
    && sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

ARG ROOT_PASSWD=toor
RUN echo root:${ROOT_PASSWD} | chpasswd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]