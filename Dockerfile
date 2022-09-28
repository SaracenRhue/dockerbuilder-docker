FROM docker:latest

WORKDIR /home/app

COPY . .

VOLUME /home/app/config

CMD apk add bash && bash ./start.sh