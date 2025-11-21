#!/usr/bin/env python3
import re
import os
import sys
from os.path import splitext
from pathlib import Path

# regex = re.compile(r'[^a-z0-9_[:space:]-]+', re.I)
regex = re.compile(r'[^a-z0-9_.@^%(~) -]+', re.I)

def split(path: Path) -> Path:
    parent = path.parent
    base, ext = splitext(path.name)
    return (parent, base, ext)


def fix(path: Path) -> Path:
    parent = path.parent
    base, ext = splitext(path.name)
    return
cwd = Path(os.getcwd()).absolute()
weird = list(filter(lambda path: sum(map(bool, map(regex.search, splitext(path.name)))), cwd.iterdir()))
# weird = list(filter(lambda path: sum(map(bool, map(regex.search, splitext(path.name)))), cwd.iterdir()))
fixed = list(map(lambda path: splitext(path.name), cwd.iterdir()))
# weird = list(map(lambda path: (path, regex.sub('-', path.name)), cwd.iterdir()))



# def main():
#     print(weird)

# if __name__ == '__main__':
#     main()
