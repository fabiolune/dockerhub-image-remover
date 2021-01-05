FROM curlimages/curl:7.74.0

WORKDIR /app

COPY script.sh .

RUN chmod ugo+x script.sh

ENTRYPOINT [ "./script.sh" ]