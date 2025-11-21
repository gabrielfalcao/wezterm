#!/usr/bin/env python3
import re
import os
import sys
import shutil
import unicodedata
from typing import Tuple
from os.path import splitext
from pathlib import Path

cwd = Path(os.getcwd()).absolute()
regex = re.compile(r'[^a-z0-9_.@^%(~) -]+', re.I)

def normalized_string(s: str) -> str:
    return unicodedata.normalize('NFKC', str(s))

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


def fix_on_directory(working_dir: Path):
    if not working_dir.isdir():
        raise RuntimeError(f'cannot "fix_on_directory" on a path that is not a directory: {path}')
    files = map(split, working_dir.iterdir())
    weird = filter(is_weird, files)
    for old, new in map(fix_weird, weird):
        n_old = normalized_string(old)
        n_new = normalized_string(new)
        print(f"renaming {n_old} to {n_new}")
        shutil.move(old, new)

def main():
    directory_args = list(filter(lambda path: path.isdir(), map(lambda arg: Path(arg).expanduser().absolute(), sys.argv)))
    total_dirs = len(directory_args)
    if total_dirs is 0:
        print(f"no target directories provided via command-line, defaulting to the current: {cwd}", file=sys.stderr)
        fix_on_directory(cwd)
        return
    else:
        list(map(fix_on_directory, directory_args))

if __name__ == '__main__':
    main()
