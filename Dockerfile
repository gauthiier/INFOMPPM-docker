FROM debian:bullseye-slim

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
  # webserver for course manual
  nginx-light \
  # system
  python3-pip build-essential \
  # utils
  git vim tmux curl \
  # cleanup
  && rm -rf /var/lib/apt/lists/*

# configure the locale for UTF8 support.
RUN apt-get update && apt-get install -y locales \
  && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
  && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# install requirements

# install pipenv
RUN pip3 install pipenv

# install numpy
RUN pip3 install numpy

# install pandas
RUN pip3 install pandas

#install jupyter
RUN pip install notebook

#install jupyter book
# RUN pip install -U jupyter-book

# install streamlit
RUN pip3 install streamlit

# install sklearn
RUN pip install -U scikit-learn

# install matplotlib
RUN pip install -U matplotlib

# install beautifull soup
RUN pip install beautifulsoup4

# install spacy
RUN pip install spacy

# install streamlit-authenticator
RUN pip install streamlit-authenticator


# configure manual (read only)
# note: there is a problem here if running dev image...
RUN rm -Rf /var/www/html

# defaults volumes
VOLUME /root/code
VOLUME /root/data
WORKDIR /root

# defaults ~ setup
ADD docker.d/.bashrc /root/.bashrc
ADD docker.d/.motd /root/.motd
ADD docker.d/.vimrc /root/.vimrc
ADD docker.d/docker-entrypoint.sh /docker-entrypoint.sh

# expose default port nginx 
EXPOSE 80

# expose default port streamlit 
EXPOSE 8501

# expose default port jupyter
EXPOSE 8888

ENTRYPOINT ["/docker-entrypoint.sh"]