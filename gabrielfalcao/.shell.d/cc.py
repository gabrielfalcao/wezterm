#!/usr/bin/env python3
import ast

CONTROL_CHARACTERS = "abntvfr"

def point(l: str) -> str:
    c = ast.literal_eval(rf"'\{l}'")
    cp = hex(ord(c))
    escape = "".join(["\\", f"{l}"])
    xcode = cp.replace("0x", r"\x0")
    print("\t".join(
        [
            f"'{escape}'",
            f"code point: {cp}",
            f"=> {xcode}",
            f"| {repr(c)}",
            # f":^,
            # f"{c}",
            # f"```",
            # f"## escaped",
            # f"```",
            # f"```",
        ]
    ))


list(map(point, CONTROL_CHARACTERS))
