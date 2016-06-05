PROJECT = hello
IMAGE = nsarno/$(PROJECT)
PORT = 4000
TAG = v3

$(PROJECT): build test

build:
	docker build -t $(IMAGE) .

run:
	docker run -p $(PORT):4000 -it $(IMAGE)

test:
	docker run -e "MIX_ENV=test" -it $(IMAGE) bash -c "mix test 1>&1"

iex:
	docker run -p $(PORT):4000 -it $(IMAGE) iex -S mix phoenix.server

shell:
	docker run -p $(PORT):4000 -it $(IMAGE) bash

tag: 
	docker tag $(IMAGE) $(IMAGE):$(TAG)

push:
	docker push $(IMAGE)

.PHONY: build run test console shell tag push
