.PHONY: pull install help

.DEFAULT_GOAL := help

help:
	@echo "make pull    - refresh this repo's configs from the live system"
	@echo "make install - deploy this repo's configs onto the live system"

pull:
	./scripts/pull.sh

install:
	./scripts/install.sh
