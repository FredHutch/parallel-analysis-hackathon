# Parallelizing Cytometry Processing

***Fred Hutch Hackathon, December 2018***

The goal of this hackathon project is to enable someone to [run cytometry analysis in parallel](https://teams.fhcrc.org/sites/HDC/Lists/Hackathon%20Proposals/DispForm.aspx?ID=10&ContentTypeId=0x010047F16798A81FA44C8BFA5C38D7C0878A ). The task is 'embarassingly parallel', because none of the tasks have dependencies on each other. They can run independently. Theoretically they could all run at the same time.

The team decided to use [AWS Batch](https://aws.amazon.com/batch/), because it's designed for this kind of parallel computation, and transparently scales compute infrastructure up and down. 

During the course of the Hackathon we submitted 763 analysis jobs, each running R and C++ code. We were only able to run about 30-40 jobs at a time, a limitation we will work on. Still, the resulting run took less than 2 hours, an order of magnitude faster than the previous run. 


### Design

* A Jupyter notebook was created to provide a simpler interface to researchers.
* All of the data to analyze was uploaded to an S3 bucket (via Jupyter)
* We created a container image that had R, Rcpp, and Scmp installed. 
* We created a Batch job template that uses environment variables to control its behavior. It will download an R script from S3, a folder of data from S3, run the R script, and save the results back to S3. The location of the R script, folder to download from, and folder to upload to are all configurable.
* The Jupyter notebook is designed to let someone iterate over a 'parent' folder, creating a processing job for each child folder, changing the environment variables for each job so they analyze different data sets.


**Components**

* AWS account (cortex-sandbox)
   * One S3 bucket for all of this work
   * /Input/ <- has the input and output of the analysis
   * /r-code <- has the R code to run
* Jupyter notebook for setting up and kicking off processing



## Hackathon Q-and-A

1. Will Jupyter notebooks work as the UI for this work? 
   * *Yes, most people are familiar with Jupyter notebooks*
2. For the notebooks, all the inputs at the top, or inline?
   * Inline is better.
3. Variables or IPyWidgets?
   * Variables. 
4. What to do about failed analysis? Auto-retry a certain number of times?
   * Ideally, auto-retry once with more compute + memory. Then alert.


## Next Steps

* Make the steps to create-and-configure AWS Batch reproducible. They were originally created by Dev Nambi via the AWS console.
* Document steps to install Python3, Jupyter and boto3 onto a researcher's laptop (usually a Mac)
* Open up a support ticket with AWS to figure out how to run more than 30-40 jobs at a time. 
* Set up AWS Batch in a different AWS account, such as the one Greg & Evan use for their lab
* If needed, figure out how to give the Batch jobs more storage. Right now they only have 8-30GB of storage each. 
* Document steps so researchers can potentially create docker containers, because they will need to install additional libraries or R packages.



