# Parallelizing Cytometry Processing

***Fred Hutch Hackathon, December 2018***

The goal of this hackathon project is to enable someone to [run cytometry analysis in parallel](https://teams.fhcrc.org/sites/HDC/Lists/Hackathon%20Proposals/DispForm.aspx?ID=10&ContentTypeId=0x010047F16798A81FA44C8BFA5C38D7C0878A ). The task is 'embarassingly parallel', because none of the tasks have dependencies on each other. They can run independently. Theoretically they could all run at the same time.

The team decided to use [AWS Batch](https://aws.amazon.com/batch/), because it's designed for this kind of parallel computation, and transparently scales compute infrastructure up and down. 

During the course of the Hackathon we submitted 763 analysis jobs, each running R and C++ code. We were only able to run about 30-40 jobs at a time, a limitation we will work on. Still, the resulting run took less than 2 hours, an order of magnitude faster than the previous run. 


### Design

* A Jupyter notebook was created to provide a simpler interface to researchers.
* All of the data to analyze was uploaded to an S3 bucket (via Jupyter)
* We created a container image that had R, Rcpp, and Scmp installed. 
* We created a Batch job template that will download an R script from 

**Components**

* AWS account (cortex-sandbox)
   * One S3 bucket for the lab
   * /Input/{Date}/{Batch Name}/{Analysis}
   * /Output/{Date}/{Batch Name}/{Analysis}
   * /Logs/{Date}/{Batch Name}/{Analysis}
* Jupyter notebook for setting up and kicking off processing
* Another notebook to watch the output, and get the logs of the processing



## Hackathon Q-and-A

1. Will Jupyter notebooks work as the UI for this work? 
   * *Yes, most people are familiar with Jupyter notebooks*
2. For the notebooks, all the inputs at the top, or inline?
   * Inline is better.
3. Variables or IPyWidgets?
   * Variables. 
4. What to do about failed analysis? Auto-retry a certain number of times?
   * Ideally, auto-retry once with more compute + memory. Then alert.

