# Manage browsing

## Principle

Navigation is provided in two ways.

First, through the banner that structures two main sections:
  - Documentation for end users
  - A section for platform administrators and developers

Then, once inside one of these two main sections, via the left navigation block, which is a menu that expands.

This part must be manually managed in the `mkdocs.yml` file within the `nav:` block.

[See the official documentation](https://squidfunk.github.io/mkdocs-material/setup/setting-up-navigation/#hiding-the-sidebars).

## Hiding the Navigation

You can hide the navigation section on the left of each page, on the main homepage, by inserting this tag at the top of the markdown:
```
---
hide:
  - navigation
  - toc
---
```
## Generate an Index of Pages for Copy-Pasting

The optional plugin **mkdocs-toc-md** allows you to create a `tableofcontent.md` file at the root of the `docs` directory. This file contains a table of contents with links to the different pages of your documentation.

This file is generated every time `mkdocs serve` starts or after each build.

The main benefit of this file is that you can use it by copying and pasting its content into various homepage pages (`index.md`).

See, for example, the page [http://localhost:8000/guides_techniques/installer/](http://localhost:8000/guides_techniques/installer/ "http://localhost:8000/guides_techniques/installer/").

To disable it, delete or comment out the `toc-md` block and its sub-block in the `mkdocs.yml` file.
