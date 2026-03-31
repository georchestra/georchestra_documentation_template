# Reusing This Template

**Prerequisites**

- Python 3.11
- A bash terminal: Linux system terminal or Git Bash on Windows

## Solution 1 - Clone This Code Repository

### Using the Command Line

```bash
git clone https://github.com/georchestra/georchestra_documentation_template.git
```

### Using GitHub Desktop

- Go to **File > Clone repository**
- Select the **URL** tab
- Paste `https://github.com/georchestra/georchestra_documentation_template/`
- Choose a specific local directory, or leave the default one
- Click the **Clone** button

## Solution 2 - Import into Your Project

### Import via a script

Initialize a project documentation from this template with the provided scripts:

- Linux or macOS: run `./init_doc_from_template.sh` from the root of the target project.
- Windows: run `powershell -ExecutionPolicy Bypass -File .\init_doc_from_template_windows.ps1` from the root of the target project.
- The scripts clone the latest version of this template, create `docs/`, copy `mkdocs.yml`, `mkdocs_requirements.txt`, `readthedocs_EN.md`, `readthedocs_FR.md`, `mkdocs_installation.sh` and `mkdocs_run.sh`, then install MkDocs dependencies and start `mkdocs serve`.
- If `docs/` already exists in the target project, the initialization stops immediately without making any changes.

Use these scripts only in a project repository that does not already contain a `docs/` directory.

### Manual import

Copy the following items to the root of your geOrchestra project or product:

- The `docs` directory
- The `docs_modules` directory
- The documentation configuration file `mkdocs.yml`
- The ReadTheDocs build configuration file `.readthedocs.yaml`
- The `mkdocs_requirements.txt` file used to install MkDocs with Python 3.9

## Update Your Project's `.gitignore`

Modify the `.gitignore` file to add the exclusions below. This is essential to avoid committing temporary files such as `docs/tableofcontent.md`, which is generated at each documentation build.

```text
# MkDocs documentation
venv_mkdocs/
.venv_mkdocs/
docs_modules/
docs/tableofcontent.md
```

## Install MkDocs in Your Project

### Via script

Simply run:

`bash mkdocs_installation.sh` and trust the template maintainers.

### Manual installation

Install the latest available versions:

```bash
pip install mkdocs mkdocs-toc-md mkdocs-material mkdocs-callouts mkdocs-git-revision-date-localized-plugin
```

### Verify the MkDocs installation

Running `mkdocs --version` should display something like: `mkdocs, version 1.6.1`

## Preview the Documentation

MkDocs includes a complete system for compiling your documentation source files and allows real-time previewing after each modification.

Run `bash mkdocs_run.sh` in the terminal, then open a browser at [http://localhost:8000/](http://localhost:8000/).

You will see the blank template. You only need to adapt it to your product.

## Update the MkDocs Configuration for Your Project

Open the `mkdocs.yml` file and edit the following:

### General settings

**`repo_url`**  
The full URL of your product's code repository. Example: `https://github.com/georchestra/cadastrapp`.

**`repo_name`**  
Enter the code name of your product.

*For consistency and organization in ReadTheDocs, use the following naming convention: `georchestra-{product}-{plugin}`*.  
Examples: `georchestra-mapstore2-urbanisme`, `georchestra-cadastrapp`.

### Plugins

To disable plugins or features, which is not recommended, simply comment out the lines with `#`.

## Navigation Management

The documentation navigation is managed in the `mkdocs.yml` file, inside the `nav:` block.

It is usually built on two levels:

- main sections displayed in the top navigation bar;
- pages and subsections displayed in the left navigation menu.

In this template, navigation entries are declared manually. You therefore need to update `nav:` whenever you add, remove or move a page.

Simplified example:

```yaml
nav:
  - Home: index.md
  - User guide:
      - Index: user_guide/index.md
      - Getting started: user_guide/getting_started.md
  - Technical guides:
      - Index: technical_guides/index.md
      - Installation:
          - technical_guides/installation/index.md
          - technical_guides/installation/prerequisites.md
```

Important points:

- The order of items in `nav:` determines the display order in the interface.
- Every important Markdown file should be referenced in `nav:` to appear correctly in the navigation.
- `index.md` pages act as entry pages for a section and integrate well with the `navigation.indexes` feature enabled in this template.
- With the `i18n` plugin, do not put `.fr` or `.en` in the paths declared in `nav:`: the plugin handles language variants for you.

### Hide the navigation on a page

You can hide the side navigation and the table of contents on some pages, for example on the homepage, by adding this block at the top of the Markdown file:

```yaml
---
hide:
  - navigation
  - toc
---
```

### Generate a reusable table of contents

The optional `mkdocs-toc-md` plugin can generate a `docs/tableofcontent.md` file containing a table of contents with links to the documentation pages.

This file is useful for:

- quickly reusing a list of links on a homepage;
- building section indexes without rewriting everything manually.

If you enable this plugin in `mkdocs.yml`, keep `docs/tableofcontent.md` in `.gitignore`, because this file is regenerated at each build.
