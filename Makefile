GROUP=eavatar
NAME=consul
VERSION=0.1.3


all: build tag

build: Dockerfile
	docker build  -t $(GROUP)/$(NAME):$(VERSION) .

tag:
	@if ! docker images $(GROUP)/$(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker tag $(GROUP)/$(NAME):$(VERSION) $(GROUP)/$(NAME):latest

clean:
	rm -f overlayfs.tar
