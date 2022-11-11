ARG BASE=alpine:3.16

FROM ${BASE} as tflint

RUN apk add --no-cache bash

COPY install_tflint.sh .
RUN bash install_tflint.sh


FROM ${BASE}

RUN apk add --no-cache gawk bash make vim git

COPY --from=tflint /usr/local/bin/tflint /bin/tflint
COPY terraform /bin
COPY src /terrash/

COPY vim/vimrc_local /etc/vim/vimrc.local

RUN mkdir /terraform

ENV PS1 "\\\$ "
