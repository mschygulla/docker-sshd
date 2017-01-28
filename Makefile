REPO = docker.io
NS = mschygulla
NAME = sshd
VERSION ?= latest
SHELL := /bin/bash

.PHONY: build push clean

default: build

build:
	docker build --build-arg ROOT_PASSWD=toor -t $(NAME):$(VERSION) .

push:
	docker tag $(NAME):$(VERSION) $(REPO)/$(NS)/$(NAME):$(VERSION)
	docker push $(REPO)/$(NS)/$(NAME):$(VERSION)

clean:
	-docker rmi $(REPO)/$(NS)/$(NAME):$(VERSION)
	-docker rmi $(NAME):$(VERSION)
