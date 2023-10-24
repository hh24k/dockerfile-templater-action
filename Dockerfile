FROM alpine:3.18.4

SHELL ["/bin/ash", "-euo", "pipefail", "-c"]
RUN wget -q -O dockerfile-templater.tar.gz https://github.com/bossm8/dockerfile-templater/releases/download/0.0.3/dockerfile-templater_Linux_x86_64.tar.gz; \
    tar -xf dockerfile-templater.tar.gz; \
    mv dockerfile-templater /usr/local/bin/dockerfile-templater

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
