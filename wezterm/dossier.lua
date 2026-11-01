-- Dossier for WezTerm, part of cosmic-dossier-theme (MIT).
-- Colours follow the COSMIC Terminal scheme (cosmic-term/).
--
-- Install: ./wezterm/install.sh puts this in ~/.config/wezterm/, then in
-- ~/.config/wezterm/wezterm.lua:
--   config.colors = require("dossier")
-- To follow COSMIC's Dark / Light toggle with the Noir half installed too:
--   local dark = (wezterm.gui and wezterm.gui.get_appearance() or "Dark"):find("Dark")
--   config.colors = require(dark and "noir" or "dossier")

return {
  foreground = "#242424",
  background = "#C7C7C0",

  cursor_bg = "#DE6A41",
  cursor_fg = "#C7C7C0",
  cursor_border = "#DE6A41",
  compose_cursor = "#754E3E",

  selection_bg = "#ACACA6",
  selection_fg = "none",

  scrollbar_thumb = "#ACACA6",
  split = "#ACACA6",

  -- black, red, green, yellow, blue, magenta, cyan, white
  ansi = { "#2E3125", "#A80026", "#51573B", "#953B19", "#43432B", "#754E3E", "#6B1F2F", "#59574D" },
  brights = { "#383835", "#DB0030", "#2E3125", "#DE6A41", "#3E3D31", "#5A3A2E", "#4F1622", "#6B7360" },

  copy_mode_active_highlight_bg = { Color = "#953B19" },
  copy_mode_active_highlight_fg = { Color = "#D0D0C8" },
  copy_mode_inactive_highlight_bg = { Color = "#43432B" },
  copy_mode_inactive_highlight_fg = { Color = "#C7C7C0" },

  quick_select_label_bg = { Color = "#754E3E" },
  quick_select_label_fg = { Color = "#C7C7C0" },
  quick_select_match_bg = { Color = "#43432B" },
  quick_select_match_fg = { Color = "#C7C7C0" },

  tab_bar = {
    background = "#C7C7C0",
    active_tab = { bg_color = "#953B19", fg_color = "#D0D0C8", intensity = "Bold" },
    inactive_tab = { bg_color = "#DCDCD4", fg_color = "#555349" },
    inactive_tab_hover = { bg_color = "#E4E4DC", fg_color = "#242424" },
    new_tab = { bg_color = "#C7C7C0", fg_color = "#555349" },
    new_tab_hover = { bg_color = "#E4E4DC", fg_color = "#8E3818" },
  },
}
