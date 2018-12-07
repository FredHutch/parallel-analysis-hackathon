# Docker Notes

### Make a fetch-and-run container


based on https://aws.amazon.com/blogs/compute/creating-a-simple-fetch-and-run-aws-batch-job/ and https://github.com/awslabs/aws-batch-helpers

```
sudo -i
apt-get update
apt-get -y install awscli docker.io

cd $HOME
mkdir -p fetchimage
cd fetchimage

nano # create the Dockerfile
nano # create the fetch-and-run script
nano # create the R script

docker build -t hackathon/fetch_and_run .   
docker images

apt-get list | grep g++
```

```
aws configure  # specify credentials
aws ecr get-login --region us-west-2

docker login -u AWS -p <long_key> <aws_ecr_url>

# tag a container so it can be uploaded
docker tag hackathon/fetch_and_run <aws_ecr_url>/hackathon:fetch_and_run

docker push <aws_ecr_url>/hackathon:fetch_and_run

```

