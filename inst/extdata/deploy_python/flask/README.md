
```bash
# Create a virtual environment
python -m venv .venv
source .venv/bin/activate

# Install flask
pip install flask
pip freeze > requirements.txt
rsconnect deploy api --server https://rsc.jumpingrivers.cloud/ --api-key .

deactivate
#rsconnect details --server https://rsc.jumpingrivers.cloud/
```
