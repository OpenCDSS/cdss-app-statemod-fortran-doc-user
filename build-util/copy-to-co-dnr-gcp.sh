#!/bin/sh
#
# Copy the MkDocs site/* contents to the CO DNR GCP website
# - replace all the files on the web with local files

# Supporting functions

# Print the usage
printUsage() {
	echo ""
	echo "Usage:  $0"
	echo ""
	echo "Copy the site files to the latest website folder if -l specified:  $gsFolderLatest"
	echo "Copy the site files to the versioned website folder:  $gsFolderVersion"
	echo ""
	echo "-d dry run (print actions but don't execute upload)"
	echo "-h print usage"
	echo "-l copy to latest folder in addition to auto-detected version folder"
	echo ""
}

# Entry point for the script

# Get the location where this script is located since it may have been run from any folder
scriptFolder=`cd $(dirname "$0") && pwd`
gitRepoFolder=$(dirname "$scriptFolder")
gitReposFolder=$(dirname "$gitRepoFolder")
mkdocsProjectFolder=$gitRepoFolder/mkdocs-project
siteFolder=$mkdocsProjectFolder/site
projectFolder="$gitReposFolder/cdss-app-statemod-fortran"
srcFolder="$projectFolder/src"
srcMainFolder="${srcFolder}/main/fortran"
statemFile="${srcMainFolder}/statem.for"
if [ -f "${statemFile}" ]; then
	statemodVersion=$(cat ${statemFile} | grep 'ver =' | grep -v 'xx' | cut -d '=' -f 2 | sed "s/'//g" | tr -d ' ')
else
	echo "Cannot determine StateMod version because file not found:  ${statemFile}"
	exit 1
fi
if [ -z "${statemodVersion}" ]; then
	echo "Cannot determine StateMod version by scanning:  ${statemFile}"
	exit 1
fi
echo "scriptFolder=$scriptFolder"
echo "gitRepoFolder=$gitRepoFolder"
echo "gitReposFolder=$gitReposFolder"
echo "mkdocsProjectFolder=$mkdocsProjectFolder"
echo "projectFolder=$projectFolder"
echo "srcFolder=$srcFolder"
echo "srcMainFolder=$srcMainFolder"
echo "statemFile=$statemFile"
echo "statemodVersion=$statemodVersion"

# Set --dryrun to test before actually doing
dryrun=""
gsFolderLatest="gs://static-cdss-state-co-us/statemod/latest/doc-user"
gsFolderVersion="gs://static-cdss-state-co-us/statemod/${statemodVersion}/doc-user"

# Whether to copy to latest in addition to the specific version
# - default to no because the script can be run on any version, and can't assume latest
copyToLatest="no"

# Parse the command parameters
while getopts :dhl opt; do
	#echo "Command line option is ${opt}"
	case $opt in
		d) # Indicate that this should be copied to the latest release and version
			dryrun="-n"
			;;
		h) # Usage
			printUsage
			exit 0
			;;
		l) # Indicate that this should be copied to the latest release and version
			copyToLatest="yes"
			;;
		\?)
			echo "Invalid option:  -$OPTARG" >&2
			exit 1
			;;
		:)
			echo "Option -$OPTARG requires an argument" >&2
			exit 1
			;;
	esac
done

# Make sure that this is being run from the build-util folder
pwd=`pwd`
dirname=`basename ${pwd}`
if [ ! ${dirname} = "build-util" ]; then
	echo "Must run from build-util folder"
	exit 1
fi

# First build the site so that the "site" folder contains current content.
# - "mkdocs serve" does not do this

cd ${mkdocsProjectFolder}; mkdocs build --clean; cd ${scriptFolder}

# Now sync the local files up to Google Cloud
# - the -m option causes operations to run in parallel, which can be much faster
# - the -d option means delete extra files in destination
# - the -r option means recursive to sync the whole folder tree
# For now always upload to the versioned copy
echo ""
echo "Copying the documentation to the versioned folder..."
gsutil.cmd -m rsync -d -r ${dryrun} $siteFolder ${gsFolderVersion}
if [ ${copyToLatest} = "yes" ]; then
	# Also copy the latest
	echo ""
	echo 'Copying the documentation to the "latest" folder...'
	gsutil.cmd -m rsync -d -r ${dryrun} $siteFolder ${gsFolderLatest}
else
	echo ""
	echo 'Remember to run with -l option if you want to upload to the "latest" folder.'
	echo ""
fi

exit $?
