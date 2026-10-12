# Firefox - Dossier

Firefox chrome matching the COSMIC Dossier rice. Ported from the DarkGold
baseline (theme recipe and stylesheets), recoloured for stone paper and rust.
The light half of [Noir](https://github.com/atraxsrc/cosmic-noir-theme).

## Palette

Stylesheets:

| Hex       | Role                      |
|-----------|---------------------------|
| `#D0D0C8` | Frame, page chrome        |
| `#DCDCD4` | Panels, menus             |
| `#D1C4B8` | Menu hover row (rust tinted into the panel) |
| `#CCB9AB` | Menu pressed row          |
| `#BCBCB4` | Separators, menu border   |
| `#953B19` | Accent, URL bar border, hover rail |
| `#754E3E` | Button hover (brown)      |
| `#51573B` | New tab accent, active    |
| `#43432B` | Menu text and links (khaki, where DarkGold uses cream) |
| `#242424` | Hover text                |
| `#E4E4DC` | Text on rust              |

## Structure

```
firefox/
├── theme/            WebExtension theme source (Cosmic Dossier)
│   ├── manifest.json     harbordark's 24 colour keys + a pinned URL bar ring
│   └── icons/            32 / 48 / 64 / 96 / 128, cropped from dossier-eagle
├── chrome/
│   ├── userChrome.css    browser UI: rounded corners, rust menu hover
│   └── userContent.css   new tab page: rust accents, blank shortcut tiles
└── install.sh            copies chrome/ into the default profile
```

Two layers, use one or both:

1. **Theme (colours):** Cosmic Dossier colours the toolbar, tabs, URL bar,
   menus, sidebar and new tab page. This is the main look.
2. **Stylesheets (optional):** `chrome/` adds rounded corners, rust menu
   hover, rust accents and a blank new-tab grid on top of the theme. They
   also work with Firefox's built-in Light theme.

## Theme

Same colour keys and roles as DarkGold's harbordark and Noir: icons take the
calm accent (olive here, sage in Noir, gold in DarkGold), and everything
"hot" (tab line, pressed button, menu and sidebar selection, loading) takes
the loud one (rust here, orange in Noir, coral in DarkGold). The brighter
upstream orange `#DE6A41` is too faint for a ring on the paper field (2.6:1),
so rust does that job. One extra key, `toolbar_field_border_focus`, pins the
focused URL bar ring to rust so it does not fall back to the desktop accent
when `widget.non-native-theme.use-theme-accent` is on (the Firefox default on
Linux). Every text colour clears WCAG AA (4.5:1) on its background; icons
and the tab line clear 3:1.

| Hex       | Where in the theme                          |
|-----------|---------------------------------------------|
| `#D0D0C8` | Frame, new tab                              |
| `#DCDCD4` | Toolbar, menus                              |
| `#E4E4DC` | URL bar field, text on rust selections      |
| `#C4C4BC` | Button hover                                |
| `#BCBCB4` | Sidebar border                              |
| `#98988F` | Menu border                                 |
| `#242424` | Body text                                   |
| `#59574D` | Inactive tab text                           |
| `#51573B` | Icons                                       |
| `#953B19` | Focused URL bar ring, tab line, pressed button, menu and sidebar selection, loading, attention |

Build the package:

```bash
cd theme && zip -r -X ../cosmic-dossier.zip . -x '.*'
```

Try it without installing: `about:debugging#/runtime/this-firefox` → **Load
Temporary Add-on** → pick `theme/manifest.json`. It is gone on restart.

## Stylesheets

```bash
./install.sh
```

Copies `chrome/` into your `*.default-release` profile, backs up anything it
replaces, and adds two prefs to `user.js`: one so Firefox reads the
stylesheets, one so the accent (URL bar ring, buttons) comes from the theme
and not the desktop. Then **fully restart**
Firefox - `userChrome.css` is parsed only at startup.

To install into another profile (a test profile, say), pass its folder:

```bash
./install.sh ~/.mozilla/firefox/<profile>
```

Every rice's `install.sh` takes the same argument, so switching a test
profile between rices is one command plus a restart.

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
  the right-click panel look detached. Hover is a rust-tinted `#D1C4B8` row
  with a 3px rust rail on the left, not a full ring.
- **Native menu styling is switched off** (`appearance: none`) on menus and
  menu rows. Without it the COSMIC/GTK hover paints over the colours above.
- **`[_moz-menuactive="true"]` is required.** Firefox marks the active
  context-menu row with that attribute, not only `:hover`.
- **`userContent.css` is colours plus one hide rule.** It sets accent / focus /
  link colours and hides shortcut artwork (`opacity: 0`) so the new-tab tiles
  stay blank. No size or position rules on the tiles.
- Built against **Firefox 154**.

## License

MIT, same as the rest of the repo.
