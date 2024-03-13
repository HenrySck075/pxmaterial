import os 

inter = os.environ.get("interpreter","python3") # default to what works on my machine :>
for r, s, fs in os.walk("payloads"):
    for f in fs: 
        if f=="README.md": continue
        if os.system(f"{inter} json2dart.py {f} {os.path.join(r,f)}")!=0:
            raise SystemError("you stupid")
        pat = r.replace('payloads','json')
        the = lambda: os.system(f"mv {f}.dart {os.path.join(pat,f)}.dart")
        
        if the() == 256: # assuming were cooking in linux
            os.system("mkdir -p "+pat)
            the()
