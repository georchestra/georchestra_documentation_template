# Configuring a ReadTheDocs Project

## Python Requirements

They will be picked up by the ReadTheDocs compiler, so make sure to keep them up-to-date!

## Adding a `.readthedocs.yaml` Configuration File

**In the `docs` directory, create a `.readthedocs.yaml` file.** The settings in this file will be used for the compilation on Read The Docs (RTD).

```yaml
# .readthedocs.yaml
# Read the Docs configuration file
# See https://docs.readthedocs.io/en/stable/config-file/v2.html for details

# Required
version: 2

# Set the version of Python and other tools you might need
build:
  os: ubuntu-22.04
  tools:
    python: "3.11"

mkdocs:
  configuration: mkdocs.yml

# Optionally declare the Python requirements required to build your docs
python:
   install:
   - requirements: mkdocs_requirements.txt
```

## Managing a Read The Docs (RTD) documenation project

All geOrchestra's RTD documenation projects are managed by the PSC. Bonus RTD accounts can be set on a a project to help maintening.

### Creating a New RTD Project

* Go to the page [https://app.readthedocs.org/dashboard/](https://app.readthedocs.org/dashboard/).
* Click on `+ Add Project`.
* Click the `Configure manually` button then click on the "Continue" button.
* Enter a name/code for the product that follows the geOrchestra documentation project naming rules:
  * All names should start with `georchestra-` followed by the product name, separated by a hyphen. Example: `georchestra-cadastrapp`
  * If it’s a plugin for a product, name it according to this example: `georchestra-mapstore2-urbanisme`
* Paste the URL of the repository hosted on GitHub (or another online repository) ending by ".git".
* **IMPORTANT** Manually specify the default branch name for the project: `master` for older projects, `main` for recent ones.
* click on the "Next" button
* "Add a configuration file to your project" section : click on "This file exists". we will change the default path later.
* click on "Next"

At this stage the documentation is set but we have to change some settings. You can see a build on the "stable" version is running immediatly.

* click on the setting of the project
* set the Path to the .readthedocs.yaml file to `docs/.readthedocs.yaml`
* Save


### Manage versions

By default, RTD sets 2 versions :
* latest
* stable

We want to keep only the "latest" version.

* check at the "stable" version that is automatically set. On the right the three horizontal points, choose in the admin sub-menu : "Configure version". Then : disable this version. 

* If the very first build of the version "latest" failed, you can relaunch a build. After the first build, access to the documentation to test it.


### configure an "intégration" / webhook interaction with Github

Setting up a webhook is necessary if you want an automatic build for every commit on a specific branch.

[https://docs.readthedocs.io/en/latest/integrations.html](https://docs.readthedocs.io/en/latest/integrations.html)

* On the project page, at the top, click on `Admin`.
* In the left sidebar, choose `Integrations`.
* A `GitHub Incoming Webhook` is created automatically. However, at this stage, it is inactive due to permissions on GitHub (unless authenticated via GitHub on RTD).
* Copy the URL link.
* Go to the GitHub project page.
* Navigate to Settings > Webhooks.
* Click on the `Add webhook` button.
* Paste the URL in `Payload URL`.
* Content type: `application/json`.
* Secret: copy-paste the code.
* Check the option `Let me select individual events.` and choose:
  * Pull requests
  * Pushes
  * Releases
* Finally, at the bottom, click on the `Add webhook` button.

To test if the webhook is working for the selected events, simply modify a file and push the change to GitHub. If `Pushes` was selected, then, on the RTD site, check the `Builds` tab to see if a build is in progress.


## Add a redirection to the nginx docs.georchestra.org configuration

Contact a PSC member and ask her/him to add a redirection in the nginx config file of the documentation website.

The nginx is in the front.georchestra.org proxmox container.


## Add a section to the documentation page of the website

Clone the https://github.com/georchestra/georchestra.github.io project

Edit this pages :
* documentation.md
* fr/documentation.md
* es/documentation.md

Git push or do a pull request.
