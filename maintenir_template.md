# Maintenir à jour ce modèle

Si des modifications fonctionnelles nécessite l'utilisation de nouvelles librairies Python ou simplement leur mise à jour.


## 1. Mettre à jour les modules Python

Mettre à jour manuellement les modules Python si nécessaire.


## 2. Figer les dépendances Python

```bash
pip freeze > mkdocs_requirements.txt
```


## 3. Produire les wheels

```bash
rm modules/*
python -m pip wheel -r mkdocs_requirements.txt -w modules/{version python + os}/
```


## 4. Mettre à jour la documentation

En conséquence...


## 5. Communiquer

Communiquer sur la liste une synthèse des modifications.

