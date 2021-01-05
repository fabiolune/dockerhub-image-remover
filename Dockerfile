FROM curlimages/curl:7.74.0

WORKDIR /app

COPY script.sh .

ENTRYPOINT [ "./script.sh" ]