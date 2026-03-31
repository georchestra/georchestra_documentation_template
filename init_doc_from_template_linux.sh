#!/usr/bin/env bash

set -euo pipefail

# Template source and working directories
TEMPLATE_REPO_URL="https://github.com/georchestra/georchestra_documentation_template.git"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMP_PARENT_DIR="${SCRIPT_DIR}/.doc_template_tmp"
CLONE_DIR=""
TARGET_DOCS_DIR="${SCRIPT_DIR}/docs"
TARGET_MKDOCS_CONFIG="${SCRIPT_DIR}/mkdocs.yml"
TARGET_MKDOCS_REQUIREMENTS="${SCRIPT_DIR}/mkdocs_requirements.txt"
TARGET_READTHEDOCS_DOC="${SCRIPT_DIR}/readthedocs.md"
TARGET_INSTALL_SCRIPT="${SCRIPT_DIR}/mkdocs_installation.sh"
TARGET_RUN_SCRIPT="${SCRIPT_DIR}/mkdocs_run.sh"

# Remove the temporary clone on exit
cleanup() {
  if [ -d "${CLONE_DIR}" ]; then
    rm -rf "${CLONE_DIR}"
  fi
}

trap cleanup EXIT

# Stop immediately if documentation already exists in the target project
if [ -e "${TARGET_DOCS_DIR}" ]; then
  echo "Stop init : ${TARGET_DOCS_DIR} already exists."
  exit 0
fi

# Clone the template in a temporary directory
CLONE_DIR="$(mktemp -d "${TMP_PARENT_DIR}.XXXXXX")"
TEMPLATE_DOCS_DIR="${CLONE_DIR}/docs"
TEMPLATE_MKDOCS_CONFIG="${CLONE_DIR}/mkdocs.yml"
TEMPLATE_MKDOCS_REQUIREMENTS="${CLONE_DIR}/mkdocs_requirements.txt"
TEMPLATE_READTHEDOCS_DOC="${CLONE_DIR}/readthedocs.md"
TEMPLATE_INSTALL_SCRIPT="${CLONE_DIR}/mkdocs_installation.sh"
TEMPLATE_RUN_SCRIPT="${CLONE_DIR}/mkdocs_run.sh"

echo "Cloning documentation template into ${CLONE_DIR}"
git clone --depth 1 "${TEMPLATE_REPO_URL}" "${CLONE_DIR}"

# Copy the documentation files into the target project
echo "Copying documentation content into ${SCRIPT_DIR}"
cp -a "${TEMPLATE_DOCS_DIR}" "${TARGET_DOCS_DIR}"
echo "Copied docs/"

cp -a "${TEMPLATE_MKDOCS_CONFIG}" "${TARGET_MKDOCS_CONFIG}"
echo "Copied mkdocs.yml"
cp -a "${TEMPLATE_MKDOCS_REQUIREMENTS}" "${TARGET_MKDOCS_REQUIREMENTS}"
echo "Copied mkdocs_requirements.txt"
cp -a "${TEMPLATE_READTHEDOCS_DOC}" "${TARGET_READTHEDOCS_DOC}"
echo "Copied readthedocs.md"
cp -a "${TEMPLATE_INSTALL_SCRIPT}" "${TARGET_INSTALL_SCRIPT}"
echo "Copied mkdocs_installation.sh"
cp -a "${TEMPLATE_RUN_SCRIPT}" "${TARGET_RUN_SCRIPT}"
echo "Copied mkdocs_run.sh"

chmod +x "${TARGET_INSTALL_SCRIPT}" "${TARGET_RUN_SCRIPT}"

cd "${SCRIPT_DIR}"

# Source the installation script so its environment changes apply immediately
echo "Running . ./mkdocs_installation.sh"
(
  set +u
  . "${TARGET_INSTALL_SCRIPT}"
)

# Start the local MkDocs server in the current shell session
echo "Running . ./mkdocs_run.sh"
echo "MkDocs server will stay in the foreground until you stop it."
(
  set +u
  . "${TARGET_RUN_SCRIPT}"
)
