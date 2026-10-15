`requirements.txt` lists only what `app.py` needs, with lower bounds rather than
exact pins, so pip picks versions that suit the Python on the server. Don't replace it
with `uv pip freeze`: a frozen version may not install on every Python the server runs.

```bash
# Create a virtual environment
python -m venv .venv
source .venv/bin/activate

# Install flask
uv pip install -r requirements.txt
rsconnect deploy api --server https://pct.jumpingrivers.cloud/  .

deactivate
#rsconnect details --server https://pct.jumpingrivers.cloud/
```
