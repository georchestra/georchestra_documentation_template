# Installation and Configuration of MkDocs

## Prerequisites

- Python 3.9 (preferred) or 3.10.
- A bash terminal: Linux system terminal or Git Bash on Windows.

## Creating and Activating a Python Virtual Environment

You need to set up a dedicated Python virtual environment for MkDocs.

### On Linux


```bash
python -m venv venv_mkdocs
source venv_mkdocs/bin/activate
```
### On Windows

Use a bash terminal, such as Git Bash.

```bash
python -m venv venv_mkdocs
source venv_mkdocs/Scripts/activate
```
## Install the Required Python Modules

MkDocs is a Python module. Our documentation template also uses additional modules.

There are 3 options to install these modules.

### Use the requirements

This is the best method as it ensures that everyone is working with the same versions.
```bash
pip install -r mkdocs_requirements.txt
```

To verify :

`mkdocs --version` ==> `mkdocs, version 1.4.2`

### Fresh Install

Install the latest available versions:

```bash
pip install mkdocs mkdocs-toc-md html5lib mkdocs-material mkdocs-callouts mkdocs-git-revision-date-localized-plugin
```
### Use the Wheels

If you are in a restricted network environment / without internet access and using Windows (sorry…), use the available wheels: `python -m pip install --trusted-host pypi.org modules/3.9_windows/*.whl`.

### Configure the Versions

You can modify the [docs/versions.json](docs/versions.json) file according to the different versions of your application.

You also need to edit the first line of the [docs/assets/custom_version.js](docs/assets/custom_versions.js) file as shown below:
```
var url_project = "georchestratdocumentation-test.readthedocs.io"
```
Will become:
```
var url_project = "votreurldocumentation.readthedocs.io"
```