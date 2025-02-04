# Reusing This Template

## Clone This Code Repository

### Using the Command Line

```bash
git clone https://github.com/georchestra/georchestra_documentation_template.git
```

### Using GitHub Desktop

- Go to **File > Clone repository**
- Select the **URL** tab
- Paste `https://github.com/georchestra/georchestra_documentation_template/`
- Choose a specific local directory (or leave it as default)
- Click the **Clone** button

## Import into Your Project

Copy the following elements to the root of your georchestra project/product:

- The `docs` directory
- The `docs_modules` directory
- The documentation configuration file `mkdocs.yml`
- The ReadTheDocs documentation compilation configuration file `.readthedocs.yaml`
- The `mkdocs_requirements.txt` file for installing MkDocs under Python 3.9

## Modify Your Project's .gitignore

Modify the `.gitignore` file to add the exclusions below. This is essential to avoid committing temporary files such as `docs/tableofcontent.md`, which is generated at each documentation build.

```
# MkDocs documentation
venv_mkdocs/
.venv_mkdocs/
docs_modules/
docs/tableofcontent.md
```

## Install MkDocs in Your Project

### Creating and Activating a Python Virtual Environment

You need to set up a Python virtual environment specific to MkDocs.

#### On Linux

Open a terminal at the root of your project, then run:

```bash
python -m venv venv_mkdocs
source venv_mkdocs/bin/activate
```

#### On Windows

Use a Bash terminal (such as Git Bash) at the root of your project, then run:

```bash
python -m venv venv_mkdocs
source venv_mkdocs/Scripts/activate
```

### Install the Required Python Modules

MkDocs is a Python module. Our documentation template also relies on additional modules.

There are three ways to install these modules and their dependencies:

#### Using Requirements (Recommended)

This is the best method because it ensures that everyone works with the same versions. However, it requires unrestricted internet access.

```bash
pip install -r mkdocs_requirements.txt
```

#### Fresh Install

Install the latest available versions:

```bash
pip install mkdocs mkdocs-toc-md html5lib mkdocs-material mkdocs-callouts mkdocs-git-revision-date-localized-plugin
```

#### Using Wheels

If you are in a restricted network environment without internet access and using Windows, install using the available wheel files:

```bash
python -m pip install --trusted-host pypi.org modules/3.9_windows/*.whl
```

### Verify MkDocs Installation

Running `mkdocs --version` should display something like: `mkdocs, version 1.4.2`

## Preview the Documentation

MkDocs includes a complete system for compiling your documentation source files and allows real-time previewing with every modification.

Run `mkdocs serve` in the terminal and open a browser at [http://localhost:8000/](http://localhost:8000/).

You will see the blank template. Now, you just need to adapt it to your product.

## Modify the MkDocs Configuration for Your Project

Open the `mkdocs.yml` file and edit the following:

### General Settings

**`repo_url`**  
The full URL to your product's code repository. Example: `https://github.com/georchestra/cadastrapp`.

**`repo_name`**  
Enter the code name of your product.

*For consistency and organization on ReadTheDocs, use the following naming convention: `georchestra-{product}-{plugin}`*.  
Example: `georchestra-mapstore2-urbanisme`, `georchestra-cadastrapp`.

### Plugins

To disable plugins/features (not recommended), simply comment out the lines with `#`.

## Navigation Management

TODO