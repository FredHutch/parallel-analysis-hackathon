# AWS Batch

### Environment Setup

* VPC
* Subnet needed with public access, per https://docs.aws.amazon.com/batch/latest/userguide/troubleshooting.html
	* Guide at https://docs.aws.amazon.com/batch/latest/userguide/create-public-private-vpc.html


### Batch Primitives

**API**

* Boto3, https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/batch.html 

**Job Queues**

Jobs are submitted to a job queue. You can have multiple queues.

Queues can have relative priority

Job queues are mapped to compute environments (one or more)
	* Can be managed. Describe instance requirements
	* If using spot, % of on-demand price to bid
	* VPCs, subnets, tags to apply
	* Don't worry about unmanaged, useless for this

* These run inside your AWS account. You can see the EC2 instances in your account. 

The algorithm used is least-instances for capacity. So it waits a little bit before kicking off resources while it looks at the job queue


**Job Definition**

* Similar to ECS Task Definitions
* Specify roles to run, application to run, mount points, IAM role, vCPU and memory requirements, container properties, env variables

* https://docs.aws.amazon.com/batch/latest/userguide/create-job-definition.html
* Template is at https://docs.aws.amazon.com/batch/latest/userguide/job-definition-template.html 
* Parameters https://docs.aws.amazon.com/batch/latest/userguide/job_definition_parameters.html 
* Example is at https://docs.aws.amazon.com/batch/latest/userguide/example-job-definitions.html 


**Parallel Jobs**

* Array jobs - many copy of an application against an array of elements
	* Each one has separate parameters

**Workflows and Dependencies**

* You can say jobs depend on other jobs

**Scheduler**

* Evaluates when, where, and how to run jobs in roughly the order they've been submitted



**Compute Environment**

* List of constraints (spot bidding, instance type, CPU min/max) to use
* You can have up to 3 mapped to a job queue, with relative priority (lower integer = higher priority)
* The result is jobs can switch environments when need be. For example, spot is higher-priority, on-demand is lower

* Uses auto-scaling under the covers



### Jobs

aws batch submit-job 

* You can upload a zip container your code definition, or you can provide a container image, command and parameters

* You can specify a number of job retries

* You can specify parameters, an array of key-value pairs (like sleep-time). Includes some defaults
* When you specify the command, you can include a parameter using Ref::sleep-time
* If you include ref parameters but don't specify defaults, they become a required parameter
* Success is exit code 0. Anything else is failed

* All of the logs go to CloudWatch, the AWS Batch CloudWatch log group
* Job is the job name, container ID and something else

* Can use launch templates to do things like map storage into the container, https://docs.aws.amazon.com/batch/latest/userguide/launch-templates.html 


#### Disk Space

* You can mount EFS, but it's hard to get stuff into EFS
* You can map in a scratch volume by having the underlying AMIs that run the containers have a lot of storage (like 1TB)
	* https://docs.aws.amazon.com/batch/latest/APIReference/API_ContainerProperties.html#Batch-Type-ContainerProperties-mountPoints
	* https://github.com/aws-samples/aws-batch-genomics/issues/8
   * https://docs.aws.amazon.com/batch/latest/userguide/create-batch-ami.html
   * https://docs.aws.amazon.com/batch/latest/APIReference/API_Volume.html
* [EFS vs EBS](https://hackernoon.com/25-things-you-should-know-about-amazon-elastic-file-system-2023255303ea)
* https://aws.amazon.com/blogs/compute/building-high-throughput-genomic-batch-workflows-on-aws-batch-layer-part-3-of-4/

### Resources

* [Introducing AWS Batch](https://www.youtube.com/watch?v=ebwfhSS4ZkY&feature=youtu.be)
* [AWS Batch at Fred Hutch](https://fredhutch.github.io/aws-batch-at-hutch-docs/)
* [Fred Hutch R image](https://hub.docker.com/r/fredhutch/ls2_r/)
* [Fetch-and-Run an S3 script on the Docker image](https://aws.amazon.com/blogs/compute/creating-a-simple-fetch-and-run-aws-batch-job/)
* [AWS Batch Wrapper](https://github.com/FredHutch/aws-batch-wrapper)
* [Stackify Guide to AWS Batch](https://stackify.com/aws-batch-guide/)

