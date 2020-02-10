#!/usr/bin/env sh

emacs --batch --no-init-file -l publish.el -f toggle-debug-on-error -f org-publish-all
