#!/bin/sh
#
# Copy the site/* contents to the learn.openwaterfoundation.org website.
# - replace all the files on the web with local files

# Supporting functions, alphabetized

# Make sure the MkDocs version is consistent with the documentation content
# - require that at least version 1.0 is used because of use_directory_urls = True default
# - must use "file.md" in internal links whereas previously "file" would work
# - it is not totally clear whether version 1 is needed but try this out to see if it helps avoid broken links
checkMkdocsVersion() {
	# Required MkDocs version is at least 1
	requiredMajorVersion="1"
	if [ $operatingSystem = "mingw" ]; then
		# Git bash mkdocs --version gives: __main__.py, version 1.0.4 from C:\Users\sam\AppData\Local\Programs\Python\Python37\lib\site-packages\mkdocs (Python 3.7)
		# Use the Windows Python with Git Bash
		mkdocsVersionFull=$(py -m mkdocs --version)
	else
		# On Cygwin, mkdocs --version gives:  mkdocs, version 1.0.4 from /usr/lib/python3.6/site-packages/mkdocs (Python 3.6)
		# General case
		mkdocsVersionFull=$(mkdocs --version)
	fi
	echo "MkDocs --version:  $mkdocsVersionFull"
	mkdocsVersion=$(echo $mkdocsVersionFull | cut -d ' ' -f 3)
	echo "MkDocs full version number:  $mkdocsVersion"
	mkdocsMajorVersion=$(echo $mkdocsVersion | cut -d '.' -f 1)
	echo "MkDocs major version number:  $mkdocsMajorVersion"
	if [ "$mkdocsMajorVersion" -lt "$requiredMajorVersion" ]; then
		echo ""
		echo "MkDocs version for this documentation must be version $requiredMajorVersion or later."
		echo "MkDocs mersion that is found is $mkdocsMajorVersion, from full version ${mkdocsVersion}."
		exit 1
	else
		echo ""
		echo "MkDocs major version ($mkdocsMajorVersion) is OK for this documentation."
	fi
}

# Determine the operating system that is running the script
# - mainly care whether Cygwin
checkOperatingSystem()
{
	if [ ! -z "${operatingSystem}" ]; then
		# Have already checked operating system so return
		return
	fi
	operatingSystem="unknown"
	os=`uname | tr [a-z] [A-Z]`
	case "${os}" in
		CYGWIN*)
			operatingSystem="cygwin"
			;;
		LINUX*)
			operatingSystem="linux"
			;;
		MINGW*)
			operatingSystem="mingw"
			;;
	esac
	echo "operatingSystem=$operatingSystem (used to check for Cygwin and filemode compatibility)"
}

# Check the source files for issues
# - the main issue is internal links need to use [](file.md), not [](file)
checkSourceDocs() {
	# Currently don't do anything but could check the above
	# Need one line to not cause an error
	:
}

# Main entry into script

# Check the operating system
checkOperatingSystem

# Make sure the MkDocs version is OK
checkMkdocsVersion

# Check the source files for issues
checkSourceDocs

# Set --dryrun to test before actually doing
dryrun=""
#dryrun="--dryrun"
s3Folder="s3://learn.openwaterfoundation.org/cdss-app-statemod-fortran-doc-user"

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

cd ../../mkdocs-project;
if [ "$operatingSystem" = "mingw" ]; then
	# Use the Windows Python with Git Bash
	py -m mkdocs build --clean
else
	# General case
	mkdocs build --clean
fi

# Now sync the local files up to Amazon S3
# - check for known locations of aws script and default to simple "aws" to be found in PATH
awsScript="$HOME/AppData/Local/Programs/Python/Python37/Scripts/aws"
if [ -e "$awsScript" ]; then
	echo "Trying to run found existing aws script:  $awsScript"
else
	echo "Trying to run aws script using PATH"
	awsScript="aws"
fi
# Try running the script
$awsScript s3 sync site ${s3Folder} ${dryrun} --delete --profile "$awsProfile"

cd ../build-util/old-build-util
