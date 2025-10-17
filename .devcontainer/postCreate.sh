#!/usr/bin/env bash
set -euxo pipefail

# --- System deps that sometimes fail without sudo if done in features ---
export DEBIAN_FRONTEND=noninteractive
sudo rm -rf /var/lib/apt/lists/* || true
sudo apt-get update
sudo apt-get install -y git-lfs

# --- Python deps & kernel ---
python -m pip install -U pip wheel ipykernel
if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
python -m ipykernel install --user --name fb3pfb_nhanes --display-name "Python (fb3pfb_nhanes)"

# --- Pull LFS data inside the container (student doesn't need LFS on host) ---
if [ -d .git ]; then
  git lfs install
  git lfs pull || true
fi

echo "postCreate done."
