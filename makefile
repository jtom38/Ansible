.PHONY: help
help: ## Shows this help command
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build-image-2.9:
	docker build -t ansible:2.9.11 ./.devcontainer/

build-image-2.10:
	docker build -t ansible:2.10 ./.devcontainer/Dockerfile_210

install-requirements: ## Install Ansible Galaxy Requirements
	ansible-galaxy install -r requirements.yml
