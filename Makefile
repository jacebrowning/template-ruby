# match default value of project_name from cookiecutter.json
COOKIE := TemplateDemo

BASE_CC := {{cookiecutter.project_name}}
CC_FILES := $(BASE_CC)/* $(BASE_CC)/*/* $(BASE_CC)/*/*/*

.PHONY: all
all: $(COOKIE)
	cd $(COOKIE); make

.PHONY: ci
ci: $(COOKIE)
	cd $(COOKIE); make ci

$(COOKIE): Makefile cookiecutter.json $(CC_FILES)
	cat cookiecutter.json
	cookiecutter . --no-input --overwrite-if-exists

.PHONY: watch
watch:
	pip install sniffer MacFSEvents
	sniffer

.PHONY: clean
clean:
	rm -rf $(COOKIE)
