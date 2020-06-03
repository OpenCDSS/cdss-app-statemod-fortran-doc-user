# cdss-app-statemod-fortran-doc-user #

This repository contains [Colorado's Decision Support Systems (CDSS)](https://www.colorado.gov/cdss) StateMod user documentation.
See the following online resources:

* [OpenCDSS Documentation](http://opencdss.state.co.us/opencdss/)
* [StateMod User Documentation](http://opencdss.state.co.us/statemod/latest/doc-user/)
* [StateMod Developer Documentation](http://opencdss.state.co.us/statemod/latest/doc-dev/)

This page contains the following sections:

* [Repository Contents](#repository-contents)
* [Development Environment](#development-environment)
* [Editing and Viewing Content](#editing-and-viewing-content)
* [Style Guide](#style-guide)
* [License](#license)
* [Contributing](#contributing)
* [Maintainers](#maintainers)
* [Release Notes](#release-notes)

-----------------

## Repository Contents ##

The repository contains the following:

```text
cdss-app-statemod-fortran-doc-user/  Repository name and main folder should match.
  build-util/                        Useful scripts to view, build, and deploy documentation.
  mkdocs-project/                    Typical MkDocs project for this documentation.
    mkdocs.yml                       MkDocs configuration file for website.
    docs/                            Folder containing source Markdown and other files for website.
    site/                            Folder created by MkDocs containing the static website - ignored using .gitignore.
  .github/                           Files specific to GitHub such as issue template.
  .gitattributes                     Typical Git configuration file for repository attributes.
  .gitignore                         Typical Git configuration file for ignored file list.
  README.md                          This file.

```

The following folder structure is recommended for StateMod development.
Top-level folders should be created as necessary.
Repositories are expected to be on the same folder level to allow scripts in those repositories to work.

```
C:\Users\user\                               Windows user home folder.
/c/Users/user/                               Git Bash user home folder that overlaps Windows files.
/home/user/                                  Linux user home folder.
/cygdrive/C/Users/user/                      Cygwin user home folder that overlaps Windows files.
  cdss-dev/                                  Projects that are part of Colorado's Decision Support Systems.
    StateMod/                                StateMod product folder.
---------- folder names below here must match -----------------------
      git-repos/                             Git repositories for StateMod.
        cdss-app-statemod-fortran/           StateMod source code development.
        cdss-app-statemod-fortran-doc-dev/   StateMod developer documentation.
        cdss-app-statemod-fortran-doc-user/  StateMod user documentation.
        cdss-app-statemod-fortran-test/      StateMod automated tests.
```

## Development Environment ##

The development environment for contributing to this project requires installation of Python, MkDocs, and Material MkDocs theme.
Python 3 has been used for development.
See the [MkDocs website](https://www.mkdocs.org/) and
[OWF / Learn MkDocs](http://learn.openwaterfoundation.org/owf-learn-mkdocs/)
documentation for information about installing these tools.

## Editing and Viewing Content ##

If the development environment is properly configured, edit and view content as follows:

1. Edit content:
    1. The `mkdocs-project/docs` folder contains website content.
    2. The `mkdocs-project/mkdocs.yml` file lists files to include in the website.
2. Run the `build-util/run-mkdocs-serve-8000.sh` script (Git Bash, Cygwin, Linux).
3. View content in a web browser using URL `http://localhost:8000`.

## Style Guide ##

The following are general style guide recommendations for this documentation,
with the goal of keeping formatting simple in favor of focusing on useful content:

* Use the Material MkDocs theme - it looks nice, provides good navigation features, and enables search.
* Follow MkDocs Markdown standards - use extensions beyond basic Markdown when useful.
* Show files and program names as `code (tick-surrounded)` formatting.
* Where a source file can be linked to in GitHub, provide a link so that the most current file can be viewed.
* Use triple-tick formatting for code blocks, with language specifier.
* Use ***bold italics*** when referencing UI components such as menus.
* Use slashes to indicate ***Menu / SubMenu***.
* Place images in a an `images` folder or `contentpage-images` folder if need to separate images.
* Minimize the use of inlined HTML, but use it where Markdown formatting is limited.
* Although the Material them provides site and page navigation sidebars,
provide in-line table of contents on pages, where appropriate, to facilitate review of page content.

## License ##

The license for this documentation is the
[Creative Commons Attribution 2-0 Generic (CC BY 4.0) License](https://creativecommons.org/licenses/by/4.0/).

## Contributing ##

Contribute to the documentation as follows:

1. Use GitHub repository issues to report minor issues.
2. Use GitHub pull requests.

In order to contribute, you must first sign and submit the Contributor License Agreement (CLA).
**Need to add the link here to OpenCDSS web page that describes this.**

## Maintainers ##

This repository is maintained by the OpenCDSS team.

## Release Notes ##

The following release notes indicate major updates for documentation.
See also the GitHub issues for details.

* 2020-06-03 - Finished porting legacy .pdf documentation to MKDocs. Uploading to CDSS website.
* 2019-04-26 - Update to use opencdss.state.co.us.
* 2019-03-23 - Update to MkDocs 1.04.
* 2018-12-02 - Transfer repository from Open Water Foundation to OpenCDSS GitHub account
and update for full open source release.
* 2018-08-07 - Update with latest StateMod documentation, relatively minor changes.
* 2018-08-06 - Initial content released.
