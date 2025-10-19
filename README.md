# FB3PFB — NHANES (Colab-first, GitHub as source of truth)

This repo supports a **minimal-friction teaching setup**:

- **You (maintainer)**: work locally on your Mac (VS Code optional), then **push to GitHub**.
- **Student**: opens the notebook via a **Colab badge**, runs it in the browser (no installs), and **saves changes back to GitHub** via Colab’s menu.
- **Data**: downloaded directly from **CDC** during the notebook run (no Google Drive, no Git LFS required to get started).

---

## ☁️ Run the notebook in Google Colab

Click to open the starter notebook in Colab:

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/ggkuhnle/fb3pfb_nhanes/blob/main/notebooks/00_load_nhanes.ipynb)

> 🔒 If this repository is private, Colab will ask the student to **authorize GitHub** the first time. That is expected.

---

## 🔄 How we work together

### You (maintainer, local)
```bash
# pull latest
git pull --rebase

# do your edits locally (code/notebooks)

# commit & push
git add -A
git commit -m "Update analysis / notes"
git push

# (recommended) use branches & PRs
git checkout -b feat/analysis-step1
git push -u origin feat/analysis-step1
# then open a Pull Request to main
```

### Student (Colab, zero installs)
1. Click the **Colab badge** above.
2. Press **Runtime → Run all**.  
   The notebook **auto-downloads NHANES XPTs from CDC** into the Colab VM and loads them.
3. To share changes back:
   - **File → Save a copy in GitHub…** (authorize GitHub once) → pick this repo and a **new branch** (e.g., `feat/student-work`), or
   - (optional) use a tiny git flow inside Colab:
     ```python
     !git checkout -b feat/student-work
     !git add -A
     !git commit -m "Student changes"
     !git push -u origin feat/student-work
     ```
4. Open a **Pull Request** on GitHub for feedback.

---

## 📁 Data policy (simple)

- The teaching notebook **downloads public NHANES files** from CDC each session (e.g., `DEMO_J.xpt`, `HDL_J.xpt`, `TRIGLY_J.xpt`).  
  No Google Drive or LFS is required to run.
- Keep **derived outputs** (e.g., `data/processed/`) out of Git using `.gitignore` (already set up below).
- If you later want to version large raw files in the repo, consider **Git LFS** as an advanced step.

**`.gitignore` (excerpt):**
```
__pycache__/
.ipynb_checkpoints/
data/processed/
*.parquet
*.feather
.DS_Store
```

---

## 📓 Notebook contents (overview)

- Detects Colab and sets paths (`/content/data/raw`, `/content/data/processed`).
- **Downloads** selected NHANES XPORT files directly from **CDC** (no Drive).
- Loads **all** `.XPT/.CSV` in `data/raw/`, exposes common tables:
  - `DEMO_*` → `df_demo`
  - `HDL_*`  → `df_hdl`
  - `TRIGLY_*` → `df_trig`
- Gentle steps: quick **Table 1** (age/sex), **t-test**, simple **plots**, and a **regression**.
- Columns are lower-cased (`SEQN → seqn`) for easy merges.

---

## 🧑‍🏫 Suggested learning path (scaffolded)

1. **Week 1**: Run in Colab, load data, summarize (Table 1), one plot, one test.  
   Save to GitHub via **File → Save a copy in GitHub**.
2. **Week 2**: Branches & Pull Requests (still Colab). Add a figure; submit a PR.
3. **Week 3 (optional)**: Try local VS Code (venv) or Codespaces—only if useful.

---

## 🛟 Troubleshooting

- **Colab asks for username/password**: normal when authorizing GitHub. Approve the OAuth popup.
- **Notebook can’t find files**: the notebook auto-downloads from CDC; rerun the “download” cell or click **Runtime → Run all**.
- **Merge conflicts on notebooks**: push a new branch and resolve in GitHub’s web editor (PR). Keep commits focused.
- **Private repo access**: make sure the student is a repo collaborator (GitHub → Settings → Collaborators).

---

## 🔐 Notes

- This is an **introductory** workflow; it does not apply NHANES **survey design** (weights/strata/PSUs) for inference. We’ll add survey-aware methods later when needed.
- Keep the repo **private** (or store only non-sensitive artifacts) if required by your policies.

---

## License

MIT (or your chosen license)
