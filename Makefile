.phony: build push test

build:
	docker build . -t jenkinslint

push:
	docker push jenkinslint

test:
	pre-commit try-repo . docker-jenkinslint --verbose