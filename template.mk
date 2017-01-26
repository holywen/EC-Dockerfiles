.PHONY: $(COMMON_TARGETS)

all: build push pull

build:
	cp -f ../$(EFLOW_INSTALLER) ./
	EFLOW_INSTALLER=$(EFLOW_INSTALLER) \
        docker build --squash -t holywen/$(MODULE_NAME):$(TAG) \
                     --build-arg EFLOW_INSTALLER .
	rm -f ./$(EFLOW_INSTALLER)

push: build
	docker push holywen/$(MODULE_NAME):$(TAG)

pull: 
	docker pull holywen/$(MODULE_NAME):$(TAG)

save: pull
	docker save -o ../images/$(MODULE_NAME)_$(TAG).tar holywen/$(MODULE_NAME):$(TAG)
    
load:
	docker load -i ../images/$(MODULE_NAME)_$(TAG).tar

clean: cleandata

cleanall: cleandata cleanimages

cleanimages:
	docker rmi holywen/$(MODULE_NAME):$(TAG)

cleandata:
	rm -fr ../db-data/*
	rm -fr ../zoo/*
	rm -fr ../plugins/*
	rm -fr ../workspace/*
	rm -fr ../repository-data/*
	rm -f ../conf/*_ready
	rm -fr ../logs/*
	rm -fr ../conf/tmp*
