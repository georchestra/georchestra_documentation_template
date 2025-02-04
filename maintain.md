# Maintain / Upgrade Your Documentation

The georchestra documentation template/model may evolve. To keep all documentation at the same level of functionality or graphical customization, it is essential to consider upgrading your documentation.

This guide explains how to proceed.

## Update the `georchestra_documentation_template` Repository

Open a terminal at the root of your local clone of the `georchestra_documentation_template` repository, then:

- Check for unintended modifications: `git status`
- If there are any: `git reset --hard HEAD`
- Then refresh your local clone: `git pull` (in rebase mode)

## Update the Python Environment

- Go to the root of your project.
- Delete the `docs_modules` directory.
- Copy the `docs_modules` directory from your local clone of the `georchestra_documentation_template` repository into your project directory.
- Start a Python session: `source venv_mkdocs/Scripts/activate`
- Update Python libraries:
  - Using wheels: `python -m pip install --trusted-host pypi.org docs_modules/3.9_windows/*.whl`
  - Or using the `mkdocs_requirements.txt` file: `pip install -r mkdocs_requirements.txt`
- If everything is fine, verify the MkDocs version: `mkdocs --version`

## Preview the Documentation

Run `mkdocs serve` in the terminal and open a browser at [http://localhost:8000/](http://localhost:8000/).