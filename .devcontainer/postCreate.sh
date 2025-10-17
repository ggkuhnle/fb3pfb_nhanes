# .devcontainer/postCreate.sh
#!/usr/bin/env bash
set -euxo pipefail
python -m pip install -U pip wheel
if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
python -m ipykernel install --user --name fb3pfb_nhanes

