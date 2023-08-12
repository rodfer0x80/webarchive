# archlinun hackbox
FROM archlinux:latest

WORKDIR /root

COPY opt/ /root/run
WORKDIR /root/run

RUN ./init.sh

RUN rm init.sh
RUN rm packages.txt
