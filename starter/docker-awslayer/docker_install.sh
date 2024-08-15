virtualenv --python=/usr/bin/python3.10 python
source python/bin/activate
pip3 install -r requirements.txt -t python/lib/python3.10/site-packages

zip -r python.zip python