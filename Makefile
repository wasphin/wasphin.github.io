ORG_FILES := $(filter-out README.org, $(wildcard *.org))

all: publish

publish: publish.el $(ORG_FILES)
	podman run --rm -ti --network host -v $(SHELL pwd):/workspace iquiw/alpine-emacs sh -c "cd /workspace; ./build.sh"

simple: publish $(ORG_FILES)
#	emacs --batch --no-init-file -l publish.el -f toggle-debug-on-error -f org-publish-all
	emacs -u "$(id -un)" --batch --no-init-file -l publish.el -f toggle-debug-on-error -f org-publish-all

.PHONY: all publish
