#!/usr/bin/env bash
set -euxo pipefail

# Python basics
python -m pip install -U pip wheel
if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
python -m ipykernel install --user --name fb3pfb_nhanes

# --- LFS handled inside the container (no host install needed) ---
# Install git-lfs and pull large files if this is a git repo
if [ -d .git ]; then
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install -y git-lfs
  git lfs install
  # If there are LFS pointers present, fetch the real files
  git lfs pull || true
fi
