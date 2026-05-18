# Gérer la navigation

## Principe

La navigation est fournie de deux manières.

D'abord, via la bannière qui structure deux grandes sections :

- la documentation pour les utilisateurs finaux ;
- une section pour les administrateurs de plateforme et les développeurs.

Ensuite, une fois dans l'une de ces deux sections principales, via le bloc de navigation à gauche, qui correspond à un menu dépliant.

Cette partie doit être gérée manuellement dans le fichier `mkdocs.yml`, dans le bloc `nav:`.

[Voir la documentation officielle](https://squidfunk.github.io/mkdocs-material/setup/setting-up-navigation/#hiding-the-sidebars).

## Masquer la navigation

Vous pouvez masquer la zone de navigation à gauche de chaque page, par exemple sur la page d'accueil principale, en insérant ce bloc en tête du Markdown :

```yaml
---
hide:
  - navigation
  - toc
---
```

## Générer un index des pages à copier-coller

Le plugin optionnel **mkdocs-toc-md** permet de créer un fichier `tableofcontent.md` à la racine du répertoire `docs`. Ce fichier contient un sommaire avec des liens vers les différentes pages de votre documentation.

Ce fichier est généré à chaque démarrage de `mkdocs serve` ou après chaque compilation.

L'intérêt principal de ce fichier est de pouvoir réutiliser son contenu par copier-coller dans différentes pages d'accueil (`index.md`).

Voir par exemple la page [http://localhost:8000/guides_techniques/installer/](http://localhost:8000/guides_techniques/installer/ "http://localhost:8000/guides_techniques/installer/").

Pour le désactiver, supprimez ou commentez le bloc `toc-md` et son sous-bloc dans le fichier `mkdocs.yml`.
