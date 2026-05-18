# Maintenir / Mettre à jour votre documentation

Le modèle de documentation geOrchestra peut évoluer. Pour conserver toutes les documentations au même niveau de fonctionnalités ou de personnalisation graphique, il est essentiel de penser à mettre à jour votre documentation.

Ce guide explique comment procéder.

## Mettre à jour le dépôt `georchestra_documentation_template`

Ouvrez un terminal à la racine de votre clone local du dépôt `georchestra_documentation_template`, puis :

- Vérifiez l'absence de modifications non souhaitées : `git status`
- S'il y en a : `git reset --hard HEAD`
- Puis mettez à jour votre clone local : `git pull` en mode rebase

## Mettre à jour l'environnement Python

- Placez-vous à la racine de votre projet.
- Supprimez le répertoire `docs_modules`.
- Copiez le répertoire `docs_modules` depuis votre clone local du dépôt `georchestra_documentation_template` vers le répertoire de votre projet.
- Démarrez une session Python : `source venv_mkdocs/Scripts/activate`
- Mettez à jour les bibliothèques Python :
- En utilisant les wheels : `python -m pip install --trusted-host pypi.org docs_modules/3.9_windows/*.whl`
- Ou avec le fichier `mkdocs_requirements.txt` : `pip install -r mkdocs_requirements.txt`
- Si tout se passe bien, vérifiez la version de MkDocs : `mkdocs --version`

## Prévisualiser la documentation

Exécutez `mkdocs serve` dans le terminal puis ouvrez un navigateur à l'adresse [http://localhost:8000/](http://localhost:8000/).
