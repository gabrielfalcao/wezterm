#!/usr/bin/env python3

import click
import enum
import re
import logging
import inspect
import warnings
from typing import List, Dict, Tuple, Union, Optional, Self

from dataclasses import dataclass, field
import coloredlogs
from pathlib import Path

PYTHON_FILE_REGEX = re.compile(
    r"^(?P<parents>.*)?(?P<filename>[a-zA-Z_-]+[a-zA-Z0-9_.-]*)(?P<extension>[.]py)$"
)

LOG_LEVELS = [
    (name, value)
    for name, value in inspect.getmembers(logging)
    if isinstance(value, int) and name == name.upper()
]
LOG_LEVEL_NAMES = [name.capitalize() for name, value in LOG_LEVELS]


@dataclass
class LogLevel:
    name: str
    value: int

    @classmethod
    def from_number(value: int) -> Optional[LogLevel]:


@dataclass
class Context:
    loglevel: LogLevel = field(kw_only=True)
    ignore_invalid_files: field(kw_only=True)
    logger: logging.Logger: field(kw_only=True)

@click.command
@click.argument("path-to-python-files", multiple=True, type=Path)
@click.option("-e", "--ignore-invalid-files", is_flag=True)
@click.option(
    "-l", "--loglevel", type=click.Choice(LOG_LEVEL_NAMES, case_sensitive=False)
)
@click.pass_context
def main(ctx, path_to_python_files, ignore_invalid_files, loglevel):
    coloredlogs.install(level=loglevel.upper())
    logger = logging.getLogger(__name__)
    ctx.obj = Context(loglevel=LogLevel, ignore_invalid_files=ignore_invalid_files, logger=logger)
    ctx.ensure_object(Context)

    source_paths = []
    non_matched = []
    for item in path_to_python_files:
        found = PYTHON_FILE_REGEX.search(item)
        if ignore_invalid_files and not found:
            continue
        elif not found:
            eprint
        container = source_paths if found else non_matched
        container.append(item)
