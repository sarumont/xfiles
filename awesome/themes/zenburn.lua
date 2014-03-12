---------------------------
-- awesome zenburn theme --
-- anrxc_at_sysphere_org --
---------------------------

theme = {}

-- color mappings
green = "#7f9f7f"
blue = "#8cd0d3"
black = "#3f3f3f"
pink = "#dca3a3"
red = "#cc9393"

-- Font styles for statusbars and titlebars
theme.font          = "Profont 8"
theme.fg_normal     = "#DCDCCC"
theme.fg_focus      = "#F0DFAF"
theme.fg_urgent     = "#CC9393"
--theme.fg_urgent     = theme.fg_normal
theme.bg_normal     = "#3F3F3F"
--theme.bg_normal     = "#3F3F3F99"
theme.bg_focus      = "#1E2320"
theme.bg_urgent     = "#3F3F3F"

-- Windows border styles
theme.border_width  = "1"
theme.border_normal = "#111111"
-- original: theme.border_focus  = "#1E2320"
theme.border_focus  = "#7F7F7F"
theme.border_marked = "#CC9393"

-- notification colors
theme.notify_font_color_1 = green
theme.notify_font_color_2 = blue
theme.notify_font_color_3 = red

-- Titlebar styles
theme.titlebar_bg_focus  = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"

-- Widget styles
theme.fg_widget        = "#AECF96"
theme.fg_center_widget = "#88A175"
theme.fg_end_widget    = "#FF5656"
theme.fg_off_widget    = "#494B4F"
theme.fg_netup_widget  = "#7F9F7F"
theme.fg_netdn_widget  = "#CC9393"
theme.bg_widget        = "#3F3F3F"
theme.border_widget    = "#3F3F3F"

-- Command used to set the wallpaper
-- theme.wallpaper_cmd = { "/usr/bin/nitrogen --restore" }
theme.wallpaper_cmd = { "awsetbg /home/sarumont/ownCloud/images/bg/shebang.jpg" }
--theme.wallpaper_cmd = { "awsetbg /home/sarumont/Dropbox/images/bg/black_code.jpg" }
-- theme.wallpaper_cmd = { "awsetbg /home/sarumont/images/bg/i_can_code2.jpg" }

-- Taglist squares (4x14 pixels, zenburn colors)
theme.taglist_squares       = "true"
theme.taglist_squares_sel   = awful.util.getdir("config") .. "/icons/taglist/squarefz.png"
theme.taglist_squares_unsel = awful.util.getdir("config") .. "/icons/taglist/squareza.png"

-- Statusbar icons for window management layouts (14x14 pixels, zenburn colors)
theme.layout_tile       = awful.util.getdir("config") .. "/icons/layouts/tile.png"
theme.layout_tileleft   = awful.util.getdir("config") .. "/icons/layouts/tileleft.png"
theme.layout_tilebottom = awful.util.getdir("config") .. "/icons/layouts/tilebottom.png"
theme.layout_tiletop    = awful.util.getdir("config") .. "/icons/layouts/tiletop.png"
theme.layout_fairv      = awful.util.getdir("config") .. "/icons/layouts/fairv.png"
theme.layout_fairh      = awful.util.getdir("config") .. "/icons/layouts/fairh.png"
theme.layout_max        = awful.util.getdir("config") .. "/icons/layouts/max.png"
theme.layout_fullscreen = awful.util.getdir("config") .. "/icons/layouts/fullscreen.png"
theme.layout_magnifier  = awful.util.getdir("config") .. "/icons/layouts/magnifier.png"
theme.layout_floating   = awful.util.getdir("config") .. "/icons/layouts/floating.png"

-- Widget icons (from dzen, zenburn colors)
theme.widget_cpu   = awful.util.getdir("config") .. "/icons/cpu.png"
theme.widget_bat   = awful.util.getdir("config") .. "/icons/bat.png"
theme.widget_mem   = awful.util.getdir("config") .. "/icons/mem.png"
theme.widget_fs    = awful.util.getdir("config") .. "/icons/disk.png"
theme.widget_net   = awful.util.getdir("config") .. "/icons/down.png"
theme.widget_netup = awful.util.getdir("config") .. "/icons/up.png"
theme.widget_mail  = awful.util.getdir("config") .. "/icons/mail.png"
theme.widget_vol   = awful.util.getdir("config") .. "/icons/vol.png"
theme.widget_org   = awful.util.getdir("config") .. "/icons/calendar.png"
theme.widget_date  = awful.util.getdir("config") .. "/icons/time.png"
theme.widget_music  = awful.util.getdir("config") .. "/icons/music.png"
theme.widget_temp  = awful.util.getdir("config") .. "/icons/temp.png"

-- Titlebar icons (17x17 pixels, zenburn colors)
--
-- Close
theme.titlebar_close_button_focus = awful.util.getdir("config") .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal = awful.util.getdir("config") .. "/icons/titlebar/close_normal.png"
-- On top
theme.titlebar_ontop_button_focus_active = awful.util.getdir("config") .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = awful.util.getdir("config") .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive = awful.util.getdir("config") .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = awful.util.getdir("config") .. "/icons/titlebar/ontop_normal_inactive.png"
-- Sticky
theme.titlebar_sticky_button_focus_active = awful.util.getdir("config") .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = awful.util.getdir("config") .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive = awful.util.getdir("config") .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = awful.util.getdir("config") .. "/icons/titlebar/sticky_normal_inactive.png"
-- Floating
theme.titlebar_floating_button_focus_active = awful.util.getdir("config") .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = awful.util.getdir("config") .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive = awful.util.getdir("config") .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = awful.util.getdir("config") .. "/icons/titlebar/floating_normal_inactive.png"
-- Maximized
theme.titlebar_maximized_button_focus_active = awful.util.getdir("config") .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = awful.util.getdir("config") .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive = awful.util.getdir("config") .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = awful.util.getdir("config") .. "/icons/titlebar/maximized_normal_inactive.png"


return theme
