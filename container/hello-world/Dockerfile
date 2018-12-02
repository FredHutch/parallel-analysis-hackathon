# Use an official Ubuntu runtime as a parent image
FROM ubuntu:latest


# Define environment variable
ENV NAME World
ENV DEBIAN_FRONTEND noninteractive

# Install any needed packages specified in requirements.txt
RUN apt-get -y update 
RUN apt-get -yq install r-base nano curl


# Set the working directory to /var
WORKDIR /var

# Copy the current directory contents into the container at /var
# COPY . /var

# Run bash entrypoint script when the container launches
# http://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/
# CMD ["bash",  "/var/entrypoint.sh"]
# ENTRYPOINT ["/bin/echo", "'Hello World'"]
ENTRYPOINT ["/bin/bash", "-c", "ls -l /var; while true; do sleep 30; done;"]
