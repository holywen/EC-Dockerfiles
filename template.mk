.PHONY: all build push pull cleandata cleanimages clean

all: build push pull

build:
	EFLOW_INSTALLER=$(EFLOW_INSTALLER) docker build -t holywen/$(MODULE_NAME):$(TAG) --build-arg EFLOW_INSTALLER .

push:
	docker push holywen/$(MODULE_NAME):$(TAG)

pull:
	docker push holywen/$(MODULE_NAME):$(TAG)

clean: cleandata clean images

cleandata:
	rm -fr ../repository-data/*
