# cdss-app-statemod-fortran-doc-user #

This repository contains [Colorado's Decision Support Systems (CDSS)](http://cdss.state.co.us/Pages/CDSSHome.aspx) StateMod user documentation.
See the following online resources:

* [OpenCDSS](http://learn.openwaterfoundation.org/cdss-website-opencdss/)
* Deployed [StateMod User Documentation](http://learn.openwaterfoundation.org/cdss-app-statemod-fortran-doc-user/)

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
cdss-app-statemod-fortran-doc-user/  Repository name and main folder.
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
/home/user/                                  Linux user home folder.
  cdss-dev/                                  Projects that are part of Colorado's Decision Support Systems.
    StateMod/                                StateMod product folder.
      git-repos/                             Git repositories for StateMod.
        cdss-app-statemod-fortran/           StateMod source code development.
        cdss-app-statemod-fortran-doc-dev/   StateMod develpoer documentation.
        cdss-app-statemod-fortran-doc-user/  StateMod user documentation.
        cdss-app-statemod-fortran-test/      StateMod automated tests.
```

## Development Environment ##

The development environment for contributing to this project requires installation of Python, MkDocs, and Material MkDocs theme.
Python 2 has been used for development.
See the [OWF / Learn MkDocs](http://learn.openwaterfoundation.org/owf-learn-mkdocs/)
documentation for information about installing these tools.

The development environment will change as the developers upgrade to newer versions of software tools.

## Editing and Viewing Content ##

If the development environment is properly configured, edit and view content as follows:

1. Edit content in the `mkdocs-project/docs` folder and update `mkdocs-project/mkdocs.yml` as appropriate.
2. Run the `build-util/run-mkdocs-serve-8000.sh` script (Cygwin, Linux) or equivalent.
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
* Place images in a folder with the same name as the content file and include `-images` at the end of the folder name.
* Minimize the use of inlined HTML, but use it where Markdown formatting is limited.
* Although the Material them provides site and page navigation sidebars,
provide in-line table of contents on pages, where appropriate, to facilitate review of page content.

## License ##

The license for this documentation is being determined.
The Open Water Foundation consulting team has recommended using the
[Creative Commons Attribution 2-0 Generic (CC BY 2.0) License](https://creativecommons.org/licenses/by/2.0/).

## Contributing ##

Contribute to the documentation as follows:

1. Use GitHub repository issues to report minor issues.
2. Use GitHub pull requests.

## Maintainers ##

This repository is maintained by the OpenCDSS team.

## Release Notes ##

The following release notes indicate the update history for documentation, with GitHub repository issue indicated,

* 2018-08-06 - Initial content released.
