-- Converted from binds.conf by hyprconf2lua + manual review
-- Classic `resizeactive` percentage/exact mode has no direct Lua API,
-- so these are implemented against the active monitor at press time.

local function resize_delta_pct(wpct, hpct)
    return function()
        local mon = hl.get_active_monitor()
        if mon then
            hl.dispatch(hl.dsp.window.resize({
                x = math.floor(mon.width * wpct),
                y = math.floor(mon.height * hpct),
                relative = true,
            }))
        end
    end
end

local function resize_abs_pct(wpct, hpct)
    return function()
        local mon = hl.get_active_monitor()
        if mon then
            hl.dispatch(hl.dsp.window.resize({
                x = math.floor(mon.width * wpct),
                y = math.floor(mon.height * hpct),
            }))
        end
    end
end

-- === Application Launchers ===
hl.bind("SUPER" .. " + " .. "T", hl.dsp.exec_cmd("ghostty"))
hl.bind("SUPER" .. " + " .. "space", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind("SUPER" .. " + " .. "V", hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind("SUPER" .. " + " .. "M", hl.dsp.exec_cmd("dms ipc call processlist focusOrToggle"))
hl.bind("SUPER" .. " + " .. "comma", hl.dsp.exec_cmd("dms ipc call settings focusOrToggle"))
hl.bind("SUPER" .. " + " .. "N", hl.dsp.exec_cmd("dms ipc call notifications toggle"))
hl.bind("SUPER + SHIFT" .. " + " .. "N", hl.dsp.exec_cmd("dms ipc call notepad toggle"))
hl.bind("SUPER" .. " + " .. "Y", hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"))
hl.bind("SUPER" .. " + " .. "TAB", hl.dsp.exec_cmd("dms ipc call hypr toggleOverview"))
hl.bind("SUPER" .. " + " .. "X", hl.dsp.exec_cmd("dms ipc call powermenu toggle"))

-- === Cheat sheet ===
hl.bind("SUPER + SHIFT" .. " + " .. "Slash", hl.dsp.exec_cmd("dms ipc call keybinds toggle hyprland"))

-- === Security ===
hl.bind("SUPER + ALT" .. " + " .. "L", hl.dsp.exec_cmd("dms ipc call lock lock"))
hl.bind("SUPER + SHIFT" .. " + " .. "E", hl.dsp.exit())
hl.bind("CTRL + ALT" .. " + " .. "Delete", hl.dsp.exec_cmd("dms ipc call processlist focusOrToggle"))

-- === Audio Controls ===
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("dms ipc call audio increment 3"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("dms ipc call audio decrement 3"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("dms ipc call audio mute"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("dms ipc call audio micmute"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("dms ipc call mpris playPause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("dms ipc call mpris playPause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("dms ipc call mpris previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("dms ipc call mpris next"), { locked = true })
hl.bind("CTRL" .. " + " .. "XF86AudioRaiseVolume", hl.dsp.exec_cmd("dms ipc call mpris increment 3"), { locked = true, repeating = true })
hl.bind("CTRL" .. " + " .. "XF86AudioLowerVolume", hl.dsp.exec_cmd("dms ipc call mpris decrement 3"), { locked = true, repeating = true })

-- === Brightness Controls ===
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("dms ipc call brightness increment 5"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("dms ipc call brightness decrement 5"), { locked = true, repeating = true })

-- === Window Management ===
hl.bind("SUPER" .. " + " .. "Q", hl.dsp.window.close())
hl.bind("SUPER" .. " + " .. "F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind("SUPER + SHIFT" .. " + " .. "F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind("SUPER + SHIFT" .. " + " .. "T", hl.dsp.window.float())
hl.bind("SUPER" .. " + " .. "W", hl.dsp.group.toggle())
hl.bind("SUPER + SHIFT" .. " + " .. "W", hl.dsp.exec_cmd("dms ipc call window-rules toggle"))

-- === Focus Navigation ===
hl.bind("SUPER" .. " + " .. "left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER" .. " + " .. "down", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER" .. " + " .. "up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER" .. " + " .. "right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER" .. " + " .. "H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER" .. " + " .. "J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER" .. " + " .. "K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER" .. " + " .. "L", hl.dsp.focus({ direction = "right" }))

-- === Window Movement ===
hl.bind("SUPER + SHIFT" .. " + " .. "left", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT" .. " + " .. "down", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + SHIFT" .. " + " .. "up", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT" .. " + " .. "right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT" .. " + " .. "H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT" .. " + " .. "J", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + SHIFT" .. " + " .. "K", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT" .. " + " .. "L", hl.dsp.window.move({ direction = "right" }))

-- === Column Navigation ===
hl.bind("SUPER" .. " + " .. "Home", hl.dsp.focus({ window = "first" }))
hl.bind("SUPER" .. " + " .. "End", hl.dsp.focus({ window = "last" }))

-- === Monitor Navigation ===
hl.bind("SUPER + CTRL" .. " + " .. "left", hl.dsp.focus({ monitor = "l" }))
hl.bind("SUPER + CTRL" .. " + " .. "right", hl.dsp.focus({ monitor = "r" }))
hl.bind("SUPER + CTRL" .. " + " .. "H", hl.dsp.focus({ monitor = "l" }))
hl.bind("SUPER + CTRL" .. " + " .. "J", hl.dsp.focus({ monitor = "d" }))
hl.bind("SUPER + CTRL" .. " + " .. "K", hl.dsp.focus({ monitor = "u" }))
hl.bind("SUPER + CTRL" .. " + " .. "L", hl.dsp.focus({ monitor = "r" }))

-- === Move to Monitor ===
hl.bind("SUPER + SHIFT + CTRL" .. " + " .. "left", hl.dsp.window.move({ monitor = "l" }))
hl.bind("SUPER + SHIFT + CTRL" .. " + " .. "down", hl.dsp.window.move({ monitor = "d" }))
hl.bind("SUPER + SHIFT + CTRL" .. " + " .. "up", hl.dsp.window.move({ monitor = "u" }))
hl.bind("SUPER + SHIFT + CTRL" .. " + " .. "right", hl.dsp.window.move({ monitor = "r" }))
hl.bind("SUPER + SHIFT + CTRL" .. " + " .. "H", hl.dsp.window.move({ monitor = "l" }))
hl.bind("SUPER + SHIFT + CTRL" .. " + " .. "J", hl.dsp.window.move({ monitor = "d" }))
hl.bind("SUPER + SHIFT + CTRL" .. " + " .. "K", hl.dsp.window.move({ monitor = "u" }))
hl.bind("SUPER + SHIFT + CTRL" .. " + " .. "L", hl.dsp.window.move({ monitor = "r" }))

-- === Workspace Navigation ===
hl.bind("SUPER" .. " + " .. "Page_Down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER" .. " + " .. "Page_Up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER" .. " + " .. "U", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER" .. " + " .. "I", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + CTRL" .. " + " .. "down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("SUPER + CTRL" .. " + " .. "up", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind("SUPER + CTRL" .. " + " .. "U", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("SUPER + CTRL" .. " + " .. "I", hl.dsp.window.move({ workspace = "e-1" }))

-- === Workspace Management ===
hl.bind("CTRL + SHIFT" .. " + " .. "R", hl.dsp.exec_cmd("dms ipc call workspace-rename open"))

-- === Move Workspaces ===
hl.bind("SUPER + SHIFT" .. " + " .. "Page_Down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("SUPER + SHIFT" .. " + " .. "Page_Up", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind("SUPER + SHIFT" .. " + " .. "U", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("SUPER + SHIFT" .. " + " .. "I", hl.dsp.window.move({ workspace = "e-1" }))

-- === Mouse Wheel Navigation ===
hl.bind("SUPER" .. " + " .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER" .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + CTRL" .. " + " .. "mouse_down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("SUPER + CTRL" .. " + " .. "mouse_up", hl.dsp.window.move({ workspace = "e-1" }))

-- === Numbered Workspaces ===
hl.bind("SUPER" .. " + " .. "1", hl.dsp.focus({ workspace = "1" }))
hl.bind("SUPER" .. " + " .. "2", hl.dsp.focus({ workspace = "2" }))
hl.bind("SUPER" .. " + " .. "3", hl.dsp.focus({ workspace = "3" }))
hl.bind("SUPER" .. " + " .. "4", hl.dsp.focus({ workspace = "4" }))
hl.bind("SUPER" .. " + " .. "5", hl.dsp.focus({ workspace = "5" }))
hl.bind("SUPER" .. " + " .. "6", hl.dsp.focus({ workspace = "6" }))
hl.bind("SUPER" .. " + " .. "7", hl.dsp.focus({ workspace = "7" }))
hl.bind("SUPER" .. " + " .. "8", hl.dsp.focus({ workspace = "8" }))
hl.bind("SUPER" .. " + " .. "9", hl.dsp.focus({ workspace = "9" }))

-- === Move to Numbered Workspaces ===
hl.bind("SUPER + SHIFT" .. " + " .. "1", hl.dsp.window.move({ workspace = "1" }))
hl.bind("SUPER + SHIFT" .. " + " .. "2", hl.dsp.window.move({ workspace = "2" }))
hl.bind("SUPER + SHIFT" .. " + " .. "3", hl.dsp.window.move({ workspace = "3" }))
hl.bind("SUPER + SHIFT" .. " + " .. "4", hl.dsp.window.move({ workspace = "4" }))
hl.bind("SUPER + SHIFT" .. " + " .. "5", hl.dsp.window.move({ workspace = "5" }))
hl.bind("SUPER + SHIFT" .. " + " .. "6", hl.dsp.window.move({ workspace = "6" }))
hl.bind("SUPER + SHIFT" .. " + " .. "7", hl.dsp.window.move({ workspace = "7" }))
hl.bind("SUPER + SHIFT" .. " + " .. "8", hl.dsp.window.move({ workspace = "8" }))
hl.bind("SUPER + SHIFT" .. " + " .. "9", hl.dsp.window.move({ workspace = "9" }))

-- === Column Management ===
hl.bind("SUPER" .. " + " .. "bracketleft", hl.dsp.layout("preselect l"))
hl.bind("SUPER" .. " + " .. "bracketright", hl.dsp.layout("preselect r"))

-- === Sizing & Layout ===
hl.bind("SUPER" .. " + " .. "R", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + CTRL" .. " + " .. "F", resize_abs_pct(1, 1))

-- === Move/resize windows with mouse ===
hl.bind("SUPER" .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window" })
hl.bind("SUPER" .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })

-- === Manual Sizing ===
hl.bind("SUPER" .. " + " .. "minus", resize_delta_pct(-0.1, 0), { repeating = true })
hl.bind("SUPER" .. " + " .. "equal", resize_delta_pct(0.1, 0), { repeating = true })
hl.bind("SUPER + SHIFT" .. " + " .. "minus", resize_delta_pct(0, -0.1), { repeating = true })
hl.bind("SUPER + SHIFT" .. " + " .. "equal", resize_delta_pct(0, 0.1), { repeating = true })

-- === Screenshots ===
hl.bind("SUPER + SHIFT" .. " + " .. "S", hl.dsp.exec_cmd("dms screenshot"))
hl.bind("CTRL" .. " + " .. "Print", hl.dsp.exec_cmd("dms screenshot full"))
hl.bind("ALT" .. " + " .. "Print", hl.dsp.exec_cmd("dms screenshot window"))

-- === System Controls ===
hl.bind("SUPER + SHIFT" .. " + " .. "P", hl.dsp.dpms({ action = "toggle" }))
hl.bind("ALT" .. " + " .. "TAB", hl.dsp.focus({ last = true }))
hl.bind("CTRL + ALT" .. " + " .. "T", hl.dsp.exec_cmd("ghostty"))
hl.bind("SUPER" .. " + " .. "E", hl.dsp.exec_cmd("nautilus"))
