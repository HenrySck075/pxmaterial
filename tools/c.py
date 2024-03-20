import json, copy

a = json.load(open("./payloads/ajax/illust/Artwork"))
n = json.load(open("./payloads/ajax/novel/Novel"))

ak = list(a.keys())
nk = list(n.keys())

o = {}
for i in ak:
    if i in nk and "$" not in i:
        o[i] = copy.deepcopy(a[i])
        del a[i]
        del n[i]

json.dump(a,open("./payloads/ajax/illust/_Artwork","w"),indent=4)
json.dump(n,open("./payloads/ajax/novel/_Novel","w"),indent=4)
json.dump(o,open("./payloads/ajax/shared/Work","w"),indent=4)
