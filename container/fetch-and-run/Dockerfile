FROM amazonlinux:latest
RUN yum -y install which unzip aws-cli sudo
ADD fetch_and_run.sh /usr/local/bin/fetch_and_run.sh
RUN sudo chmod +x /usr/local/bin/fetch_and_run.sh
WORKDIR /tmp
USER nobody
ENTRYPOINT ["/usr/local/bin/fetch_and_run.sh"]