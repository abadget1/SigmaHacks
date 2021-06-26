
import bs4, json, re, requests
from pprint import pprint

def scrape_item(url: str, json_save_path: str = None):
    """
    Scrapes ingredients concern table for a particular item given by URL.

    Parameters:
        url (str) - URL of item on EWG SkinDeep.
        json_save_path (str) - Path to save json file of collected ingredients information. If None, json is not saved to file. Defaults to None.
    """

    # create BeautifulSoup instance for html parsing
    response = requests.get(url=url)
    soup = bs4.BeautifulSoup(markup=re.sub('<!--|-->', '', str(response.content)), features='lxml')
    table_element = soup.html.body.find('table')
    # pprint(table_element)

    # collect ingredient concerns data row-by-row
    ingredient_concerns = dict()
    for trow_element in table_element.tbody.find_all('tr'):
        # row data
        score = trow_element.find('img')['src']
        availability = trow_element.find('span').text
        ingredient = trow_element.find('a').text
        concern = list([bp.strip() for bp in trow_element.find('p').text.split('•')[1:]])

        # debugging
        if __debug__:
            pprint('-' * 100)
            pprint(score)
            pprint(availability)
            pprint(ingredient)
            pprint(concern)
            break

        ingredient_concerns[ingredient] = dict(
            {
                'score': score,
                'availability': availability,
                'concern': concern
            }
        )

    if json_save_path is not None:
        json.dump(obj=ingredient_concerns, fp=open(file=json_save_path, mode='w'), indent=4)
    ingredient_concerns_json = json.dumps(obj=ingredient_concerns, indent=4)
    pprint(ingredient_concerns_json)

if __name__ == '__main__':
    scrape_item(url='https://www.ewg.org/skindeep/products/872583-Broo_Craft_Beer_Bar_Shampoo/', json_save_path='./test.json')

