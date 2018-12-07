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
sudo yum install -y nano curl
sudo amazon-linux-extras install -y R3.4



echo "Creating working directories"
sudo mkdir -p /var/analysis

LOCAL_INPUT_DIR="/var/analysis/input/"
LOCAL_OUTPUT_DIR="/var/analysis/output/"
sudo mkdir -p $LOCAL_INPUT_DIR
sudo mkdir -p $LOCAL_OUTPUT_DIR



echo "Getting the R script"
RFILELOCATION="/var/analysis/r-script.r"
if [ -f $RFILELOCATION ] ; then
    sudo rm -f $RFILELOCATION
fi



echo "Getting the R script from S3"
# get the file from S3
echo 
sudo aws s3 cp "${R_SCRIPT_S3_URL}" "${RFILELOCATION}" || error_exit "Failed to download R script from S3"



echo "Getting the input data from S3"
# get the file from S3
echo 
sudo aws s3 cp "${INPUT_S3_DIR}" "${LOCAL_INPUT_DIR}" --recursive || error_exit "Failed to download input data from S3"



echo "Running the R script"
sudo R -f $RFILELOCATION



echo "Saving the results back to S3"
sudo aws s3 cp "${LOCAL_OUTPUT_DIR}" "${S3_OUTPUT_DIR}" --recursive || error_exit "Failed to upload results to S3"



date
echo "Ending process. bye bye!!"