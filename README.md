# FB3PFB — NHANES Analysis Project

> For more information on git and Python, see **https://github.com/ggkuhnle/data-analysis-projects**.

---

A project analysing NHANES 2017–2018 data in Python/Jupyter, investigating the association between fermented dairy intake and cardiometabolic health outcomes.

---

## Analysis notebook

**`notebooks/01_dietary_data_preparation.ipynb`** — processes the two 24-hour dietary recall files to produce a participant-level dataset of average daily dairy and fermented dairy intake. Covers food classification, aggregation, merging with nutrient totals, and export of the analytical dataset.

---

## Data

NHANES data files are **not included in this repository**. Download the required XPT files from the [CDC NHANES 2017–2018 page](https://wwwn.cdc.gov/nchs/nhanes/continuousnhanes/default.aspx?BeginYear=2017) and place them in `data/raw/`.

Required files:

| File | Content |
|------|---------|
| `DR1IFF_J.xpt` / `DR2IFF_J.xpt` | Individual foods — 24-hour dietary recalls |
| `DR1TOT_J.xpt` / `DR2TOT_J.xpt` | Total nutrient intake summaries |
| `DEMO_J.xpt` | Demographics |
| `BPX_J.xpt` | Blood pressure |
| `TCHOL_J.xpt` / `HDL_J.xpt` / `TRIGLY_J.xpt` | Serum lipids |
| `BMX_J.xpt` | Body measurements |

The FNDDS food classification spreadsheet (`2017-2018 FNDDS At A Glance - Foods and Beverages.xlsx`) should be placed in `data/processed/`.

---

## Setup

```bash
git clone https://github.com/ggkuhnle/fb3pfb_nhanes.git
cd fb3pfb_nhanes

python3 -m venv venv
source venv/bin/activate        # Windows: venv\Scripts\activate

pip install --upgrade pip
pip install -r requirements.txt

jupyter lab
```

Open `notebooks/01_dietary_data_preparation.ipynb`.

---

## Project structure

```
fb3pfb_nhanes/
├── notebooks/
│   └── 01_dietary_data_preparation.ipynb  # Main analysis notebook
├── data/
│   ├── raw/        # NHANES XPT files (not git-tracked — download separately)
│   └── processed/  # Outputs and lookup files (not git-tracked)
├── src/            # Utility modules
├── requirements.txt
└── README.md
```

---

## Important caveats

- **Cross-sectional design:** associations cannot establish causality.
- **Unweighted analyses:** for population-level inference, apply NHANES survey weights (strata/PSU/weights).
- **Dietary recall limitations:** 24-hour recalls may not reflect habitual intake.

---

## License

MIT
