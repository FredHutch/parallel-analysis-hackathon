# Parallelizing Cytometry Processing

***Fred Hutch Hackathon, December 2018***

The goal of this hackathon project is to enable someone to [run cytometry analysis in parallel](https://teams.fhcrc.org/sites/HDC/Lists/Hackathon%20Proposals/DispForm.aspx?ID=10&ContentTypeId=0x010047F16798A81FA44C8BFA5C38D7C0878A ). The task is 'embarassingly parallel', because none of the tasks have dependencies on each other. They can run independently.


https://aws.amazon.com/blogs/compute/analyzing-genomics-data-at-scale-using-r-aws-lambda-and-amazon-api-gateway/

* AWS Batch, probably

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
   * *TBD, decide at the hackathon*
3. Variables or IPyWidgets?
   * IPyWidgets, https://ipywidgets.readthedocs.io/en/stable/examples/Widget%20List.html#Text 
4. What to do about failed analysis? Auto-retry a certain number of times?
   * *TBD*

