```bash
# Create a virtual environment
python -m venv .venv
source .venv/bin/activate

# Install
pip install streamlit plotly scikit-learn
pip freeze > requirements.txt
rsconnect deploy streamlit --server https://rsc.jumpingrivers.cloud/ --api-key .

deactivate
#rsconnect details --server https://rsc.jumpingrivers.cloud/
```
