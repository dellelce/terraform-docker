
IMAGE := dellelce/terraform
MOUNTS = -v $$HOME/.aws:/root/.aws -v $$PWD/workdir:/work -v $$PWD/terradir:/terraform

help:
	@echo Use "build" target to build...

build:
	@docker build -t $(IMAGE) .

run:
	@mkdir -p workdir terradir && docker run -it $(MOUNTS) --rm $(IMAGE) bash
