`requirements.txt` lists only what `app.py` needs, with lower bounds rather than
exact pins, so pip picks versions that suit the Python on the server. Don't replace it
with `uv pip freeze`: no single numpy release installs on both Python 3.10 and 3.14.

```bash
# Create a virtual environment
python -m venv .venv
source .venv/bin/activate

# Install
uv pip install -r requirements.txt
rsconnect deploy streamlit --server https://pct.jumpingrivers.cloud/ .

deactivate
#rsconnect details --server https://rsc.jumpingrivers.cloud/
```
