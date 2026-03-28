# coding: utf-8
import string, codecs, builtins, sys, os, re, io;import collections, glob, fnmatch, pathlib, inspect, functools, itertools, io, os, sys, re, builtins, requests, socket;from pathlib import Path;from inspect import getmembers; from functools import *;from itertools import *;from pprint import pformat, pprint, pp;from collections import *; from fnmatch import fnmatchcase, fnmatch;
string.whitespace
list(string.whitespace)
string.punctuation
sorted(string.punctuation)
string.punctuation
[(c, hex(ord(c))[2:]) for c in string.punctuation]
[(c, '{:02x}'.format(ord(c)) for c in string.whitespace]
[(c, '{:02x}'.format(ord(c))) for c in string.whitespace]
[(c, '{:02x}'.format(ord(c))) for c in list(chain(list(string.whitespace), list('"`'), list("'")))]
sorted([(c, '{:02x}'.format(ord(c))) for c in list(chain(list(string.whitespace), list('"`'), list("'")))])
sorted([(c, '{:02x}'.format(ord(c))) for c in list(chain(list(string.whitespace), list('"`'), list("'")))],                     key=lambda pair: int(pair[1], 16))
sorted([(c, '{:02x}'.format(ord(c))) for c in list(chain(list(string.whitespace), list('"`'), list("'")))],                     key=lambda pair: pair[0] or int(pair[1], 16))
sorted([(c, '{:02x}'.format(ord(c))) for c in list(chain(list(string.whitespace), list('"`'), list("'")))],                     key=lambda pair: int(pair[1], 16))
[hexcode for char, hexcode in sorted([(c, '{:02x}'.format(ord(c))) for c in list(chain(list(string.whitespace), list('"`'), list("'")))],                     key=lambda pair: int(pair[1], 16))]
"\n".join([rf'\x{hexcode} # {char}' for char, hexcode in sorted([(c, '{:02x}'.format(ord(c))) for c in list(chain(list(string.whitespace), list('"`'), list("'")))],                     key=lambda pair: int(pair[1], 16))])
print("\n".join([rf'\x{hexcode} # {char}' for char, hexcode in sorted([(c, '{:02x}'.format(ord(c))) for c in list(chain(list(string.whitespace), list('"`'), list("'")))],                     key=lambda pair: int(pair[1], 16))]))
print("\n".join([rf'\x{hexcode} # {repr(char)}' for char, hexcode in sorted([(c, '{:02x}'.format(ord(c))) for c in list(chain(list(string.whitespace), list('"`'), list("'")))],                     key=lambda pair: int(pair[1], 16))]))
print("\n", "\n".join([rf'\x{hexcode} # {repr(char)}' for char, hexcode in sorted([(c, '{:02x}'.format(ord(c))) for c in list(chain(list(string.whitespace), list('"`'), list("'")))],                     key=lambda pair: int(pair[1], 16))]),)
print("");print("\n".join([rf'\x{hexcode} # {repr(char)}' for char, hexcode in sorted([(c, '{:02x}'.format(ord(c))) for c in list(chain(list(string.whitespace), list('"`'), list("'")))],                     key=lambda pair: int(pair[1], 16))]),)
print("");print("\n".join(" ".join([repr(rf'\x{hexcode}'), '#', repr(char)]) for char, hexcode in sorted([(c, '{:02x}'.format(ord(c))) for c in list(chain(list(string.whitespace), list('"`'), list("'")))],                     key=lambda pair: int(pair[1], 16))]),)
print("");print("\n".join(" ".join([repr(rf'\x{hexcode}'), '#', repr(char)])) for char, hexcode in sorted([(c, '{:02x}'.format(ord(c))) for c in list(chain(list(string.whitespace), list('"`'), list("'")))],                     key=lambda pair: int(pair[1], 16))]),)
