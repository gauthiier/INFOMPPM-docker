#!/usr/bin/env bash

if ! hash docker 2>/dev/null; then
    echo "docker is required. Please install it first!"
    exit 1
fi

if ! [[ "$1" =~ ^(build|build-dev|run|shell)$ ]]; then
    echo "usage: $0 [action]"
    echo " where actions can be: [build, build-dev, run, shell]"
    exit 1
fi

case $1 in 

build)
    echo "> building a local image"
    cd manual/
    source manual.sh build
    source manual.sh clean
    cd ..    
    docker build -t uu/infomppm .
    ;;
build-dev)
    echo "> building a local dev image"
    docker build -t uu/infomppm .
    ;;    
run)
    echo "> runing a content dev instance"
    echo "+ by default the course manual exposed on localhost:9999"
    echo "+ by default jupyter is exposed on localhost:8888"
    echo "+ by default streamlit is exposed on localhost:8501"
    docker run --rm -it --name whaaa -p 9999:80 -p 8888:8888 -p 8501:8501 \
        -v $(pwd)/code:/root/code \
        -v $(pwd)/data:/root/data \
        -v $(pwd)/manual/book/_build/html:/var/www/html \
        -v $(pwd)/manual:/root/manual \
        uu/infomppm:latest
    ;;
shell)
    echo "> spawning new shell in the whaaa container"
    docker exec -it whaaa /bin/bash
    ;;
esac