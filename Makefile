VERSION ?= $(shell git rev-parse HEAD)
IMAGE ?= mgoltzsche/sample-app-minimal:$(VERSION)

all: docker-build

docker-build:
	docker build -t $(IMAGE) .

kind-load-image: docker-build
	kind load docker-image $(IMAGE)
