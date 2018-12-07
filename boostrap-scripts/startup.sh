#!/bin/bash
date
echo "Validating inputs"
echo "Args: $@"
env
if [ -z "${R_SCRIPT_S3_URL}" ]; then
  echo 'R_SCRIPT_S3_URL not set. No object to download.'
fi

if [ -z "${S3_INPUT_DIR}" ]; then
  echo 'S3_INPUT_DIR not set. No analysis to download.'
fi

if [ -z "${S3_OUTPUT_DIR}" ]; then
  echo 'S3_OUTPUT_DIR not set. No place to put results.'
fi


echo "Installing basic packages"
#install R
yum install -y nano curl
amazon-linux-extras install -y R3.4



echo "Creating working directories"
mkdir -p /var/analysis

LOCAL_INPUT_DIR="/var/analysis/input/"
LOCAL_OUTPUT_DIR="/var/analysis/output/"
mkdir -p $LOCAL_INPUT_DIR
mkdir -p $LOCAL_OUTPUT_DIR



echo "Getting the R script"
RFILELOCATION="/var/analysis/r-script.r"
if [ -f $RFILELOCATION ] ; then
    rm -f $RFILELOCATION
fi



echo "Getting the R script from S3"
# get the file from S3
echo 
aws s3 cp "${R_SCRIPT_S3_URL}" "${RFILELOCATION}" || error_exit "Failed to download R script from S3"



echo "Getting the input data from S3"
# get the file from S3
echo 
aws s3 cp "${INPUT_S3_DIR}" "${LOCAL_INPUT_DIR}" || error_exit "Failed to download R script from S3"



echo "Running the R script"
R -f $RFILELOCATION



echo "Saving the results back to S3"
#aws s3 cp 


date
echo "Ending process. bye bye!!"