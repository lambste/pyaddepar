import pandas as pd
from auth import aFirm, aKey, aSecret
from pyaddepar.preader import PReader

if __name__ == '__main__':
    pd.set_option("display.width", 300)
    pd.set_option("display.max_rows", 300)

    # instantiate reader (e.g. wrapper of the addepar REST api)
    reader = PReader(id=aFirm, key=aKey, secret=aSecret)

    groups = reader.groups

    print(groups.keys())
    print(groups.values())
    print(groups.items())

    for group in groups:
        print(group)
        print(groups[group])

