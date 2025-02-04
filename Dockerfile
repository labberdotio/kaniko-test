FROM alpine:3.18

MAINTAINER whoopsjohnnie

RUN echo "Hello from kaniko"

CMD ["cat", "/etc/os-release"]

