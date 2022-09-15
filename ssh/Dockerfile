FROM ubuntu:latest
RUN apt update && apt install  openssh-server sudo -y
RUN  apt install sshpass
COPY Login_details.txt /
COPY readlogs.sh /
CMD [ "sh", "./readlogs.sh" ]

