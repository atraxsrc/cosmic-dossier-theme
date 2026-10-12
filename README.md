<div align="center">

# COSMIC · Dossier

Pop!_OS 24.04 on COSMIC in stone grey, olive and rust: desktop, terminal,
shell, Firefox, cursor, wallpapers. The light half of a pair; the dark half is
[cosmic-noir-theme](https://github.com/atraxsrc/cosmic-noir-theme).

![Pop!_OS](https://img.shields.io/badge/Pop!_OS-24.04_LTS-953b19?style=for-the-badge&logo=popos&logoColor=white)
![COSMIC](https://img.shields.io/badge/COSMIC-1.0.0-51573b?style=for-the-badge)
![Dossier](https://img.shields.io/badge/Theme-Dossier-d0d0c8?style=for-the-badge&labelColor=953b19)
![Firefox](https://img.shields.io/badge/Firefox-Dossier-953b19?style=for-the-badge&logo=firefox-browser&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-59574d?style=for-the-badge)

</div>

---
![Pop!_OS COSMIC desktop with the Dossier theme](assets/screenshot.png)

## Palette

From the Omarchy [The Greek](https://github.com/HANCORE-linux/omarchy-thegreek-theme)
theme: manila-grey paper, dark olive, a rust accent. Text roles use the
upstream's darker rust and a deeper red so everything reads at 4.5:1 or
better on the window background; the brighter upstream orange stays for the
window hint, the terminal cursor and btop highlights.

| Role | Color | Hex |
|------|-------|-----|
| Background | ![#d0d0c8](https://placehold.co/12x12/d0d0c8/d0d0c8.png) Stone | `#D0D0C8` |
| Containers | ![#dcdcd4](https://placehold.co/12x12/dcdcd4/dcdcd4.png) Paper / Card | `#DCDCD4` / `#E4E4DC` |
| Text | ![#242424](https://placehold.co/12x12/242424/242424.png) Ink | `#242424` |
| Accent | ![#953b19](https://placehold.co/12x12/953b19/953b19.png) Rust | `#953B19` |
| Highlight | ![#de6a41](https://placehold.co/12x12/de6a41/de6a41.png) Orange (borders, cursor) | `#DE6A41` |
| Success | ![#51573b](https://placehold.co/12x12/51573b/51573b.png) Olive | `#51573B` |
| Warning | ![#754e3e](https://placehold.co/12x12/754e3e/754e3e.png) Brown | `#754E3E` |
| Error | ![#a80026](https://placehold.co/12x12/a80026/a80026.png) Red | `#A80026` |
| Khaki | ![#43432b](https://placehold.co/12x12/43432b/43432b.png) Directories | `#43432B` |
| Wine | ![#6b1f2f](https://placehold.co/12x12/6b1f2f/6b1f2f.png) Symlinks | `#6B1F2F` |
| Muted | ![#59574d](https://placehold.co/12x12/59574d/59574d.png) Secondary text | `#59574D` |
| Dim | ![#6b7360](https://placehold.co/12x12/6b7360/6b7360.png) Comments | `#6B7360` |

| Role | Dossier | Noir |
|------|---------|------|
| Background | `#D0D0C8` | `#171717` |
| Text | `#242424` | `#CCD0CF` |
| Accent | `#953B19` | `#F25623` |
| Success | `#51573B` | `#88A57D` |

---

## Repo Structure

```
.
├── btop
│   └── Dossier.theme            # btop colour theme
├── cosmic
│   ├── Dossier.ron              # COSMIC Appearance import (Light)
│   ├── config/                  # baseline settings: fonts, icons, terminal look
│   └── install.sh
├── cosmic-term
│   └── Dossier-term.ron         # COSMIC Terminal colour scheme (Light)
├── cursors
│   ├── Oxygen-16-Silver-Grey/   # cursor theme, patched for COSMIC apps
│   ├── install.sh
│   ├── uninstall.sh
│   └── README.md
├── icons
│   └── install.sh               # Cosmic-Dossier icon pack from cosmic-icon-themes
├── fastfetch
│   ├── config.jsonc             # rust / khaki fastfetch config
│   ├── cosmic.txt               # COSMIC logo
│   └── install.sh
├── firefox
│   ├── theme                    # Cosmic Dossier theme add-on (manifest + icons)
│   ├── chrome
│   │   ├── userChrome.css       # rounded chrome, paper menus, rust hover
│   │   └── userContent.css      # new tab accents, blank tiles
│   ├── install.sh
│   └── README.md
├── lsd
│   ├── config.yaml              # theme: custom
│   ├── colors.yaml              # permission / size / date / git columns
│   └── install.sh
├── nvim                         # Neovim colorscheme, LazyVim spec, RON syntax, install.sh
├── scripts
│   └── update_system.sh         # nala + flatpak, dark ANSI for a light terminal
├── zsh
│   ├── dossier.zsh              # LS_COLORS, highlighting colours, aliases, starship
│   └── install.sh
├── assets
│   ├── cursors/                 # cursor preview
│   ├── screenshot.png           # README screenshot
│   └── wallpaper.png            # the samurai on the bare desktop
├── docs
│   └── showcase.md              # the rice describing itself, for the Postilla pane of the screenshot
├── LICENSE
└── README.md
```

---

## COSMIC Desktop

This is a **Light** theme, so it goes in COSMIC's Light slot:

Settings → Desktop → Appearance → **Light** → **Import** → `cosmic/Dossier.ron`

Accent is rust `#953B19`; the window hint border is the brighter `#DE6A41`.
Use the `+` control if you want a custom swatch.

Frosted glass is on in the `.ron` at `frosted: Low` with an opacity table of
0.66 to 0.96, tinted with the palette's middle neutral, for windows, panel,
applets and system UI (maximized apps stay solid), and corners are squared
(`radius_*: 2.0`), the same as the DarkGold baseline. Adjust frosted glass on
Appearance → Style → Frosted glass after import; those sliders survive a theme switch.

Export from Appearance if you tweak backgrounds / tints so you do not lose them.

Pairing tip: import `Noir.ron` from
[cosmic-noir-theme](https://github.com/atraxsrc/cosmic-noir-theme) into the
Dark slot and COSMIC's Dark / Light toggle flips between the two. Wallpaper,
Firefox and the shell layer do not follow the toggle; those are per-rice files.

### Baseline settings

`cosmic/config/` holds the settings that make up the look and rarely change
(panel, dock, applets and shortcuts are left out on purpose):

| Where | Setting |
|-------|---------|
| Fonts | Interface `Maple Normal UI`, monospace `Maple Mono Normal NFM` |
| Icons | Cosmic-Dossier-Rust |
| Windows | Minimize / maximize buttons hidden, theme applied to GNOME apps |
| Terminal | Maple Mono 15 (weights 500 / bold 800 / dim 300), 77% opacity, no header bar, Dossier (light scheme) |

Install the [Maple fonts](https://github.com/subframe7536/maple-font) and the
Cosmic-Dossier icons (see Icons below) and import the terminal scheme first, then:

```bash
./cosmic/install.sh
```

It backs up each file it replaces to `*.bak` and COSMIC applies it live.

---

## COSMIC Terminal

The desktop `.ron` does not colour ANSI text.

1. COSMIC Terminal → **View → Color schemes…** (not Settings → Appearance)
2. **Light** tab → **Import** → `cosmic-term/Dossier-term.ron`
3. View → Settings → Appearance → Color scheme (light) → **Dossier**

If a profile is set as default, set the scheme on that profile too or the
dropdown will look like it did nothing.

Ink text on stone grey; red for errors, olive for strings and success, rust in
the yellow slot, khaki for directories, wine for cyan. Bright colours are
deeper, dim colours lighter, so bold and dim still read on a light background.

---

## Firefox

Two layers:

1. **Theme (colours):** install
   **[cosmic-dossier-theme on addons.mozilla.org](https://addons.mozilla.org/en-US/firefox/addon/cosmic-dossier-theme/)**.
   This is the main look.
2. **Stylesheets (optional):** `firefox/chrome/` adds rounded corners, rust
   menu hover, rust accents and blank new-tab tiles on top of the add-on
   (they also work with Firefox's built-in Light theme):

```bash
./firefox/install.sh
```

Fully quit Firefox afterward. Details and CSS rules: [`firefox/README.md`](firefox/README.md).

---

## Cursor

**Oxygen-16-Silver-Grey**, a near-black Oxygen that sits with the ink text,
patched with the cursor names COSMIC apps ask for. COSMIC has no cursor picker
yet, so the script sets it:

```bash
./cursors/install.sh
reboot
```

Why the patch, what the script touches and how to undo it:
[`cursors/README.md`](cursors/README.md).

---

## Scripts

### `update_system.sh`

nala + flatpak updater. Headers in rust, info in khaki, success in olive,
errors in red; the banner ramps from dark olive to rust. All dark enough for a
light terminal.

```bash
chmod +x scripts/update_system.sh
./scripts/update_system.sh
```

---

## Terminal extras

Need a [Nerd Font](https://www.nerdfonts.com/) in the terminal for the icons
(Maple Mono NFM in the baseline above).

### zsh

`zsh/dossier.zsh` is the rice part of the shell only: `LS_COLORS` (also used
by lsd for file names and by the completion menu), rust / olive / red colours
for zsh-autosuggestions and zsh-syntax-highlighting, lsd / bat / nvim aliases
and the starship prompt. Your own `~/.zshrc` stays private and sources it.

Needs zsh + [oh-my-zsh](https://ohmyz.sh/). `install.sh` clones the two
plugins if missing and appends one `source` line to `~/.zshrc` (backup in
`~/.zshrc.bak`):

```bash
./zsh/install.sh
exec zsh
```

In `~/.zshrc` keep `ZSH_THEME=""` and
`plugins=(git sudo zsh-autosuggestions zsh-syntax-highlighting)`.

### lsd

File names are coloured by `LS_COLORS` from `zsh/dossier.zsh`;
`lsd/colors.yaml` colours the other columns with the 256-colour codes nearest
the palette (130 rust, 58 olive, 88 red, 95 brown, 240 khaki, 241 muted,
245 dim). lsd 1.0.0 does not accept `#hex` there.

```bash
./lsd/install.sh
lsd -l
```

### fastfetch

COSMIC logo in rust, Hardware / Software / Age boxes in pale grey with khaki
keys. `install.sh` backs up any existing `~/.config/fastfetch/config.jsonc`
to `config.jsonc.bak`.

```bash
./fastfetch/install.sh
fastfetch
```

### Neovim

`nvim/` carries the rice into Neovim: a dependency-free colorscheme built from
the palette (`nvim/colors/dossier.lua`), a LazyVim spec that selects it and makes
sure the treesitter parsers for the files in this repo are installed
(`nvim/lua/plugins/dossier.lua`), and a small RON syntax file so `cosmic/*.ron`
is coloured even before the parser exists. `:terminal` inside Neovim uses the
Dossier scheme.

```bash
./nvim/install.sh
# restart nvim; LazyVim switches to the dossier colorscheme
```

Without LazyVim, copy `nvim/colors/dossier.lua` to `~/.config/nvim/colors/` and
run `:colorscheme dossier`.

### btop

`btop/Dossier.theme`: stone background, dark olive boxes, orange highlights,
meters ramp from olive through rust to red.

```bash
mkdir -p ~/.config/btop/themes
cp btop/Dossier.theme ~/.config/btop/themes/
# btop → Esc → Options → Color theme → Dossier
```

---

## Icons and wallpaper

Icons: **Cosmic-Dossier**, the [Kanagawa icons](https://github.com/Fausto-Korpsvart/Kanagawa-GKT-Theme/tree/main/icons/Kanagawa)
by Fausto Korpsvart recolored to this palette in
[cosmic-icon-themes](https://github.com/atraxsrc/cosmic-icon-themes). Folders come in
three colors: **Rust** `#953B19` (default), **Olive** `#51573B` and **Ink** `#242424` with orange symbols.

![Cosmic-Dossier folder colors](https://raw.githubusercontent.com/atraxsrc/cosmic-icon-themes/main/previews/Cosmic-Dossier.png)

```bash
./icons/install.sh                  # Rust folders
./icons/install.sh --variant Olive  # or Ink
```

It downloads the pack from the latest cosmic-icon-themes release, checks its SHA256,
installs it to `~/.local/share/icons/` and sets it as the COSMIC icon theme.
Restart open apps afterwards (Files caches icons per window).
Add `--system` to install to `/usr/share/icons` instead, for every user and the
login screen (asks for sudo); `--user` is the default.

Wallpapers live in [cool-wallpapers](https://github.com/atraxsrc/cool-wallpapers).
This rice's own set is in [`cosmic/dossier/`](https://github.com/atraxsrc/cool-wallpapers/tree/main/cosmic/dossier):

| File | What it is |
|------|------------|
| [`dossier-eagle-3584x2016.png`](https://github.com/atraxsrc/cool-wallpapers/blob/main/cosmic/dossier/dossier-eagle-3584x2016.png) | Ink eagle head with rust splashes on stone grey |
| [`dossier-samurai-3744x2112.png`](https://github.com/atraxsrc/cool-wallpapers/blob/main/cosmic/dossier/dossier-samurai-3744x2112.png) | Ink samurai with a crow, rust accents, the one in the screenshot |
| [`dossier-anime-3744x2112.png`](https://github.com/atraxsrc/cool-wallpapers/blob/main/cosmic/dossier/dossier-anime-3744x2112.png) | Ink portrait, grey hair, rust accents |
| [`dossier-reaper-skull-3440x1440.png`](https://github.com/atraxsrc/cool-wallpapers/blob/main/cosmic/dossier/dossier-reaper-skull-3440x1440.png) | Harbor Dark reaper in khaki and rust |


From the upstream theme, folder
[`omarchy/the-greek/`](https://github.com/atraxsrc/cool-wallpapers/tree/main/omarchy/the-greek)
(MIT, licence in the folder), all ink drawings on the same stone grey as the theme:

| File | What it is |
|------|------------|
| [`the-greek-bg1-3840x2160.jpg`](https://github.com/atraxsrc/cool-wallpapers/blob/main/omarchy/the-greek/the-greek-bg1-3840x2160.jpg) | Ink eagle head |
| [`the-greek-bg3-3840x2160.jpg`](https://github.com/atraxsrc/cool-wallpapers/blob/main/omarchy/the-greek/the-greek-bg3-3840x2160.jpg) | Ink samurai with a crow |
| [`the-greek-bg2-3840x2160.jpg`](https://github.com/atraxsrc/cool-wallpapers/blob/main/omarchy/the-greek/the-greek-bg2-3840x2160.jpg) | Ink portrait, grey hair |

`bg1-1` to `bg1-3` are variants of the eagle. Settings → Wallpaper → Add image → the file you downloaded.

![The samurai wallpaper on the Dossier desktop, panel only](assets/wallpaper.png)

---

## Setup

```bash
git clone https://github.com/atraxsrc/cosmic-dossier-theme.git
cd cosmic-dossier-theme

# desktop
# Settings → Appearance → Light → Import cosmic/Dossier.ron

# terminal
# View → Color schemes → Light tab → Import cosmic-term/Dossier-term.ron

# firefox add-on
# https://addons.mozilla.org/en-US/firefox/addon/cosmic-dossier-theme/

# optional extra chrome
./firefox/install.sh

# cursor (then reboot), see cursors/README.md
./cursors/install.sh

# shell + terminal tools (see Terminal extras above)
./zsh/install.sh
./lsd/install.sh
./fastfetch/install.sh
./nvim/install.sh
mkdir -p ~/.config/btop/themes && cp btop/Dossier.theme ~/.config/btop/themes/

# wallpaper
# Settings → Wallpaper → Add image → a file from
# https://github.com/atraxsrc/cool-wallpapers/tree/main/cosmic/dossier

./icons/install.sh                  # icons (see Icons above)
# Maple fonts (https://github.com/subframe7536/maple-font), then
# fonts, icons, terminal look from cosmic/config/
./cosmic/install.sh
```

---

## Stack

| Tool | What it does |
|------|-------------|
| [Pop!_OS 24.04](https://pop.system76.com/) | Base OS by System76 |
| [COSMIC DE](https://system76.com/cosmic) | Desktop environment |
| [oh-my-zsh](https://ohmyz.sh/) | zsh framework + plugins |
| [lsd](https://github.com/lsd-rs/lsd) | `ls` with icons and colours |
| [fastfetch](https://github.com/fastfetch-cli/fastfetch) | System info |
| [btop](https://github.com/aristocratos/btop) | Resource monitor |
| [cosmic-icon-themes](https://github.com/atraxsrc/cosmic-icon-themes) | Icon pack (Cosmic-Dossier), recolored from [Kanagawa icons](https://github.com/Fausto-Korpsvart/Kanagawa-GKT-Theme/tree/main/icons/Kanagawa) |
| [Oxygen-Cursors](https://github.com/wo2ni/Oxygen-Cursors) | Cursor (silver grey) |

## Credits

- Palette and wallpapers: [omarchy-thegreek-theme](https://github.com/HANCORE-linux/omarchy-thegreek-theme)
  by HANCORE-linux (MIT). This repo is a COSMIC port with contrast-adjusted
  text colours; the wallpapers are mirrored in cool-wallpapers, not here.
- Dark half: [cosmic-noir-theme](https://github.com/atraxsrc/cosmic-noir-theme).
  Shared baseline (frosted glass, squared corners, fonts) from
  [cosmic-darkgold-theme](https://github.com/atraxsrc/cosmic-darkgold-theme).

## License

MIT. The cursor artwork keeps the terms of KDE's Oxygen project, see
[`cursors/README.md`](cursors/README.md).
