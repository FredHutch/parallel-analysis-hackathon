# Docker Notes

### Make a basic container

```
cd /Users/dnambi/Documents/GitHub/parallel-analysis-hackathon/container/hello-world-r

docker build -t r-starter .

docker run r-starter
```

**Set the entrypoint script to run RScript**

* http://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/


### Make the 'base' R container

```
cd /Users/dnambi/Documents/GitHub/parallel-analysis-hackathon/container/base-r

docker build -t base-r .

docker run base-r
```

* https://www.tutorialspoint.com/r/r_basic_syntax.htm


### Make a container that downloads the R script from an S3 location (defined in an environment variable) and runs it

### Resources


