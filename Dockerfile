
FROM alpine:3.16

RUN apk add --no-cache gawk bash make vim git

COPY install_linux.sh .
RUN bash install_linux.sh

COPY terraform /bin
COPY src /terrash/

RUN mkdir /terraform

ENV PS1 "\\\$ "
