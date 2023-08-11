# archlinux :: hackbox
FROM archlinux:latest
WORKDIR /root
COPY opt/ ./run
COPY init.sh .
COPY packages.txt .
RUN echo "Y" | ./init.sh
RUN rm init.sh
