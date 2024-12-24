import os 
import shutil
import sys 

inter = os.environ.get("interpreter",sys.executable) # default to what works on my machine :>
for r, s, fs in os.walk("payloads"):
    for f in fs: 
        if f=="README.md": continue
        if f.startswith("_"): continue
        def fuck():
            if not os.path.exists(pat):
                os.mkdir(pat)
            shutil.move(f"{f}.dart",f"{os.path.join(pat,f)}.dart")
            
        if f.endswith(".dart"): 
            fuck()
            continue
        if os.system(f"{inter} json2dart.py {f} {os.path.join(r,f)}")!=0:
            raise SystemError(f"you stupid (Error on {f})")
        pat = r.replace('payloads','../lib/json')
        if not os.path.exists(f+".dart"): continue
        fuck()
