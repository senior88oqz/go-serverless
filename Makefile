VERSION?=	$(shell git describe --tags --always)

s3toSQS: dist/s3toSQS deploy-s3toSQS ## Build and deploy s3toSQS service

.PHONY: lint
lint: lint-go lint-cf validate-sam ## Lint code and CF templates

.PHONY: lint-go
lint-go: ## Lint Go code
	revive ./...

.PHONY: lint-cf
lint-cf: ## Lint CF templates
	find cf -name 'template.yml' -exec cfn-lint '{}' \;

.PHONY: validate-sam
validate-sam: ## Validate sam templates
	sam validate --template cf/template.yml

dist/%:
	go build -ldflags "-X main.Version=$(VERSION)" -o $@ ./cmd/$*

dist/%.zip: dist/%
	zip -rjDm $@ $<