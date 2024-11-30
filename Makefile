SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:

MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

install:  ## Install requirements
	uv sync
	uv run ansible-galaxy role install -r requirements.yml -p ./roles/external
.PHONY: install

lint:  # Check ansible code style
	uv run ansible-lint .
	uv run ruff check .
	uv run ruff format --check .
.PHONY: lint

.DEFAULT_GOAL := help
help: Makefile
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
.PHONY: help
