# Configurer un projet ReadTheDocs

## Prérequis Python

Ils seront pris en compte par le compilateur ReadTheDocs, donc assurez-vous de les garder à jour.

## Ajouter un fichier de configuration `.readthedocs.yaml`

**À la racine du projet, créez un fichier `.readthedocs.yaml`.** Les paramètres de ce fichier seront utilisés pour la compilation sur Read the Docs (RTD).

```yaml
# .readthedocs.yaml
# Fichier de configuration Read the Docs
# Voir https://docs.readthedocs.io/en/stable/config-file/v2.html pour les détails

# Requis
version: 2

# Définir la version de Python et les autres outils nécessaires
build:
  os: ubuntu-22.04
  tools:
    python: "3.11"

mkdocs:
  configuration: mkdocs.yml

# Déclarer éventuellement les dépendances Python nécessaires à la compilation
python:
   install:
   - requirements: mkdocs_requirements.txt
```

## Créer un nouveau projet RTD

- Rendez-vous sur la page [https://readthedocs.org/dashboard/](https://readthedocs.org/dashboard/).
- Cliquez sur `Import a project`.
- Cliquez sur le bouton `Import manually`.
- Saisissez un nom/code pour le produit qui respecte les règles de nommage des projets de documentation geOrchestra :
- Tous les noms doivent commencer par `georchestra` suivi du nom du produit, séparé par un tiret. Exemple : `georchestra-cadastrapp`
- S'il s'agit d'un plugin d'un produit, nommez-le selon cet exemple : `georchestra-mapstore2-urbanisme`
- Collez l'URL du dépôt hébergé sur GitHub, ou sur un autre dépôt en ligne.
- **IMPORTANT** Indiquez manuellement le nom de la branche par défaut du projet : `master` pour les anciens projets, `main` pour les plus récents.
- Cochez la case `Edit project’s advanced options`.
- Type de documentation : `Mkdocs`.
- Langue : `French`.
- Cliquez sur `Finish` : le projet RTD est créé.

À ce stade, testez une compilation. Si elle passe, vous pourrez déclencher manuellement une construction de la documentation.

## Construire une release

TODO

## Configurer le webhook

La mise en place d'un webhook est nécessaire si vous souhaitez une compilation automatique à chaque commit sur une branche donnée.

[https://docs.readthedocs.io/en/latest/integrations.html](https://docs.readthedocs.io/en/latest/integrations.html)

- Sur la page du projet, en haut, cliquez sur `Admin`.
- Dans la barre latérale gauche, choisissez `Integrations`.
- Un `GitHub Incoming Webhook` est créé automatiquement. Cependant, à ce stade, il est inactif en raison des permissions GitHub, sauf si l'authentification RTD se fait via GitHub.
- Copiez l'URL.
- Allez sur la page du projet GitHub.
- Naviguez vers Settings > Webhooks.
- Cliquez sur le bouton `Add webhook`.
- Collez l'URL dans `Payload URL`.
- Type de contenu : `application/json`.
- Secret : copiez-collez le code.
- Cochez l'option `Let me select individual events.` puis choisissez :
- Pull requests
- Pushes
- Releases
- Enfin, en bas, cliquez sur le bouton `Add webhook`.

Pour tester le bon fonctionnement du webhook sur les événements sélectionnés, modifiez simplement un fichier et poussez le changement sur GitHub. Si `Pushes` a été sélectionné, vérifiez dans l'onglet `Builds` du site RTD si une compilation est en cours.
