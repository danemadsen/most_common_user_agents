import requests
from bs4 import BeautifulSoup
import json

def extract_json(id, output_file):
    response = requests.get('https://www.useragents.me')
    soup = BeautifulSoup(response.content, 'html.parser')

    # Find the outer div by ID
    outer_div = soup.find('div', id=id)

    # Find the textarea within the outer div
    textarea = outer_div.find('textarea', {'class': 'form-control'})
    json_data = json.loads(textarea.text)

    with open(output_file, 'w') as f:
        json.dump(json_data, f, indent=4)

extract_json('most-common-desktop-useragents-json-csv', 'desktop.json')
extract_json('most-common-mobile-useragents-json-csv', 'mobile.json')