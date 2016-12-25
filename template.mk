.PHONY: all build push pull cleandata cleanimages clean

all: build push pull

build:
	EFLOW_INSTALLER=$(EFLOW_INSTALLER) docker build -t holywen/$(MODULE_NAME):$(TAG) --build-arg EFLOW_INSTALLER .

push: build
	docker push holywen/$(MODULE_NAME):$(TAG)

pull: 
	docker push holywen/$(MODULE_NAME):$(TAG)

clean: cleandata cleanimages

cleanimages:
	docker rmi holywen/$(MODULE_NAME):$(TAG)

cleandata:
	rm -fr db-data/*
	rm -fr zoo/zoo1/*
	rm -fr zoo/zoo2/*
	rm -fr zoo/zoo3/*
	rm -fr plugins/*
	rm -fr workspace/*
	rm -fr repository-data/*
	rm -f conf/*_ready
	rm -fr logs/*
	rm -fr conf/tmp*
