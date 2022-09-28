FROM docker:latest

WORKDIR /home/app

COPY . .

RUN \
    apk update && apk upgrade && \ 
    apk add bash git wget python3 py3-pip && \
    pip3 install pyyaml

VOLUME /home/app/config

CMD \
    bash ./start.sh && \
    python3 ./main.py