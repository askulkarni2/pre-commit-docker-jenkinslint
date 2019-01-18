.phony: build push test

build:
	docker build . -t askulkarni2/jenkinslint:0.0.2

push:
	docker push askulkarni2/jenkinslint:0.0.2

test:
	pre-commit try-repo . docker-jenkinslint --verbose --files Jenkinsfile