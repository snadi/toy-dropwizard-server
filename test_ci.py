import requests
import pytest # have to install via command "pip3 install -U pytest"
import json

def test_health_check():
    r = requests.get('http://localhost:8085')
    assert(r.status_code == 404)

def test_hello_world():
    r = requests.get('http://localhost:8085')
    res = r.json()

    assert(res['message'] == 'HTTP 404 Not Found')

# 1. Add two more tests here of your choice. I will explain the API.
#    Make sure to verify the necessary info, e.g., status code, response data.
# 2. Add "pytest" as integration testing script as part of Github Actions CI workflow (you've done this before!)
