FROM amazonlinux:latest
RUN yum -y update
RUN yum -y install which unzip aws-cli sudo nano curl openssl
RUN sudo amazon-linux-extras install -y epel
RUN sudo yum -y install R
RUN R --version
ADD install.r /var/install.r
RUN R -f /var/install.r
ADD fetch_and_run.sh /usr/local/bin/fetch_and_run.sh
RUN sudo chmod +x /usr/local/bin/fetch_and_run.sh
WORKDIR /tmp
USER root
ENTRYPOINT ["/usr/local/bin/fetch_and_run.sh"]