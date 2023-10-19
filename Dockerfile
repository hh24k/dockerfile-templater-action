FROM ghcr.io/bossm8/dockerfile-templater:debug
COPY entrypoint.sh ./
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]