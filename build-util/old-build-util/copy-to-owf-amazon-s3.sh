#!/bin/sh
#
# Copy the site/* contents to the learn.openwaterfoundation.org website.
# - replace all the files on the web with local files

# Set --dryrun to test before actually doing
dryrun=""
#dryrun="--dryrun"
s3Folder="s3://learn.openwaterfoundation.org/cdss-app-statecu-fortran-doc-user"

# Make sure that this is being run from the old-build-util folder
pwd=`pwd`
dirname=`basename ${pwd}`
if [ ! ${dirname} = "old-build-util" ]
        then
        echo "Must run from old-build-util folder"
        exit 1
fi

if [ "$1" == "" ]
        then
        echo ""
        echo "Usage:  $0 AmazonConfigProfile"
        echo ""
        echo "Copy the site files to the Amazon S3 static website folder:  $s3Folder"
        echo ""
        exit 0
fi

awsProfile="$1"

# First build the site so that the "site" folder contains current content.
# - "mkdocs serve" does not do this

cd ../../mkdocs-project; mkdocs build --clean

# Now sync the local files up to Amazon S3
aws s3 sync site ${s3Folder} ${dryrun} --delete --profile "$awsProfile"

cd ../build-util/old-build-util
