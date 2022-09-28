FROM docker:latest

WORKDIR /home/app

COPY . .

VOLUME /home/app/config

CMD apk add bash && systemctl start docker && bash ./start.sh