# Makefile

IMAGE   := ghcr.io/dellelce/terraform
MOUNTS   = -v $$HOME/.aws:/root/.aws -v $$PWD/workdir:/work -v $$PWD/terradir:/terraform
RUN     := docker run -i $(MOUNTS) --rm $(IMAGE) terraform

help:
	@echo Use "build" target to build...

build:
	@docker build -t $(IMAGE) .

run:
	@mkdir -p workdir terradir && docker run -it $(MOUNTS) --rm $(IMAGE) bash

#  for x in $(terraform version -json | xargs echo | tr -d ','); do echo $x; done | awk '/[0-9]\./'
.version:
	mkdir -p workdir terradir && for x in $$( $(RUN) version -json | xargs echo | tr -d ',' ); \
						   do echo $$x; done | \
						   awk '/[0-9]+\./' | tr -d '\r'  > $@ || rm -f $@

json-version:
	@$(RUN) version -json

#	cat .version && docker tag $(IMAGE) $(IMAGE):$$(cat .version) && docker tag $(IMAGE) $(IMAGE):latest
tag: .version json-version
	@ls -lta

push: tag
	@docker push -a $(IMAGE)
