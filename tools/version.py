import requests,re 
h = requests.get("https://s.pximg.net/www/js/build/common-path,sentry-setup,urls,web-vitals.cde4b88255b02639.js").text 
rege = 'version:"[a-z0-9]*"'
i = re.sub('Version = "[a-z0-9]*"','Version = "'+re.findall(rege,h)[0][9:-1]+'"',open("../lib/shared.dart").read())
open("../lib/shared.dart","w").write(i)
