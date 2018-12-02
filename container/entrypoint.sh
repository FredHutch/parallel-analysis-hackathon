## Install necessary packages
sudo -i
apt-get update
apt-get install rbase, python3, git

## Confirm we have the necessary input variables
echo $S3_BUCKET_NAME
echo $S3_INPUT_FOLDER
echo $S3_OUTPUT_FOLDER
echo $S3_LOG_FOLDER
echo $GITHUB_REPO
echo $ANALYSIS_COMMAND


## Set up the container environment
mkdir -p /var/analysis

CODE_LOCATION=/var/analysis/code
INPUT_LOCATION=/var/analysis/input
LOG_LOCATION=/var/analysis/logs
OUTPUT_LOCATION=/var/analysis/output
mkdir -p $CODE_LOCATION
mkdir -p $INPUT_LOCATION
mkdir -p $LOG_LOCATION
mkdir -p $OUTPUT_LOCATION


## Get the data
aws s3 cp $S3_BUCKET_NAME/S3_INPUT_FOLDER/* $INPUT_LOCATION

## Get the code
git pull $GITHUB_REPO .

## Kick off the analysis
cd $CODE_LOCATION
. $ANALYSIS_COMMAND -input $INPUT_LOCATION -output $OUTPUT_LOCATION > $LOG_LOCATION

## Upload the results to S3
aws s3 cp $OUTPUT_LOCATION/* $S3_BUCKET_NAME/$S3_OUTPUT_FOLDER --recursive

## Upload the logs to S3
aws s3 cp $LOG_LOCATION/* $S3_BUCKET_NAME/$S3_LOG_FOLDER --recursive