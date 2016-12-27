.PHONY: all build push pull cleandata cleanimages clean cleanall

all: build push pull

build:
	EFLOW_INSTALLER=$(EFLOW_INSTALLER) \
        EFLOW_INSTALLER_DOWNLOAD_PATH=$(EFLOW_INSTALLER_DOWNLOAD_PATH) \
        EFLOW_DOWNLOAD_USER=$(EFLOW_DOWNLOAD_USER) \
        EFLOW_DOWNLOAD_PASS=$(EFLOW_DOWNLOAD_PASS) \
        docker build -t holywen/$(MODULE_NAME):$(TAG) --build-arg EFLOW_INSTALLER \
            --build-arg EFLOW_INSTALLER_DOWNLOAD_PATH --build-arg EFLOW_DOWNLOAD_USER \
            --build-arg EFLOW_DOWNLOAD_PASS .

push: build
	docker push holywen/$(MODULE_NAME):$(TAG)

pull: 
	docker pull holywen/$(MODULE_NAME):$(TAG)

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
