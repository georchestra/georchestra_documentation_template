#!/usr/bin/env bash

set -euo pipefail

TEMPLATE_REPO_URL="https://github.com/georchestra/georchestra_documentation_template.git"
TEMPLATE_REPO_URL="https://github.com/georchestra/georchestra_documentation_template.git"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMP_PARENT_DIR="${SCRIPT_DIR}/.doc_template_tmp"
CLONE_DIR=""
cleanup() {
  if [ -d "${CLONE_DIR}" ]; then
    rm -rf "${CLONE_DIR}"
  fi
}

trap cleanup EXIT

if [ -e "${SCRIPT_DIR}/docs" ]; then
if [ -e "${SCRIPT_DIR}/docs" ]; then
  echo "Initialisation interrompue : ${SCRIPT_DIR}/docs existe déjà. Rien n'a été modifié."
  exit 0
fi
CLONE_DIR="$(mktemp -d "${TMP_PARENT_DIR}.XXXXXX")"
CLONE_DIR="$(mktemp -d "${TMP_PARENT_DIR}.XXXXXX")"

echo "Cloning documentation template into ${CLONE_DIR}"
git clone --depth 1 "${TEMPLATE_REPO_URL}" "${CLONE_DIR}"

echo "Copying documentation content into ${SCRIPT_DIR}"
cp -a "${CLONE_DIR}/docs" "${SCRIPT_DIR}/docs"
echo "Copied docs/"

cp -a "${CLONE_DIR}/mkdocs.yml" "${SCRIPT_DIR}/mkdocs.yml"
echo "Copied mkdocs.yml"
cp -a "${CLONE_DIR}/mkdocs_requirements.txt" "${SCRIPT_DIR}/mkdocs_requirements.txt"
echo "Copied mkdocs_requirements.txt"
cp -a "${CLONE_DIR}/readthedocs.md" "${SCRIPT_DIR}/readthedocs.md"
echo "Copied readthedocs.md"
cp -a "${CLONE_DIR}/mkdocs_installation.sh" "${SCRIPT_DIR}/mkdocs_installation.sh"
echo "Copied mkdocs_installation.sh"
cp -a "${CLONE_DIR}/mkdocs_run.sh" "${SCRIPT_DIR}/mkdocs_run.sh"
echo "Copied mkdocs_run.sh"

chmod +x "${SCRIPT_DIR}/mkdocs_installation.sh" "${SCRIPT_DIR}/mkdocs_run.sh"

cd "${SCRIPT_DIR}"

echo "Running . ./mkdocs_installation.sh"
(
  set +u
  . ./mkdocs_installation.sh
)

echo "Running . ./mkdocs_run.sh"
echo "MkDocs server will stay in the foreground until you stop it."
(
  set +u
  . ./mkdocs_run.sh
)
