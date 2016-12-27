FROM debian:jessie

MAINTAINER Guillaume Mayer <gmayer@arkho.tech>

COPY id_rsa /id_rsa

RUN apt-get update && apt-get install -y openssh-client

CMD ssh root@45.33.31.7 -L 1521:localhost:1521 -i /id_rsa -o StrictHostKeyChecking=no -o ExitOnForwardFailure=yes -N