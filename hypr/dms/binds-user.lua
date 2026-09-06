-- DMS user keybind overrides (edit via Control Center or dms; do not remove this header)

hl.unbind("XF86MonBrightnessDown")
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("dms ipc call brightness decrement 5"), { locked = true, repeating = true, description = "dms ipc call brightness decrement 5" })
