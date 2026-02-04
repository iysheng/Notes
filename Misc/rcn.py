#!/usr/bin/python

import sys
import requests
from itertools import islice
from bs4 import BeautifulSoup

def query_bing_dict(word):
    """金山词霸词典查询（网页爬取）"""
    #  url = f"https://cn.bing.com/dict/search?q={word}"
    url = f"https://www.iciba.com/word?w={word}"

    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
    }

    response = requests.get(url, headers=headers)
    soup = BeautifulSoup(response.text, 'html.parser')
    # 显示音标
    ans = soup.find('ul', class_='Mean_symbols__fpCmS')
    if ans is not None and ans.get_text():
        print(ans.get_text())
    ans = soup.find('div', class_='Mean_normal__mkzjn')

    if ans is not None and ans.get_text():
    # 跳过第一个对象，第一个对象是标题 释意
        for i, p in enumerate(islice(ans,1, None)):
            for j, l in enumerate(p, 1):
                    text = l.get_text(strip=True)
                    if text:
                        print(f"{text}")
    else:
        print(f"No found {word}")

if len(sys.argv) > 1:
    query_bing_dict(sys.argv[1])
else:
    query_bing_dict("red")
