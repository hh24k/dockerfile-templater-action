FROM alpine:latest

RUN wget -O dockerfile-templater.tar.gz https://github.com/bossm8/dockerfile-templater/releases/download/0.0.3/dockerfile-templater_Linux_x86_64.tar.gz; \
    tar -xf dockerfile-templater.tar.gz; \
    mv dockerfile-templater /usr/local/bin/templater

COPY entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]
