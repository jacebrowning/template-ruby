# match default value of project_name from cookiecutter.json
COOKIE := TemplateDemo

DIRECTORIES := {{cookiecutter.project_name}}
FILES := $(DIRECTORIES)/*

.PHONY: all
all: $(COOKIE)
	cd $(COOKIE); make

.PHONY: ci
ci: $(COOKIE)
	cd $(COOKIE); make ci

$(COOKIE): Makefile cookiecutter.json $(FILES)
	cat cookiecutter.json
	cookiecutter . --no-input --overwrite-if-exists

.PHONY: watch
watch:
	pip install sniffer MacFSEvents
	sniffer

.PHONY: clean
clean:
	rm -rf $(COOKIE)
