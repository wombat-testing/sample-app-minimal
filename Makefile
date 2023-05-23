REGISTRY ?= gcr.io/cloudbees-ops-gcr/wombat
IMAGE ?= sample-app-minimal
VERSION ?= $(shell git rev-parse HEAD)

all: docker-build

docker-build:
	docker build -t $(REGISTRY)/$(IMAGE):$(VERSION) .

docker-push: docker-build
	docker push $(REGISTRY)/$(IMAGE):$(VERSION)	

docker-run: docker-build
	# To view it, browse http://localhost:8080
	docker run --rm -p 8080:8080 $(REGISTRY)/$(IMAGE):$(VERSION)

kind-load-image: docker-build
	kind load docker-image $(REGISTRY)/$(IMAGE):$(VERSION)
