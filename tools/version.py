from collections.abc import Callable
from typing import Iterable, TypeVar
import requests,re,cloudscraper
from bs4 import BeautifulSoup, ResultSet, Tag
# it looks like "https://s.pximg.net/www/js/build/common-path,sentry-setup,urls,web-vitals.87f79336386e2d46.js"
c = open("../assets/cookie").read().strip("\n")
ht = BeautifulSoup(cloudscraper.create_scraper().get("https://www.pixiv.net/en",headers={"Cookie":c,"X-User-Id":"76179633","Referer":"https://www.pixiv.net","User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"}).text)
T = TypeVar("T")
def findwhere(arr: Iterable[T], pred: Callable[[T],bool]) -> T:
    for i in arr:
        if pred(i): return i 
    raise ValueError("dumb")
fucktyping: ResultSet[Tag] = ht.select("head script")
h = requests.get(findwhere(fucktyping, lambda t: t.has_attr("src") and "https://s.pximg.net/www/js/build/common-path,sentry-setup,urls,web-vitals" in t.attrs["src"]).attrs["src"]).text 
rege = 'version:"[a-z0-9]*"'
i = re.sub('Version = "[a-z0-9]*"','Version = "'+re.findall(rege,h)[0][9:-1]+'"',open("../lib/shared/http.dart").read())
open("../lib/shared/http.dart","w").write(i)
