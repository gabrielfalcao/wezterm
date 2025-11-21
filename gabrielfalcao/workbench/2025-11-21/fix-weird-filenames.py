#!/usr/bin/env python3
import re
import os
import sys
from typing import Tuple
from pprint import pprint
from os.path import splitext
from pathlib import Path

cwd = Path(os.getcwd()).absolute()
regex = re.compile(r'[^a-z0-9_.@^%(~) -]+', re.I)

def split(path: Path) -> Path:
    parent = path.parent
    base, ext = splitext(path.name)
    return (parent, base, ext)


def is_weird(tup: Tuple[Path, str, str]) -> bool:
    parent, base, ext = tup
    weird_base = regex.search(base)
    weird_ext = regex.search(ext)
    return weird_base or weird_ext

def fix_string(s: str) -> str:
    return regex.sub('-', s)

def fix(tup: Tuple[Path, str, str]) -> Path:
    parent, base, ext = tup
    weird_base = regex.sub('-', base)
    weird_ext = regex.sub('-', ext)

    name = "".join(map(fix_string, [base, ext]))
    return parent.join(name)

files = list(map(split, cwd.iterdir()))
weird = list(filter(is_weird, files))
fixed = list(map(fix, weird))
# weird = list(map(lambda path: (path, regex.sub('-', path.name)), cwd.iterdir()))
pprint(weird)



# def main():
#     print(weird)

# if __name__ == '__main__':
#     main()
