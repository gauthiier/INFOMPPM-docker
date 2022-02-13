#!/usr/bin/env bash

case $1 in 

build)
	if ! hash jupyter-book 2>/dev/null; then
	    echo "jupyter-book is required. Please install it first!"
	    return 1
	fi
	cp -r ../code config/
	mkdir -p book/
	jupyter-book build config/ --path-output book/
	;;

clean)
	rm -r config/code
	;;
esac
