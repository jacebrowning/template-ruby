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
install: $(GEMS)

$(GEMS): Gemfile*
	bundle install --path $@
	@ touch $@

.PHONY: update
update:
	bundle update

# CHECKS #######################################################################

.PHONY: check
check: install
	@ echo TODO: add 'check' task

# TESTS ########################################################################

.PHONY: test
test: install
	@ echo TODO: add 'test' task

# DOCUMENTATION ################################################################

.PHONY: doc
doc: install
	@ echo TODO: add 'doc' task

# CLEANUP ######################################################################

.PHONY: clean
clean:
	rm -rf $(GEMS)
