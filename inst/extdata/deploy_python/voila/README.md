`hash.ipynb` is Posit Connect's "Secure Hashes with Voilà" Jump Start example
(`voila-example`), copied unchanged. The example ships a frozen `requirements.txt`, but its
pins need Python 3.11 or later, so this one lists the two packages the example's file
was compiled from, with lower bounds. pip then picks versions that suit the Python on the
server.

```bash
# Create a virtual environment
python -m venv .venv
source .venv/bin/activate

# Install
uv pip install -r requirements.txt
voila hash.ipynb
rsconnect deploy voila --server https://pct.jumpingrivers.cloud/ hash.ipynb

deactivate
```
