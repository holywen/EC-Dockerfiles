
include ../settings.mk

MODULE_NAME = commanderbase

include ../template.mk

push:
	docker push holywen/$(MODULE_NAME)

pull:
	docker pull holywen/$(MODULE_NAME)

build:
	docker build -t holywen/$(MODULE_NAME) .
