FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update
RUN apt-get -y install unzip awscli sudo nano curl openssl build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev software-properties-common
RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
RUN apt-get -y install r-base
RUN apt -y update
RUN apt-get -y upgrade r-base
RUN R --version
ADD install.r /var/install.r
RUN R -f /var/install.r
ADD fetch_and_run.sh /usr/local/bin/fetch_and_run.sh
RUN sudo chmod +x /usr/local/bin/fetch_and_run.sh
WORKDIR /tmp
USER root
ENTRYPOINT ["/usr/local/bin/fetch_and_run.sh"]