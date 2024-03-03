# grep the version from the package file
VERSION=0.0.3
APP_NAME=test_app
DOCKER_REPO=gm93

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help install deploy version

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# DOCKER TASKS
# Build the container
build: install ## Build the container
	docker build -t $(APP_NAME) .

build-nc: install ## Build the container without caching
	docker build --no-cache -t $(APP_NAME) .

release: build-nc publish ## Make a release by building and publishing the `{version}` and `latest` tagged containers to ARTIFACTORY

# Docker publish
publish: publish-latest publish-version ## Publish the `{version}` and `latest` tagged containers to ARTIFACTORY

publish-latest: tag-latest ## Publish the `latest` taged container to ARTIFACTORY
	@echo 'publish latest to $(DOCKER_REPO)'
	docker push $(DOCKER_REPO)/$(APP_NAME):latest

publish-version: tag-version ## Publish the `{version}` taged container to ARTIFACTORY
	@echo 'publish $(VERSION) to $(DOCKER_REPO)'
	docker push $(DOCKER_REPO)/$(APP_NAME):$(VERSION)

# Docker tagging
tag: tag-latest tag-version ## Generate container tags for the `{version}` and `latest` tags

tag-latest: ## Generate container `{version}` tag
	@echo 'create tag latest'
	docker tag $(APP_NAME) $(DOCKER_REPO)/$(APP_NAME):latest

tag-version: ## Generate container `latest` tag
	@echo 'create tag $(VERSION)'
	docker tag $(APP_NAME) $(DOCKER_REPO)/$(APP_NAME):$(VERSION)

version: ## Output the current version
	@echo $(VERSION)

install: ## Install prerequisites
	@echo 'install'
