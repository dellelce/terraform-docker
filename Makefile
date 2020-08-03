
IMAGE := dellelce/terraform

help:
	@echo Use "build" target to build...

build:
	@docker build -t $(IMAGE) .

run:
	@mkdir -p workdir terradir && docker run -it -v $$PWD/workdir:/work -v $$PWD/terradir:/terraform --rm $(IMAGE) bash
