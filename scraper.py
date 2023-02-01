
import requests
import pandas as pd
from bs4 import BeautifulSoup

#start by downloading the website
url = "https://miningpoolstats.stream/bitcoin"
data = requests.get(url).text

# Create a BeautifulSoup object
soup = BeautifulSoup(data, 'html.parser')

# Verifying tables and their classes
print('Classes of each table:')
for table in soup.find_all('table'):
    print(table.get('class'))

# Creating list with all tables
tables = soup.find_all('table')

#  Looking for the table with the classes 'wikitable' and 'sortable'
table = soup.find('table', class_='table-hover')

# print(table)

# Defining of the dataframe
df = pd.DataFrame(columns=['miningpool'])

# Collecting Ddata
for row in table.tbody.find_all('tr'):    
    # Find all data for each column
    columns = row.find_all('td')
    
    if(columns != []):
        miningpool = columns[0].text.strip()

        df = df.append({'MiningPool': miningpool}, ignore_index=True)

df.head()

# table = soup.find("pools")
# rows = table.find_all("row")
# header = [th.text.strip() for th in rows[0].find_all("th")]

# data = []
# for row in rows[1:]:
#     values = [td.text.strip() for td in row.find_all("td")]
#     data.append(dict(zip(header, values)))

# json_data = json.dumps(data, indent=4)
# print(json_data)