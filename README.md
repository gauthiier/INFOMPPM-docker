# 📺 "WHAAA" - Docker Environment for Personalisation for (public) Media 📢

## Install docker

Please follow the instruction for intstalling docker on you operating system: [Docker Desktop](https://www.docker.com/products/docker-desktop)

## Quickstart (build an image)
- `git clone https://github.com/gauthiier/INFOMPPM-docker.git`
- `cd INFOMPPM-docker`
- `./docker.sh build-dev` (⚡️takes a while at first)

This should create a docker image named "uu/infomppm". To see if the image was created properly simply run:
- `docker image ls` 

## Quickstart (run a container)
When the "uu/infomppm" is created you can simply start a container with the following:
- `./docker.sh run`

This will start a docker container name "whaaa" based on the "uu/infomppm" image. To exit a session simply enter `exit` while inside the container. Please note the container will be destroyed when you exit it. That said, everything that is in directories code/ data/ and manual/ will be saved on your machine. 

## Important commands
- run jupyter notebook in the docker environment:
	- `./docker.sh run`
	- `cd code/`
	- `jupyter notebook --no-browser --ip 0.0.0.0 --allow-root`
	- open a web browser with the listed URL (e.g., starting with http://127.0.0.1:8888)
- run a streamlit app in the docker environment:
	- `./docker.sh run`
	- `cd code/<path_to_the_streamlit_app>`
	- `streamlit run app.py`
	- - open a web browser at [http://localhost:8501](http://localhost:8501)
- build a course manual based on your work: 
	- `./docker.sh run`
	- `cd manual/`
	- `./manual.sh build`
	- then `./manual.sh clean` to cleanup 
	- open a web browser at [http://localhost:9999](http://localhost:9999)



