SOURCE_FILES = Makefile cookiecutter.json $(shell find {{cookiecutter.project_name}})

GENERATED_PROJECT := TemplateDemo

# MAIN #########################################################################

.PHONY: all
all: $(GENERATED_PROJECT)
	make $@ -C $<

.PHONY: doctor
doctor: $(GENERATED_PROJECT)
	make $@ -C $<

.PHONY: ci
ci: $(GENERATED_PROJECT)
	make $@ -C $<

.PHONY: watch
watch:
	sniffer

# BUILD ########################################################################

$(GENERATED_PROJECT): $(SOURCE_FILES)
	cat cookiecutter.json
	cookiecutter . --no-input --overwrite-if-exists

# CLEANUP ######################################################################

.PHONY: clean
clean:
	rm -rf $(GENERATED_PROJECT)
