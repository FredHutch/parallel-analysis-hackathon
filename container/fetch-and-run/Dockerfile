FROM amazonlinux:latest
RUN yum -y install which unzip aws-cli sudo nano curl
RUN amazon-linux-extras install -y R3.4
ADD install.r /var/install.r
RUN R -f /var/install.r
ADD fetch_and_run.sh /usr/local/bin/fetch_and_run.sh
RUN sudo chmod +x /usr/local/bin/fetch_and_run.sh
WORKDIR /tmp
USER root
ENTRYPOINT ["/usr/local/bin/fetch_and_run.sh"]