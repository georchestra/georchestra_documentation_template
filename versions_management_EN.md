# Managing Documentation Versions

/!\ Procedure not validated! Needs testing!

## Principle

The principle is to match three things:

- A tag in the project's code repository
- A version in the MkDocs file declaring the versions
- A version to be compiled on ReadTheDocs

## Declare a New Version in MkDocs

Edit the file [docs/versions.json](docs/versions.json)

```
[
  {"version": "latest", "title": "latest", "aliases": ["latest"]},
  {"version": "version_test", "title": "version_test", "aliases": []}
]
```

Will become:

```
[
  {"version": "latest", "title": "latest", "aliases": ["latest"]},
  {"version": "new", "title": "new_version", "aliases": []},
  {"version": "version_test", "title": "version_test", "aliases": []}
]
```

Then commit and push to the repository.

## Create a New Version

Go to the [ReadTheDocs administration interface](https://readthedocs.org/dashboard/).

Select the relevant project.

Click on the "Versions" tab.

In the search area, find the release or tag corresponding to the version, then click "Filter inactive versions."

Check if the correct tag is filtered, then click the "Activate" button.

![](images/rtd_activer_version_1.png)

On the next page, confirm the activation of the version.

![](images/rtd_activer_version_2.png)

The version is then available for compilation in the "Preview" tab.

![](images/rtd_activer_version_3.png)

## Verify

Go to the online documentation and check if the version selector is active and working properly.

TODO: Screenshot