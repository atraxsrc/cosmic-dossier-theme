# Brave - Dossier

A Chromium theme matching the COSMIC Dossier rice, made from the Firefox theme's
colours. Brave, Chrome, Chromium and Edge all take it. No Chrome Web Store
and no Google account: it is loaded straight from this folder.

## Install

1. `brave://extensions` → turn on **Developer mode** (top right)
2. **Load unpacked** → pick `brave/theme`

It applies at once and survives restarts. Brave keeps reading the folder, so
leave the clone where it is; after editing `manifest.json`, press the reload
arrow on the theme's card.

To undo: `brave://settings/appearance` → Theme → **Reset to default**.

A theme replaces GTK / Classic mode in Appearance, and picking GTK or Classic
removes the theme.

### Packed instead

```bash
brave-browser --pack-extension="$PWD/brave/theme"
```

That writes `brave/theme.crx` and `brave/theme.pem` next to the folder (both
are git-ignored). On Linux you can drag the `.crx` onto `brave://extensions`.
The `.pem` is the signing key for later versions, keep it private. Windows and
macOS refuse `.crx` files from outside the store, so use Load unpacked there.

## Palette

Same roles as Noir's Brave theme: icons and inactive tabs take olive, the
active tab text takes rust. The Firefox theme keeps its inactive tabs on
![#59574D](https://placehold.co/12x12/59574d/59574d.png) `#59574D` and its active tab on the text colour; Brave puts both accents on
the tabs, as Noir does.

| Hex       | Where in the theme                                 |
|-----------|----------------------------------------------------|
| ![#D0D0C8](https://placehold.co/12x12/d0d0c8/d0d0c8.png) `#D0D0C8` | Frame, inactive tabs, new tab page (incognito too) |
| ![#DCDCD4](https://placehold.co/12x12/dcdcd4/dcdcd4.png) `#DCDCD4` | Toolbar and active tab                             |
| ![#E4E4DC](https://placehold.co/12x12/e4e4dc/e4e4dc.png) `#E4E4DC` | Address bar                                        |
| ![#242424](https://placehold.co/12x12/242424/242424.png) `#242424` | Bookmark bar text, address bar text, new tab text  |
| ![#51573B](https://placehold.co/12x12/51573b/51573b.png) `#51573B` | Toolbar icons, inactive tab text                   |
| ![#953B19](https://placehold.co/12x12/953b19/953b19.png) `#953B19` | Active tab text, new tab links                     |

Every text colour clears WCAG AA (4.5:1) on its background; the lowest is the
rust new tab links at 4.64:1.

Chromium themes take `[R, G, B]` lists, not hex, so `manifest.json` spells
the colours out as numbers.

## Notes

- **Colours only.** A Chromium theme has no keys for menus, the focus ring,
  the address bar dropdown or text selection; Chromium works those out from
  the frame and toolbar colours, so they stay on Brave's own light colours.
  There is no `userChrome.css` equivalent.
- **Brave's own panels** (Shields, sidebar, wallet, settings) follow Brave's
  colour setting, not the theme. Set `brave://settings/appearance` → Brave
  colors → **Light**, or they open dark on a light frame.
- **Brave's new tab page** is Brave's own and may ignore `ntp_background`.
  Pick a background on the page itself: **Customize** → Background image.
- **Web pages** are not themed and keep their own colours. Leave
  `brave://flags/#enable-force-dark` off on a light rice.
- Built against **Brave 1.98 (Chromium 155)**.

## License

MIT, same as the rest of the repo.
