# FB3PFB — NHANES (Colab-first)

A small teaching repo for loading and exploring **NHANES** data in Python.  
This project is designed to run **in Google Colab** so students don’t need to install anything locally.

## ☁️ Run in Google Colab

**Open the starter notebook:**

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/ggkuhnle/fb3pfb_nhanes/blob/main/notebooks/00_load_nhanes.ipynb)

> 🔒 **Private repo?** Colab will ask you to authorise GitHub. That’s expected.

---

## 📦 Clone this repo from Colab (read/write)

> Use this when you want to **pull + push** between Colab and GitHub (recommended for collaboration).

1) Create a **GitHub Personal Access Token** (classic) with scope `repo`.  
   GitHub → avatar → **Settings → Developer settings → Personal access tokens → Tokens (classic)** → *Generate new token*.

2) In a new Colab notebook, run this **one cell** (paste your token when prompted):

```python
from getpass import getpass
TOKEN = getpass("GitHub token (repo scope): ")

REPO = "ggkuhnle/fb3pfb_nhanes"

# Clone with token (avoids interactive prompts)
!git clone https://{TOKEN}:x-oauth-basic@github.com/{REPO}.git
%cd fb3pfb_nhanes

# Optional: identify yourself for commits made from Colab
!git config user.name  "Your Name"
!git config user.email "your.email@example.com"

# If the repo uses Git LFS for large files (e.g., NHANES raw):
!apt-get -qq update && apt-get -qq install -y git-lfs
!git lfs install && git lfs pull
```

3) Open the main notebook inside this repo:
```
notebooks/00_load_nhanes.ipynb
```

---

## ▶️ Typical Colab workflow

At the **start of each session**:
```python
%cd /content/fb3pfb_nhanes
!git fetch origin
!git switch main        # or your feature branch
!git pull --rebase
```

Make changes (edit notebook/code), then **commit & push**:

```python
# first time on a new branch:
!git checkout -b feat/colab-session

# every save
!git add -A
!git commit -m "Work in Colab: update analysis"
!git push -u origin HEAD
```

> Prefer branches + Pull Requests for feedback. Avoid committing to `main` directly.

---

## 📁 Data

- If you store **raw NHANES files** in the repo, use **Git LFS** so the repo stays fast.
  - One-time (outside Colab): `git lfs install && git lfs track "data/raw/*" && git add .gitattributes && git commit -m "Enable LFS"`
  - Push existing LFS content to GitHub once: `git lfs push --all origin`
  - In Colab, after cloning: `git lfs install && git lfs pull`
- Keep derived outputs out of Git (already ignored below).

**.gitignore (excerpt):**
```
__pycache__/
.ipynb_checkpoints/
data/processed/
*.parquet
*.feather
.DS_Store
```

---

## 🧪 Starter notebook

The notebook `notebooks/00_load_nhanes.ipynb` demonstrates:

- Loading NHANES XPORT (`.XPT`) or CSV from `data/raw/`
- Quick checks (shape, head, missingness)
- Saving fast copies to `data/processed/`
- Tiny examples: Table 1 (age & sex), plots, simple regression

> Columns are lower-cased (e.g., `SEQN` → `seqn`).

---

## 🙋 For students (copy/paste)

Open Colab → **New Notebook** → run this cell:

```python
from getpass import getpass
TOKEN = getpass("GitHub token (repo scope): ")
!git clone https://{TOKEN}:x-oauth-basic@github.com/ggkuhnle/fb3pfb_nhanes.git
%cd fb3pfb_nhanes
!git config user.name  "Student Name"
!git config user.email "student@example.com"
!apt-get -qq update && apt-get -qq install -y git-lfs && git lfs install && git lfs pull

# Work on a branch
!git checkout -b feat/student-work
# (Open notebooks/00_load_nhanes.ipynb, run cells)
# When ready:
# !git add -A && git commit -m "My changes" && git push -u origin feat/student-work
```

---

## 🛟 Troubleshooting

- **Colab asks for username/password**: you likely cloned with HTTPS *without* the token. Use the cell above with `https://{TOKEN}:x-oauth-basic@github.com/...`.
- **LFS files look tiny (pointer text)**: run `git lfs install && git lfs pull`.
- **Merge conflicts**: run `!git pull --rebase`. If conflict remains, push your branch and resolve in GitHub’s web editor (Pull Request).
- **Notebook giant diffs**: that’s normal. Later we can introduce Jupytext/nbstripout; for now, keep commits focused.

---

## ⚠️ Notes

- This simple setup is **not** survey-design aware (NHANES weights/strata/PSUs). For formal inference we’ll add survey methods later.
- Do not put sensitive data in a public repo. Keep this repo **private** or only store non-sensitive subsets.

--- 

## License

MIT (or your preferred license)
