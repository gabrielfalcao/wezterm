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

def fix_string(s: str, repl: str = '-') -> str:
    return regex.sub(repl, s).strip(repl)

def fix_weird(tup: Tuple[Path, str, str]) -> Path:
    parent, base, ext = tup
    comp = (base, ext)
    old_name = "".join(comp)
    new_name = "".join(map(fix_string, comp))
    return parent.joinpath(old_name), parent.joinpath(new_name)




def main():
    files = map(split, cwd.iterdir())
    weird = filter(is_weird, files)
    for old, new in map(fix_weird, weird):
        print(old, new)

if __name__ == '__main__':
    main()
