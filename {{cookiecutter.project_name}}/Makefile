BE := bundle exec

# MAIN TASKS ###################################################################

.PHONY: all
all: install

.PHONY: ci
ci: check test

# SYSTEM DEPENDENCIES ##########################################################

.PHONY: doctor
doctor:  ## Confirm system dependencies are available
	@ echo "Checking Ruby version:"
	@ ruby --version | tee /dev/stderr | grep -q `cat .ruby-version`

# PROJECT DEPENDENCIES #########################################################

GEMS := vendor/bundler

.PHONY: install
install: $(GEMS) ## Install all project dependnecies

$(GEMS): Gemfile*
	bundle install --path $@
	@ touch $@

.PHONY: update
update: ## Update all project dependnecies
	bundle update

# CHECKS #######################################################################

.PHONY: check
check: install ## Run linters and static analysis
	@ echo "TODO: add 'check' task"

# TESTS ########################################################################

.PHONY: test
test: install ## Run unit and integration tests
	@ echo "TODO: add 'test' task"

# DOCUMENTATION ################################################################

.PHONY: doc
doc: install ## Run documentation generators
	@ echo "TODO: add 'doc' task"

# CLEANUP ######################################################################

.PHONY: clean
clean: ## Delete all generated and temporary files
	rm -rf $(GEMS)

# HELP #########################################################################

.PHONY: help
help: all
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
