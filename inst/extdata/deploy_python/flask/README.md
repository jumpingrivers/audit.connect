```bash
# Create a virtual environment
python -m venv .venv
source .venv/bin/activate

# Install flask
uv pip install flask
uv pip freeze > requirements.txt
rsconnect deploy api --server https://pct.jumpingrivers.cloud/  .

deactivate
#rsconnect details --server https://pct.jumpingrivers.cloud/
```
