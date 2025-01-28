# Maintenir / Mettre à niveau votre documentation

Le template / modèle de documentation de georchestra est susceptible d'évoluer. Afin de maintenir toute la documentation au même niveau de fonctionnalités ou de personnalisation graphiques, il est essentiel de penser à mettre à niveau votre documentation.

Ce guide vous explique comment procéder.


## Mettre à jour le dépôt `georchestra_documentation_template`

Ouvrir un terminal à la racine de votre clone local du dépôt `georchestra_documentation_template`, puis :

- vérifier qu'il n'y a pas eu de modification intempestive : `git status`
- si c'est le cas : `git reset --hard HEAD`
- ensuite, on rafraîchit son clone local : `git pull` (en mode rebase)


## Mettre à jour l'environnement Python

- aller à la racine de votre projet.
- supprimer le répertoire `docs_modules`
- copier le répertoire `docs_modules` depuis votre clone local du dépôt `georchestra_documentation_template` dans le répertoire de votre projet
- lancer une session Python : `source venv_mkdocs/Scripts/activate`
- on met à jour les libraires python : 
  - en utilisant les wheels : `python -m pip install --trusted-host pypi.org docs_modules/3.9_windows/*.whl`
  - ou en utilisant le fichier `mkdocs_requirements.txt` : `pip install -r mkdocs_requirements.txt`
- si tout est ok, on vérifie la version de MkDocs : `mkdocs –-version`


## Prévisualiser la documentation

Dans le terminal faire un `mkdocs serve` et ouvrir un navigateur sur [http://localhost:8000/](http://localhost:8000/).


