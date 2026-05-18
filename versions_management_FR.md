# Gérer les versions de la documentation

/!\ Procédure non validée, à tester !

## Principe

Le principe est d'aligner trois éléments :

- un tag dans le dépôt de code du projet ;
- une version dans le fichier MkDocs qui déclare les versions ;
- une version à compiler sur ReadTheDocs.

## Déclarer une nouvelle version dans MkDocs

Modifiez le fichier [docs/versions.json](/home/gaetan/projects/jdev/georchestra_documentation_template/docs/versions.json)

```json
[
  {"version": "latest", "title": "latest", "aliases": ["latest"]},
  {"version": "version_test", "title": "version_test", "aliases": []}
]
```

Devient :

```json
[
  {"version": "latest", "title": "latest", "aliases": ["latest"]},
  {"version": "new", "title": "new_version", "aliases": []},
  {"version": "version_test", "title": "version_test", "aliases": []}
]
```

Puis committez et poussez vers le dépôt.

## Créer une nouvelle version

Rendez-vous sur l'[interface d'administration ReadTheDocs](https://readthedocs.org/dashboard/).

Sélectionnez le projet concerné.

Cliquez sur l'onglet "Versions".

Dans la zone de recherche, trouvez la release ou le tag correspondant à la version, puis cliquez sur "Filter inactive versions".

Vérifiez que le bon tag est filtré, puis cliquez sur le bouton "Activate".

![](images/rtd_activer_version_1.png)

Sur la page suivante, confirmez l'activation de la version.

![](images/rtd_activer_version_2.png)

La version est alors disponible pour compilation dans l'onglet "Preview".

![](images/rtd_activer_version_3.png)

## Vérifier

Rendez-vous sur la documentation en ligne et vérifiez que le sélecteur de version est actif et fonctionne correctement.

TODO : capture d'écran
