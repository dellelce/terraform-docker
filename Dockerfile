ARG BASE=alpine:3.16

FROM ${BASE} as tflint

RUN apk add --no-cache bash

COPY install_linux.sh .
RUN bash install_linux.sh


FROM ${BASE}

RUN apk add --no-cache gawk bash make vim git

COPY --from=flint /usr/local/bin/tflint /bin/tflint
COPY terraform /bin
COPY src /terrash/

RUN mkdir /terraform

ENV PS1 "\\\$ "
