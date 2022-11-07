
FROM alpine:3.16

RUN apk add --no-cache gawk bash make vim git

RUN wget -O - -q https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

COPY terraform /bin
COPY src /terrash/

RUN mkdir /terraform

ENV PS1 "\\\$ "
