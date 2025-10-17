#!/usr/bin/env bash
set -euxo pipefail

# Python base: upgrade & install project deps
python -m pip install -U pip wheel
if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

# Register a Jupyter kernel INSIDE the container (student does nothing)
python -m pip install -U ipykernel
python -m ipykernel install --user --name fb3pfb_nhanes --display-name "Python (fb3pfb_nhanes)"

# LFS is provided by the devcontainer feature; just init & pull
if [ -d .git ]; then
  git lfs install
  git lfs pull || true
fi

