# Gruvbox Dark Theme + JetBrainsMono Nerd Font for qutebrowser
# Place this in ~/.config/qutebrowser/config.py

config.load_autoconfig()

# Font
c.fonts.default_family = "JetBrainsMono Nerd Font"
c.fonts.default_size = "12pt"
c.fonts.hints = "JetBrainsMono Nerd Font"
c.fonts.statusbar = "12pt JetBrainsMono Nerd Font"
c.fonts.tabs.selected = "12pt JetBrainsMono Nerd Font"
c.fonts.tabs.unselected = "12pt JetBrainsMono Nerd Font"

# Gruvbox Dark Colors
gruvbox = {
    "bg0": "#282828",
    "bg1": "#3c3836",
    "bg2": "#504945",
    "bg3": "#665c54",
    "fg0": "#fbf1c7",
    "fg1": "#ebdbb2",
    "red": "#fb4934",
    "green": "#b8bb26",
    "yellow": "#fabd2f",
    "blue": "#83a598",
    "purple": "#d3869b",
    "aqua": "#8ec07c",
    "gray": "#928374",
}

# UI colors
c.colors.completion.fg = gruvbox["fg1"]
c.colors.completion.odd.bg = gruvbox["bg1"]
c.colors.completion.even.bg = gruvbox["bg0"]
c.colors.completion.category.bg = gruvbox["bg1"]
c.colors.completion.category.fg = gruvbox["fg1"]
c.colors.completion.item.selected.bg = gruvbox["bg3"]
c.colors.completion.item.selected.fg = gruvbox["fg0"]
c.colors.completion.item.selected.border.top = gruvbox["bg2"]
c.colors.completion.item.selected.border.bottom = gruvbox["bg2"]
c.colors.completion.match.fg = gruvbox["green"]

c.colors.statusbar.normal.bg = gruvbox["bg0"]
c.colors.statusbar.normal.fg = gruvbox["fg1"]
c.colors.statusbar.insert.bg = gruvbox["blue"]
c.colors.statusbar.insert.fg = gruvbox["bg0"]
c.colors.statusbar.command.bg = gruvbox["bg1"]
c.colors.statusbar.command.fg = gruvbox["fg1"]
c.colors.statusbar.private.bg = gruvbox["purple"]
c.colors.statusbar.private.fg = gruvbox["bg0"]
c.colors.statusbar.url.fg = gruvbox["fg1"]
c.colors.statusbar.url.success.http.fg = gruvbox["green"]
c.colors.statusbar.url.success.https.fg = gruvbox["green"]
c.colors.statusbar.url.error.fg = gruvbox["red"]

c.colors.tabs.bar.bg = gruvbox["bg0"]
c.colors.tabs.odd.bg = gruvbox["bg1"]
c.colors.tabs.even.bg = gruvbox["bg2"]
c.colors.tabs.selected.odd.bg = gruvbox["bg3"]
c.colors.tabs.selected.even.bg = gruvbox["bg3"]
c.colors.tabs.selected.odd.fg = gruvbox["fg0"]
c.colors.tabs.selected.even.fg = gruvbox["fg0"]

c.colors.messages.error.bg = gruvbox["red"]
c.colors.messages.error.fg = gruvbox["bg0"]
c.colors.messages.warning.bg = gruvbox["yellow"]
c.colors.messages.warning.fg = gruvbox["bg0"]
c.colors.messages.info.bg = gruvbox["blue"]
c.colors.messages.info.fg = gruvbox["bg0"]

c.colors.downloads.bar.bg = gruvbox["bg0"]
c.colors.downloads.start.bg = gruvbox["blue"]
c.colors.downloads.start.fg = gruvbox["bg0"]
c.colors.downloads.stop.bg = gruvbox["green"]
c.colors.downloads.stop.fg = gruvbox["bg0"]
c.colors.downloads.error.bg = gruvbox["red"]
c.colors.downloads.error.fg = gruvbox["bg0"]

c.colors.hints.bg = gruvbox["yellow"]
c.colors.hints.fg = gruvbox["bg0"]
c.colors.hints.match.fg = gruvbox["red"]

c.colors.prompts.bg = gruvbox["bg1"]
c.colors.prompts.fg = gruvbox["fg1"]
c.colors.prompts.selected.bg = gruvbox["bg2"]

c.colors.webpage.bg = gruvbox["bg0"]

# Enable dark mode for webpages
c.colors.webpage.bg = gruvbox["bg0"]
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.images = "smart"  # "always", "never", or "smart"
c.colors.webpage.darkmode.policy.page = "smart"  # "always", "never", or "smart"
c.colors.webpage.darkmode.threshold.background = 205

# Optional: enforce dark mode rendering from QtWebEngine (if supported)
c.qt.force_software_rendering = "qt-quick"
