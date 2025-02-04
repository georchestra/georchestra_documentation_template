# Configuring a ReadTheDocs Project

## Python Requirements

They will be picked up by the ReadTheDocs compiler, so make sure to keep them up-to-date!

## Adding a `.readthedocs.yaml` Configuration File

In the `docs` directory, create a `.readthedocs.yaml` file. The settings in this file will be used for the compilation on Read The Docs (RTD).

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
    python: "3.9"

mkdocs:
  configuration: mkdocs.yml

# Optionally declare the Python requirements required to build your docs
python:
   install:
   - requirements: mkdocs_requirements.txt
```

## Creating a New RTD Project

* Go to the page [https://readthedocs.org/dashboard/](https://readthedocs.org/dashboard/).
* Click on `Import a project`.
* Click the `Import manually` button.
* Enter a name/code for the product that follows the geOrchestra documentation project naming rules:
  * All names should start with `georchestra` followed by the product name, separated by a hyphen. Example: `georchestra-cadastrapp`
  * If it’s a plugin for a product, name it according to this example: `georchestra-mapstore2-urbanisme`
* Paste the URL of the repository hosted on GitHub (or another online repository).
* **IMPORTANT** Manually specify the default branch name for the project: `master` for older projects, `main` for recent ones.
* Check the box `Edit project’s advanced options`.
* Documentation type: `Mkdocs`.
* Language: `French`.
* Click on `Finish` => the RTD project is created.

At this stage: test a compilation.
If it passes: you can manually trigger a documentation build.

## Building a Release

TODO

## Configuration du webhook

La mise en place d'un webhook est nécessaire si on souhaite une compilation automatique à chaque commit sur une branche spécifique.


[https://docs.readthedocs.io/en/latest/integrations.html](https://docs.readthedocs.io/en/latest/integrations.html)

* Sur la page du projet, en haut, cliquer sur `Admin`.
* Dans les onglets / rubriques de gauche, choisir `Intégrations`.
* Un `Webhook entrant de Github` a été créé automatiquement. Mais à ce stade il est inopérant à cause des permissions sur Github (sauf en cas d'authentification via Github sur RTD).
* Copier l'URL du lien
* Allez sur la page Github du projet
* Allez dans Settings > Webhooks
* Cliquer sur le bouton `Add webhook`
* Coller l'URL dans `Payload URL`
* Content type : `application/json`
* Secret : copier-coller le code
* Cocher l'option `Let me select individual events.` Et choisir :
  * Pull requests
  * Pushes
  * Releases
* Pour finir, tout en bas, appuyer sur le bouton `Add webhook`

Pour tester si le webhooks fonctionne sur les évènements sélectionnés il suffit de modifier un fichier puis de pousser la modification sur github. Si `Pushes` a été sélectionné, alors, sur le site RTD, vérifier sur l'onglet `Compilations` si une compilation est en cours.

