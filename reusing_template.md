# Réutiliser ce modèle

**Prérequis**

- Python 3.11
- Un terminal bash : terminal système Linux ou Git Bash sous Windows

## Solution 1 - Cloner ce dépôt de code

### En ligne de commande

```bash
git clone https://github.com/georchestra/georchestra_documentation_template.git
```

### Avec GitHub Desktop

- Aller dans **File > Clone repository**
- Sélectionner l'onglet **URL**
- Coller `https://github.com/georchestra/georchestra_documentation_template/`
- Choisir un répertoire local spécifique (ou conserver celui par défaut)
- Cliquer sur le bouton **Clone**

## Solution 2 - Importer dans votre projet

### Import via un script

Initialiser la documentation d'un projet à partir de ce modèle avec les scripts fournis :

- Linux ou macOS : exécuter `./init_doc_from_template.sh` depuis la racine du projet cible.
- Windows : exécuter `powershell -ExecutionPolicy Bypass -File .\init_doc_from_template_windows.ps1` depuis la racine du projet cible.
- Les scripts clonent la dernière version du modèle, créent `docs/`, copient `mkdocs.yml`, `mkdocs_requirements.txt`, `readthedocs.md`, `mkdocs_installation.sh` et `mkdocs_run.sh`, puis installent les dépendances MkDocs et lancent `mkdocs serve`.
- Si `docs/` existe déjà dans le projet cible, l'initialisation s'arrête immédiatement sans rien modifier.

Utilisez ces scripts uniquement dans le dépôt d'un projet qui ne contient pas déjà de répertoire `docs/`.

### Import manuel

Copiez les éléments suivants à la racine de votre projet/produit geOrchestra :

- Le répertoire `docs`
- Le répertoire `docs_modules`
- Le fichier de configuration de la documentation `mkdocs.yml`
- Le fichier de configuration de compilation ReadTheDocs `.readthedocs.yaml`
- Le fichier `mkdocs_requirements.txt` pour installer MkDocs avec Python 3.9

## Modifier le `.gitignore` de votre projet

Modifiez le fichier `.gitignore` pour y ajouter les exclusions ci-dessous. C'est indispensable pour éviter de versionner des fichiers temporaires comme `docs/tableofcontent.md`, généré à chaque compilation de la documentation.

```text
# MkDocs documentation
venv_mkdocs/
.venv_mkdocs/
docs_modules/
docs/tableofcontent.md
```

## Installer MkDocs dans votre projet

### Par script

Lancez simplement :

`bash mkdocs_installation.sh` et faites confiance aux mainteneurs du modèle.

### Installation manuelle

Installez les dernières versions disponibles :

```bash
pip install mkdocs mkdocs-toc-md mkdocs-material mkdocs-callouts mkdocs-git-revision-date-localized-plugin
```

### Vérifier l'installation de MkDocs

L'exécution de `mkdocs --version` doit afficher quelque chose comme : `mkdocs, version 1.6.1`

## Prévisualiser la documentation

MkDocs intègre un système complet pour compiler les fichiers source de votre documentation et permet une prévisualisation en temps réel à chaque modification.

Exécutez `bash mkdocs_run.sh` dans le terminal puis ouvrez un navigateur à l'adresse [http://localhost:8000/](http://localhost:8000/).

Vous verrez le modèle vide. Il ne vous restera plus qu'à l'adapter à votre produit.

## Modifier la configuration MkDocs pour votre projet

Ouvrez le fichier `mkdocs.yml` et modifiez les éléments suivants :

### Paramètres généraux

**`repo_url`**  
L'URL complète du dépôt de code de votre produit. Exemple : `https://github.com/georchestra/cadastrapp`.

**`repo_name`**  
Saisissez le nom de code de votre produit.

*Pour assurer la cohérence et l'organisation dans ReadTheDocs, utilisez la convention de nommage suivante : `georchestra-{produit}-{plugin}`*.  
Exemples : `georchestra-mapstore2-urbanisme`, `georchestra-cadastrapp`.

### Plugins

Pour désactiver des plugins/fonctionnalités, ce qui n'est pas recommandé, commentez simplement les lignes avec `#`.

## Gestion de la navigation

La navigation de la documentation est pilotée dans le fichier `mkdocs.yml`, dans le bloc `nav:`.

Elle se construit généralement sur deux niveaux :

- des sections principales affichées dans la barre supérieure ;
- des pages et sous-sections affichées dans le menu latéral.

Dans ce modèle, les entrées de navigation sont déclarées manuellement. Vous devez donc mettre à jour `nav:` à chaque ajout, suppression ou déplacement de page.

Exemple simplifié :

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

Quelques points importants :

- L'ordre des éléments dans `nav:` détermine l'ordre d'affichage dans l'interface.
- Chaque fichier Markdown important doit être référencé dans `nav:` pour apparaître correctement dans la navigation.
- Les pages `index.md` servent de pages d'entrée pour une section et s'intègrent bien avec la fonctionnalité `navigation.indexes` activée dans ce modèle.
- Avec le plugin `i18n`, ne mettez pas `.fr` ou `.en` dans les chemins du bloc `nav:` : le plugin gère lui-même les variantes de langue.

### Masquer la navigation sur une page

Vous pouvez masquer la navigation latérale et la table des matières sur certaines pages, par exemple la page d'accueil, en ajoutant ce bloc en tête du fichier Markdown :

```yaml
---
hide:
  - navigation
  - toc
---
```

### Générer un sommaire réutilisable

Le plugin optionnel `mkdocs-toc-md` peut générer un fichier `docs/tableofcontent.md` contenant un sommaire avec des liens vers les pages de la documentation.

Ce fichier est utile pour :

- réutiliser rapidement une liste de liens dans une page d'accueil ;
- construire des index de section sans tout recopier à la main.

Si vous activez ce plugin dans `mkdocs.yml`, pensez à conserver `docs/tableofcontent.md` dans le `.gitignore`, car ce fichier est régénéré à chaque compilation.
