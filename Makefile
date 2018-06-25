# https://serverless.com/framework/docs/providers/aws/guide/credentials/
STAGE ?= "prod"

help:
	@echo Public targets:
	@grep -E '^[^_][^_][a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo "Private targets: (use at own risk)"
	@grep -E '^__[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[35m%-20s\033[0m %s\n", $$1, $$2}'

dependencies: ## Install build dependencies
	@echo "installing dependencies..."
	@npm install serverless@1.27.3 serverless-rust@0.1.3

deploy: ## Deploy application
	@echo "deploying function..."
	@./node_modules/.bin/serverless \
		deploy \
		--stage $(STAGE) \
		--conceal

destroy: ## Destroy application
	@echo "destroying function..."
	@./node_modules/.bin/serverless \
		remove \
		--stage $(STAGE) \

logs: ## Fetches a stream of logs
	@echo "fetching function logs..."
	@./node_modules/.bin/serverless \
		logs -f hello \
		--stage $(STAGE)