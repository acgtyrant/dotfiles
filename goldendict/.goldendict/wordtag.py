#!/bin/env python
import urllib.request
import sys
import bs4


word = sys.argv[1]
searchUrl = 'https://dict.eudic.net/dicts/en/' + word

req = urllib.request.Request(searchUrl)
handler = urllib.request.urlopen(req, timeout=3)
status_code = handler.getcode()
content = handler.read().decode('utf-8')

soup = bs4.BeautifulSoup(content, "html.parser")
searchSuccess = soup.find('h1', attrs={'class': 'explain-Word'})
means = searchSuccess.findAll('span', attrs={'class': 'tag'})
if means:
    print('<!DOCTYPE html><html><head><style> div.eudic_tag{display: inline-block;border-top: 1px;border-bottom:1px;border-left:1px;border-right:1px;color:black;border-width:1px;border-color:rgb(187, 187, 187);border-style:solid;padding-top: 0px;padding-right: 7px;padding-bottom: 0px;padding-left: 7px;border-radius: 2px 2px 2px 2px;font-size: 12px;font-weight: 100;}</style></head>')
    for mean in means:
        print('<div class="eudic_tag" >' + mean.text + '</div>')
    print('</html>')
else:
    sys.exit(0)
