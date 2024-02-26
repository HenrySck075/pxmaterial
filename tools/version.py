import requests,re 
# it looks like "https://s.pximg.net/www/js/build/common-path,sentry-setup,urls,web-vitals.87f79336386e2d46.js"
h = requests.get(input("url: ")).text 
rege = 'version:"[a-z0-9]*"'
i = re.sub('Version = "[a-z0-9]*"','Version = "'+re.findall(rege,h)[0][9:-1]+'"',open("../lib/shared.dart").read())
open("../lib/shared.dart","w").write(i)
