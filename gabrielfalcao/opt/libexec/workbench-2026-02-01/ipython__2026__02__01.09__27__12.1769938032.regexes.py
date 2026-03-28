# coding: utf-8
import collections, glob, fnmatch, pathlib, inspect, functools, itertools, io, os, sys, re, builtins, requests, socket;from pathlib import Path;from inspect import getmembers; from functools import *;from itertools import *;from pprint import pformat, pprint, pp;from collections import *; from fnmatch import fnmatchcase, fnmatch;  \
here=Path(os.getcwd()).absolute(); \
regexp_boundary_chars=list(OrderedDict([(c, c) for c in chain(list('([{|}])^$'), list('"'), list("'"))]).keys()); \
regexp_boundary_char_map=OrderedDict([(c, ord(c)) for c in chain(list('([{|}])^$'), list('"'), list("'"))]);
here
home=(os.getenv("HOME") or ""); regexes=dict(
f"^{home.rstrip('/')}/": '~/',
home=(os.getenv("HOME") or ""); regexes=dict(f"^{home.rstrip('/')}/": '~/', f"[/]": '%{code}'.format(code=hex("/")[2:])); regexes
home=(os.getenv("HOME") or ""); regexes={f"^{home.rstrip('/')}/": '~/', f"[/]": '%{code}'.format(code=hex("/")[2:])}; regexes
home=(os.getenv("HOME") or ""); regexes={f"^{home.rstrip('/')}/": '~/'}; regexes
# char_codepoints=[(char, ord(char)) for char in list("/ \n\r\t.;,?@&%$()[]{}")]
unsafe_path_chars=OrderedDict([(c, ord(c)) for c in list(chain(list("/ \n\r\t.;,?@&%$()[]{}'`"), list('"'), list("'")))]);
regexes
[(c, hex(code)[2:]) for c, code in unsafe_path_chars.items()]
home=(os.getenv("HOME") or ""); regexes=dict(); 
home_env=(os.getenv("HOME") or ""); regexes=dict(); home_path=Path("~/").expanduser(); home=list(filter(bool, map(str, [home_env, home_path])));
home, home_env, home_path
home_env=(os.getenv("HOME") or ""); regexes=dict(); home_path=Path("~/").expanduser(); home=dict([(h, h) for h in list(filter(bool, map(str, [home_env, home_path]))));
home_env=(os.getenv("HOME") or ""); regexes=dict(); home_path=Path("~/").expanduser(); home=dict([(h, h) for h in list(filter(bool, map(str, [home_env, home_path])));
home_env=(os.getenv("HOME") or ""); regexes=dict(); home_path=Path("~/").expanduser(); home=dict([(h, h) for h in list(filter(bool, map(str, [home_env, home_path])))]);
home
home_env=(os.getenv("HOME") or ""); regexes=dict(); home_path=Path("~/").expanduser(); home=list(dict([(h, h) for h in list(filter(bool, map(str, [home_env, home_path])))]).values());
home
home_env=(os.getenv("HOME") or ""); regexes=dict(); home_path=Path("~/").expanduser(); home_cands=list(dict([(h, h) for h in list(filter(bool, map(str, [home_env, home_path])))]).values());home = home_cands[0] if len(home_cands) else str(home_path);
home
home and regexes.update({f"^{home.rstrip('/')}/": '~/'}) 
[(c, hex(code)[2:]) for c, code in unsafe_path_chars.items()]
[(c, '%{code}'.format(code=hex(code)[2:])) for c, code in unsafe_path_chars.items()]
unsafe_path_char_hexcodes=[hex(code)[2:] for c, code in unsafe_path_chars.items()]
unsafe_path_char_regexes=[(rf'\\x{code}', f"%{code}") for code in unsafe_path_char_hexcodes]
unsafe_path_char_regexes
unsafe_path_char_regexes=[(rf'\x{code}', f"%{code}") for code in unsafe_path_char_hexcodes]
unsafe_path_char_regexes
unsafe_path_char_regexes=[(rf'\x{code:}', f"%{code}") for code in unsafe_path_char_hexcodes]
unsafe_path_char_hexcodes=[hex(code)[2:].rjust(2, '0') for c, code in unsafe_path_chars.items()];unsafe_path_char_hexcodes;
unsafe_path_char_hexcodes=[hex(code)[2:].rjust(2, '0') for c, code in unsafe_path_chars.items()];
unsafe_path_char_hexcodes
unsafe_path_chars
[(c, c) for c in unsafe_path_chars.values()]
unsafe_path_char_regexes=[(rf'\x{code:02x}', f"%{code:02x}") for code in [(c, c) for c in unsafe_path_chars.values()]];
unsafe_path_char_regexes=[(rf'\x{code:}', f"%{code}") for code in unsafe_path_char_hexcodes]
unsafe_path_char_regexes
unsafe_path_char_regexes=[(rf'[\x{code:}]', f"%{code}") for code in unsafe_path_char_hexcodes]
unsafe_path_char_regexes
regexes
(home, regexes.update({f"^{home.rstrip('/')}/": '~/'}))
unsafe_path_char_regexes=[(rf'[\x{code:}]', f"%{code}") for code in unsafe_path_char_hexcodes]
unsafe_path_char_regexes
dict(unsafe_path_char_regexes)
regexes=dict(); filter(bool, [(home and regexes.update({f"^{home.rstrip('/')}/": '~/'})), regexes.update(dict(unsafe_path_char_regexes))]);
regexes=dict();
filter(bool, [(home and regexes.update({f"^{home.rstrip('/')}/": '~/'})), regexes.update(dict(unsafe_path_char_regexes))])
list(filter(bool, [(home and regexes.update({f"^{home.rstrip('/')}/": '~/'})), regexes.update(dict(unsafe_path_char_regexes))]))
unsafe_path_char_regexes=[(rf'[\x{code:}]', f"%{code}") for code in unsafe_path_char_hexcodes];regexes=dict();list(filter(bool, [(home and regexes.update({f"^{home.rstrip('/')}/": '~/'})), regexes.update(dict(unsafe_path_char_regexes))]))
regexes
def full_path_to_safe_filename(path: Path) -> str:
    if not len(str(path or '').strip()):
        return
    raw_path_string = str(path or '')
    if not len(raw_path_string.strip()):
        return
    orig_path = path
    path = Path(raw_path_string).expanduser().absolute()
    result = str(path)
    for pattern, repl in regexes.items():
        regex = re.compile(pattern)
        result = regex.sub(repl, result)
        
        
        
    
def full_path_to_safe_filename(path: Path) -> str:
    if not len(str(path or '').strip()):
        return
    raw_path_string = str(path or '')
    if not len(raw_path_string.strip()):
        return
    orig_path = path
    path = Path(raw_path_string).expanduser().absolute()
    result = str(path)
    for pattern, repl in regexes.items():
        regex = re.compile(pattern)
        result = regex.sub(repl, result)
    
def full_path_to_safe_filename(path: Path) -> str:
    if not len(str(path or '').strip()):
        return
    raw_path_string = str(path or '')
    if not len(raw_path_string.strip()):
        return
    orig_path = path
    path = Path(raw_path_string).expanduser().absolute()
    result = str(path)
    for pattern, repl in regexes.items():
        regex = re.compile(pattern)
        result = regex.sub(repl, result)
    return result
    
here
import collections, datetime, glob, fnmatch, pathlib, inspect, functools, itertools, io, os, sys, re, builtins, requests, socket;from pathlib import Path;from inspect import getmembers; from functools import *;from itertools import *;from pprint import pformat, pprint, pp;from datetime import datetime, timedelta;from collections import *; from fnmatch import fnmatchcase, fnmatch;  \
here=Path(os.getcwd()).absolute(); \
regexp_boundary_chars=list(OrderedDict([(c, c) for c in chain(list('([{|}])^$'), list('"'), list("'"))]).keys()); \
regexp_boundary_char_map=OrderedDict([(c, ord(c)) for c in chain(list('([{|}])^$'), list('"'), list("'"))]);
now=datetime.utcnow()
now.timestamp()
now.timestamp()
now.strftime('%s')
now.strftime('%S')
now.strftime('%s')
now.strftime('%s%ns')
now.strftime('%s')
out=now.strftime('ipython-%Y-%m-%d.%H-%M-%S.%s.regexes.py')
get_ipython().run_line_magic('save', 'out')
get_ipython().run_line_magic('hist', '')
x=get_ipython().run_line_magic('hist', '')
x
out
now=datetime.utcnow(); out=now.strftime('ipython-%Y-%m-%d.%H-%M-%S.%s.regexes.py'); out
get_ipython().run_line_magic('save', 'ipython-2026-02-01.09-26-40.1769938000.regexes.py')
now=datetime.utcnow(); out=now.strftime('ipython-%Y-%m-%d.%H-%M-%S.%s.regexes.py').replace('-', '__'); out
