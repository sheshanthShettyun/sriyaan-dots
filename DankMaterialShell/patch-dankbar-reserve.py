#!/usr/bin/env python3
"""Patch DMS DankBar: reserve screen space while the auto-hidden bar is revealed.

Changes the exclusiveZone binding so that, in auto-hide mode, the top bar
reserves its space (pushing windows down) only while it is revealed (hovered),
instead of always overlaying. A .bak backup is written alongside the file so
the change can be reverted.

Run as root:  sudo python3 patch-dankbar-reserve.py
"""

import shutil
import sys

PATH = "/usr/share/quickshell/dms/Modules/DankBar/DankBarWindow.qml"

OLD = (
    "    exclusiveZone: (!(barConfig?.visible ?? true) || "
    "(topBarCore.autoHide && !barWindow.reserveExclusiveWhenAutoHidden)) ? -1 : "
    "(barWindow.effectiveBarThickness + effectiveSpacing + "
    "(usesFrameBarChrome ? 0 : (barConfig?.bottomGap ?? 0)))"
)

NEW = (
    "    readonly property int reserveZoneAmount: barWindow.effectiveBarThickness "
    "+ effectiveSpacing + (usesFrameBarChrome ? 0 : (barConfig?.bottomGap ?? 0))\n"
    "\n"
    "    exclusiveZone: {\n"
    "        if (!(barConfig?.visible ?? true))\n"
    "            return -1;\n"
    "        if (topBarCore.autoHide && !barWindow.reserveExclusiveWhenAutoHidden)\n"
    "            return inputMask.showing ? barWindow.reserveZoneAmount : -1;\n"
    "        return barWindow.reserveZoneAmount;\n"
    "    }"
)


def main() -> int:
    try:
        src = open(PATH).read()
    except OSError as e:
        print(f"ERROR: cannot read {PATH}: {e}")
        return 1

    if OLD not in src:
        print("ERROR: target line not found (already patched, or DMS updated).")
        return 1

    backup = PATH + ".bak"
    shutil.copy2(PATH, backup)
    print(f"backup written to {backup}")

    src = src.replace(OLD, NEW, 1)
    with open(PATH, "w") as f:
        f.write(src)
    print("patched exclusiveZone (reserve-on-reveal).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
