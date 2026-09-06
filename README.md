# sriyaan-dots

My Hyprland + DankMaterialShell + terminal dotfiles. Public, secrets redacted.

## Contents

- `hypr/hyprland.lua` — Hyprland Lua config (gaps, decoration, window/layer rules, DMS sources)
- `hypr/dms/` — DMS-managed hypr modules (`binds`, `binds-user`, `colors`, `cursor`, `layout`, `outputs`, `windowrules`)
- `DankMaterialShell/settings.json` — DMS settings, Main Bar `autoHide: true, autoHideDelay: 250`
- `DankMaterialShell/patch-dankbar-reserve.py` — hover-reveal reserves screen space (see [dms-hover-bar](https://github.com/sheshanthShettyun/dms-hover-bar))
- `DankMaterialShell/patch-dankdash-borders.py` — DankDash border fix (see [dms-dankdash-border](https://github.com/sheshanthShettyun/dms-dankdash-border))
- `DankMaterialShell/plugin_settings.example.json` — plugin settings template (tokens redacted, copy to `plugin_settings.json` and fill in)
- `ghostty/config` + `ghostty/themes/dankcolors` — Ghostty terminal
- `kitty/dank-tabs.conf` + `kitty/dank-theme.conf` — Kitty theme/tabs

## Bar auto-hide

`DankMaterialShell/settings.json` → `barConfigs[0]`:

```json
{
  "autoHide": true,
  "autoHideDelay": 250,
  "autoHideStrict": false,
  "showOnWindowsOpen": true
}
```

## Install

```bash
git clone https://github.com/sheshanthShettyun/sriyaan-dots.git ~/sriyaan-dots
./install.sh
```

`install.sh` symlinks everything into `~/.config/` (backs up existing files with `.bak`).
Targets: `hypr`, `DankMaterialShell/settings.json`, `ghostty`, `kitty`.
