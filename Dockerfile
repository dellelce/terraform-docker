
FROM alpine:3.11

RUN apk add --no-cache gawk bash make vim

COPY terraform /bin
COPY src /terrash/

ENV PS1 "\\\$ "
