# build-util #

This folder contains useful scripts for viewing and deploying the static website.
The scripts should be run from Git Bash and assume that a Python/MkDocs environment is configured.

* `copy-to-co-dnr-gcp.sh` - build site and copy `site` files to CO DNR GCP static website
* `run-mkdocs-serve-8000.sh` - run `mkdocs serve` to view the website

The following old scripts are retained during transition and may be useful for reference:

* `copy-to-owf-amazon-s3.bat` - build site and copy `site` files to Open Water Foundation Amazon S3
static website, used before CO DNR website was available (run from Windows command prompt)
* `copy-to-owf-amazon-s3.sh` - build site and copy `site` files to Open Water Foundation Amazon S3
static website, used before CO DNR website was available (run from Git Bash)
