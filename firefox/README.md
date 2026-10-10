# Firefox - Dossier

Firefox chrome matching the COSMIC Dossier rice. Same layout as the
Monochrome and DarkGold stylesheets, recoloured for stone grey and rust.

## Palette

| Hex       | Role                      |
|-----------|---------------------------|
| `#D0D0C8` | Frame, page chrome        |
| `#DCDCD4` | Panels, menus             |
| `#C4C4BC` | Hover row                 |
| `#BCBCB4` | Pressed row, separators, menu border |
| `#59574D` | Muted text                |
| `#953B19` | Accent, URL bar border    |
| `#51573B` | Secondary accent, active  |
| `#43432B` | Links                     |
| `#242424` | Body text, hover text     |

## Structure

```
firefox/
├── chrome/
│   ├── userChrome.css    browser UI: rounded corners, solid menu hover
│   └── userContent.css   new tab page: accent colour only
└── install.sh            copies chrome/ into the default profile
```

No WebExtension theme package in this repo. Use Firefox's built-in **Light**
theme plus these stylesheets. If you want the toolbar itself in the palette,
build a theme at [Firefox Color](https://color.firefox.com/) from the
palette above; it installs as an add-on without any coding.

## Setup

```bash
./install.sh
```

Copies `chrome/` into your `*.default-release` profile, backs up anything it
replaces, and adds the required pref to `user.js`. Then **fully restart**
Firefox - `userChrome.css` is parsed only at startup.

Manual equivalent:

1. `about:config` → `toolkit.legacyUserProfileCustomizations.stylesheets` = `true`
2. `about:support` → Profile Directory → Open Directory
3. Copy `chrome/` in
4. Restart

To undo: delete the two files from the profile's `chrome/` folder and restart.

## Notes

- **Never set `--panel-*` or `--arrowpanel-*` on `:root`.** Those variables leak
  into the toolbar and blank the URL bar. They stay on the popup elements.
- **Context menus do not get an extra element border.** A second stroke made
  the right-click panel look detached. Hover is a solid `#C4C4BC` row, not an
  inset ring.
- **`[_moz-menuactive="true"]` is required.** Firefox marks the active
  context-menu row with that attribute, not only `:hover`.
- **`userContent.css` sets colour variables only.** No size or position rules
  on new-tab tiles.
- Built against **Firefox 154**.

## License

MIT, same as the rest of the repo.
