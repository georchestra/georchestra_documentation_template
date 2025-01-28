# Ré-utiliser ce modèle

## Cloner ce dépôt de code

### En ligne de commande

```bash
git clone https://github.com/georchestra/georchestra_documentation_template.git
```

### Avec GitHub Desktop

- file > Clone repository
- onglet `URL`
- coller `https://github.com/georchestra/georchestra_documentation_template/`
- choisir un répertoire local particulier (avec la possibilité de mettre un nom particulier), sinon laisser par défaut
- cliquer sur le bouton "Clone"


## Importer dans votre projet

Copier les éléments suivants à la racine de votre projet / votre produit georchestra :

- le répertoire `docs`
- le répertoire `docs_modules`
- le fichier de configuration de la documentation `mkdocs.yml`
- le fichier de configuration de compilation de documentation pour ReadTheDocs `.readthedocs.yaml`
- le fichier `mkdocs_requirements.txt` pour l'installation de MkDocs sous Python 3.9


## Modifier le .gitignore de votre projet

Modifier le fichier `.gitignore` pour rajouter les exclusions ci-dessous. Indispensable pour ne pas commiter des fichiers temporaires comme le fichier `docs/tableofcontent.md` qui est un fichier généré à chaque build de la documentation.

```
# documentation MkDocs
venv_mkdocs/
.venv_mkdocs/
docs_modules/
docs/tableofcontent.md
```


## Installation de MkDocs dans votre projet


### Création et activation d'un environnement virtuel Python

Il faut mettre en place un virtualenv Python propre à MkDocs.


#### Sous Linux

Ouvrir un terminal à la racine de votre projet, puis :

```bash
python -m venv venv_mkdocs
source venv_mkdocs/bin/activate
```

#### Sous Windows

Utiliser un terminal bash, type git-bash, à la racine de votre projet, puis :

```bash
python -m venv venv_mkdocs
source venv_mkdocs/Scripts/activate
```


### Installer les modules Python requis 

MkDocs est un module python. Notre template de documentation fait également appel à des modules complémentaires.

Il y a 3 possibilité pour installer ces modules et toutes leurs dépendances.


#### utiliser les requirements

C'est la meilleure méthode car elle permet de s'assurer que l'on travaille tous sur les mêmes versions. Mais il ne faut pas être bridé au niveau de l'accès à internet.

```bash
pip install -r mkdocs_requirements.txt
```


#### fresh install

Installation des dernières versions disponibles :

```bash
pip install mkdocs mkdocs-toc-md html5lib mkdocs-material mkdocs-callouts mkdocs-git-revision-date-localized-plugin
```

#### Utiliser les wheels

Si vous êtes dans un environnement réseau restreint / sans accès à internet et sous Windows (désolé…), utilisez les wheels disponibles : `python -m pip install --trusted-host pypi.org modules/3.9_windows/*.whl`.



### Vérifier que MkDocs est installé

`mkdocs --version` devrait logiquement afficher : `mkdocs, version 1.4.2`



## Prévisualiser la documentation

MkDocs embarque tout le système de compilation des fichiers source de votre documentation et permet surtout une prévisualisation à la volée à chaque modification de vos fichiers. 

Dans le terminal faire un `mkdocs serve` et ouvrir un navigateur sur [http://localhost:8000/](http://localhost:8000/).

Vous verrez le template vierge.

Il ne reste plus qu'à l'adapter à votre produit.



## Modifier la configuration MkDocs pour votre projet

Ouvrir le fichier `mkdocs.yml` et modifier :

### Généralités

`repo_url`

URL complète vers le dépôt de code de votre produit. Exemple : `https://github.com/georchestra/cadastrapp`.


`repo_name`

Mettre le nom de code de votre produit.

**Dans un souci de cohérence et d'organisation sur ReadTheDocs, nommer selon ce motif : `georchestra-{produit}-{plugin}`**. Exemple : `georchestra-mapstore2-urbanisme`, `georchestra-cadastrapp`.


### plugins

Pour désactiver des plugins / fonctionnalités (non recommandé), il suffit de commenter les lignes avec un `#`.



## Gestion de la navigation

TODO
