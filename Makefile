# Support development with Docker to minimize host software requirements.

.PHONY : docker-image test

default : test

DOCKER_IMAGE = unitive/hiptest-publisher

docker-image :
	docker build -t $(DOCKER_IMAGE) .

test : docker-image
	docker run --tty --user $$UID --rm $(DOCKER_IMAGE) bundle exec rspec
