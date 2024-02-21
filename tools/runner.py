import os 


for r, s, fs in os.walk("."):
    for f in fs: 
        os.system(f"python3 json2dart.py {f} {os.path.join(r,f)}")
        os.system(f"mv {f}.dart {os.path.join(r.replace('payloads','json'),f)}")
