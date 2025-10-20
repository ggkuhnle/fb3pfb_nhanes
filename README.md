# FB3PFB — NHANES project (Introduction)


> For more information on git and Python, see **https://github.com/ggkuhnle/data-analysis-projects**.


---

A step-by-step starter for analysing NHANES in **Google Colab** (no installs) or locally (VS Code/Jupyter). The main notebook fetches DEMO_J, HDL_J, TRIGLY_J directly from the CDC, merges, and walks through summaries, plots, a Welch t-test, and a tiny OLS model.

---

## ☁️ Run in Google Colab 

Open the starter notebook in Colab:

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/ggkuhnle/fb3pfb_nhanes/blob/main/notebooks/00_load_nhanes.ipynb)

### Important: Colab does **not** save your work by default
- Colab runs in a temporary VM. If you just close the tab, **changes can be lost**.
- To keep your work, do one of the following **before you finish**:
  1) **File → Save a copy in GitHub…**  
     - Authorise GitHub when prompted  
     - Choose this repository and put your changes on a **new branch** (e.g. `feat/student-work`)  
     - Open a Pull Request on GitHub to share back
  2) **File → Save a copy in Drive** (keeps a personal copy in your Google Drive)
  3) **Download** your notebook: **File → Download → .ipynb** (and commit it later)

### How to “Run All” in Colab
1. Open the notebook via the badge above  
2. **Runtime → Run all**  
   - The notebook will **auto-download** NHANES XPT files into the Colab VM and run the analysis

---

## 👩‍💻 Working locally on macOS (VS Code/Jupyter)

If you prefer local editing (or you’re the maintainer):

### One-time setup
```bash
# 1) Install Homebrew if you don’t have it: https://brew.sh
# 2) Install Python if needed (example for Python 3.11):
brew install python@3.11

# 3) (Optional) Install Git if needed
brew install git
```

### Get the repository (clone)
```bash
# SSH (recommended once you’ve set up an SSH key with GitHub)
git clone git@github.com:ggkuhnle/fb3pfb_nhanes.git

# OR HTTPS (will ask for GitHub login/Token)
# git clone https://github.com/ggkuhnle/fb3pfb_nhanes.git
```

### Create a virtual environment and install dependencies
```bash
cd fb3pfb_nhanes

# Create & activate a venv (macOS default might be python3)
python3 -m venv .venv
source .venv/bin/activate

# Install Python packages
pip install --upgrade pip
pip install -r requirements.txt
```

### Open the notebook locally
- VS Code: **File → Open Folder…** → select the repo → open `notebooks/00_load_nhanes.ipynb`  
- Or Jupyter: `python -m notebook` (then navigate to `notebooks/00_load_nhanes.ipynb`)

> The notebook will download the NHANES files into `data/raw` (inside this repo) when run.

---

## 🔄 Typical Git workflow (maintainer / contributor)

### Pull latest changes
```bash
git pull --rebase
```

### Create a feature branch
```bash
git checkout -b feat/analysis-step1
```

### Commit & push your work
```bash
git add -A
git commit -m "Add first pass at HDL analysis"
git push -u origin feat/analysis-step1
```

### Open a Pull Request (on GitHub)
- Compare your branch against `main`
- Ask for review
- Merge when approved
---

## 📁 Data layout and policy

- The notebook **downloads public NHANES** files (e.g., `DEMO_J.XPT`, `HDL_J.XPT`, `TRIGLY_J.XPT`) at runtime.  
  No Google Drive and no Git LFS required to run.
- **Raw downloads** live in: `data/raw/`  
- **Outputs** (student results, derived tables) should go in: `data/processed/`  
- Keep large/derived files **out of Git** (already in `.gitignore`).

**`.gitignore` (excerpt)**
```
__pycache__/
.ipynb_checkpoints/
data/processed/
*.parquet
*.feather
.DS_Store
```



---

## ⚠️ Note on inference

This starter is **unweighted** and does not apply NHANES survey design.  
For population-level inference, use survey-weighted methods (strata/PSU/weights).

---

## License

MIT 
