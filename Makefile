BE := bundle exec

# MAIN TARGETS #################################################################

.PHONY: all
all: depends

.PHONY: ci
ci: check test

# DEPENDENCY INSTALLATION ######################################################

VENDOR_DIR := vendor
DEPENDS_FLAG := $(VENDOR_DIR)/.depends

.PHONY: depends
depends: depends-ci

.PHONY: depends-ci
depends-ci: $(DEPENDS_FLAG)
$(DEPENDS_FLAG): Gemfile*
	bundle install --path $(VENDOR_DIR)
	@ touch $@

.PHONY: install
install: depends-ci

.PHONY: update
update:
	bundle update

# STATIC ANALYSIS ##############################################################

.PHONY: check
check: depends-ci
	@ echo TODO: add static analytis

# UNIT/INTEGRATION TESTS #######################################################

.PHONY: test
test: depends-ci
	@ echo TODO: add static analytis

# CLEANUP ######################################################################

.PHONY: clean
clean:
	@ touch Gemfile

.PHONY: clean-all
clean-all: clean
	rm -rf $(VENDOR_DIR)
