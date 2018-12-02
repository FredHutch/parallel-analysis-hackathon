# Parallelizing Cytometry Processing


***Fred Hutch Hackathon, December 2018***


* AWS Batch, probably

**Components**

* AWS account (cortex-sandbox)
   * One S3 bucket for the lab
   * /Input/{Date}/{Batch Name}/{Analysis}
   * /Output/{Date}/{Batch Name}/{Analysis}
   * /Logs/{Date}/{Batch Name}/{Analysis}
* Jupyter notebook for setting up and kicking off processing
* Another notebook to watch the output, and get the logs of the processing



## Hackathon Questions

* Will Jupyter notebooks work as the UI for this work? 
* For the notebooks, all the inputs at the top, or inline?
* Variables or IPyWidgets?
* Confirm I can easily get the list of analysis from the input folder
* What to do about failed analysis? Auto-retry a certain number of times?


## AWS work

*Note, document all of this, so we can terraform it later if need be*

* Make an S3 bucket
* Make an IAM user for egreene
* Enable AWS Batch if need be
* Set up an AWS role for all of this, so perms are streamlined

## AWS Batch work

* Learn how it passes variables around
* How do we give it parameters for a job? 
* How do we configure CPU, memory, and *storage* for a container? 
* How do we inject job parameters into a container?
   * Do they go in as environment variables? Files? 
* What happens if a job fails? 
* Can it email the output?
* How can we get the console output of a job?

## Notebook work

* Set up all of the functions
* Set up all of the input variables as IPyWidgets
* Set up all of the patterns for configured variables (locations)
* Learn how to control Batch from boto3

## Container work

* Use Ubuntu as the base? Everyone's familiar with it
* Confirm my entrypoint gets the variables it needs


## End to End Testing

* Test one job, word count
* Test five jobs, word count
* Test with a simple R script
* Test word count for *all* FAST file chunks using R
