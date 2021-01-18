VERSION ?= 0.0.1
IMAGE ?= mgoltzsche/sample-app-minimal:$(VERSION)

all: docker-build

docker-build:
	docker build -t $(IMAGE) .

