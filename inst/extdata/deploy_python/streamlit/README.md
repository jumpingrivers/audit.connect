```bash
# Create a virtual environment
python -m venv .venv
source .venv/bin/activate

# Install
uv pip install streamlit plotly scikit-learn
uv pip freeze > requirements.txt
rsconnect deploy streamlit --server https://pct.jumpingrivers.cloud/ .

deactivate
#rsconnect details --server https://rsc.jumpingrivers.cloud/
```
