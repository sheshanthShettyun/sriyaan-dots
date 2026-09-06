#!/usr/bin/env python3
"""Patch DMS DankDash: make its container borders follow the shared
Theme.layerOutlineWidth token (like every other DMS widget) instead of
hardcoding border.width 1/2.

Only borders whose color is Theme.outlineMedium / Theme.outlineStrong are
changed; functional selection borders (primary / warning / outlineHeavy) are
left untouched. A .bak backup is written next to each changed file.

Run as root:  sudo python3 patch-dankdash-borders.py
"""

import os
import re
import shutil
import sys

BASE = "/usr/share/quickshell/dms/Modules/DankDash"

FILES = [
    "Overview/Card.qml",
    "Overview/CalendarOverviewCard.qml",
    "MediaPlayerTab.qml",
    "MediaDropdownOverlay.qml",
    "WallpaperTab.qml",
    "WeatherTab.qml",
    "Overview/CalendarEventDetail.qml",
    "Overview/CalendarEventEditor.qml",
]

# Match a border.color line that uses outlineMedium/outlineStrong, followed by
# a hardcoded border.width of 1 or 2.
PATTERN = re.compile(
    r"(border\.color:[^\n]*(?:outlineMedium|outlineStrong)[^\n]*\n)"
    r"([ \t]*border\.width: )(?:1|2)\b"
)
REPL = r"\1\2Theme.layerOutlineWidth"


def main(argv: list[str]) -> int:
    base = argv[1] if len(argv) > 1 else BASE
    total = 0
    for rel in FILES:
        path = os.path.join(base, rel)
        try:
            src = open(path).read()
        except OSError as e:
            print(f"  SKIP {rel}: {e}")
            continue

        new, n = PATTERN.subn(REPL, src)
        if n == 0:
            print(f"  {rel}: no change (already patched or nothing to do)")
            continue

        shutil.copy2(path, path + ".bak")
        with open(path, "w") as f:
            f.write(new)
        print(f"  {rel}: {n} border(s) -> Theme.layerOutlineWidth")
        total += n

    print(f"TOTAL: {total}")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
