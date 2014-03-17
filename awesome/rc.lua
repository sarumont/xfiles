-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
local tyrannical = require("tyrannical")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
local vicious = require("vicious")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

-- Load Debian menu entries
require("debian.menu")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
config_dir = awful.util.getdir("config")
beautiful.init(config_dir .. "/themes/powerarrow-dark/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "x-terminal-emulator"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.fair,
    awful.layout.suit.spiral,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

-- {{{ Tyrannical
tyrannical.tags = {
    {
        name = "dev",
        init = true,
        exclusive = true,
        layout = awful.layout.suit.max.fullscreen,
        class = {"dev", "Eclipse", "jetbrains.idea"}
    },
    {
        name = "main",
        init = false,
        exclusive = false,
        layout = awful.layout.suit.max,
        class = {"main", "Thunderbird"}
    },
    {
        name        = "term",                 -- Call the tag "Term"
        init        = false,                   -- Load the tag on startup
        exclusive   = true,                   -- Refuse any other type of clients (by classes)
        screen      = {1,2},                  -- Create this tag on screen 1 and screen 2
        layout      = awful.layout.suit.tile, -- Use the tile layout
        class       = {"xterm", "urxvt", "aterm", "URxvt", "XTerm"}
    } ,
    {
        name        = "web",
        init        = false,
        exclusive   = false,
        screen      = screen.count(),
        layout      = awful.layout.suit.tile,
		mwfact      = 0.68,
        class = {"Firefox", "Chromium", "Google-chrome"}
    } ,
	{
		name = "vm",
		init = false,
		exclusive = false,
		layout = awful.layout.suit.floating,
		class = {"VirtualBox", "Vmplayer"}
	},
	{
		name = "comm",
		init = false,
		exclusive = false,
		layout = awful.layout.suit.tile,
		nmaster = 1,
		mwfact = 0.20,
		class = { "Skype" }
	},
    {
        name = "office",
        init = false,
        exclusive = true,
        layout = awful.layout.suit.magnifier,
        class = {"libreoffice-writer", "libreoffice-startcenter", "libreoffice-calc"}
    } ,
}

-- Ignore the tag "exclusive" property for the following clients (matched by classes)
tyrannical.properties.intrusive = {
	"feh", "elicit", "gitk", "java-lang-Thread", "rox-filer", "MPlayer", "Screen Ruler", "xterm"
}

-- Ignore the tiled layout for the matching clients
tyrannical.properties.floating = {
	"feh", "elicit", "gitk", "java-lang-Thread", "rox-filer", "MPlayer", "Screen Ruler"
}

-- Make the matching clients (by classes) on top of the default layout
tyrannical.properties.ontop = {
	"Screen Ruler"
}

-- Force the matching clients (by classes) to be centered on the screen on init
tyrannical.properties.centered = {
    "kcalc"
}

tyrannical.settings.block_children_focus_stealing = true --Block popups ()
tyrannical.settings.group_children = true --Force popups/dialogs to have the same tags as the parent client
-- }}}

--
-- Wibox
--

-- separators
arrl = wibox.widget.imagebox()
arrl:set_image(beautiful.arrl)
arrl_ld = wibox.widget.imagebox()
arrl_ld:set_image(beautiful.arrl_ld)
arrl_dl = wibox.widget.imagebox()
arrl_dl:set_image(beautiful.arrl_dl)

-- tags
tagbuttons = {}
tagbuttons = awful.util.table.join(
    tagbuttons,
    awful.button( { }, 1, awful.tag.viewonly  ),
    awful.button( { "Mod1" }, 1, awful.client.movetotag ),
    awful.button( { }, 3, function (tag) tag.selected = not tag.selected end ),
    awful.button( { "Mod1" }, 3, awful.client.toggletag ),
    awful.button( { }, 4, awful.tag.viewnext ),
    awful.button( { }, 5, awful.tag.viewprev ));

-- clock
datewidget = awful.widget.textclock()
vicious.register(
	datewidget,
	vicious.widgets.date,
	'<span color="#AAAAAA" background="#1F2428">%b %e, %R</span> ', 60)
clockicon = wibox.widget.imagebox()
clockicon:set_image(beautiful.clock)

-- battery
batwidget = wibox.widget.textbox()
vicious.register(
	batwidget,
	vicious.widgets.bat,
	'<span color="#AAAAAA" background="#313131">$1$2% </span>',
	60,
	"BAT0")

-- cpu
cpuwidget = wibox.widget.textbox()
vicious.register(
	cpuwidget,
	vicious.widgets.cpu,
	'<span background="#1F2428" color="#AAAAAA">$1%</span> ', 5)
cpuicon = wibox.widget.imagebox()
cpuicon:set_image(beautiful.cpu)

-- cpufreq
--cpufreqwidget = wibox.widget.textbox()
--vicious.register(cpufreqwidget, vicious.widgets.cpufreq, "$1MHz", 30, "cpu0")

-- RAM
memwidget = wibox.widget.textbox()
vicious.register(
	memwidget,
	vicious.widgets.mem,
	'<span background="#313131" color="#AAAAAA">$1% </span>', 20)
memicon = wibox.widget.imagebox()
memicon:set_image(beautiful.mem)

-- volume
volume = wibox.widget.textbox()
vicious.register(volume, vicious.widgets.volume, '<span color="#AAAAAA" background="#1F2428">$1</span> ', 0.5, "Master")

volumeicon = wibox.widget.imagebox()
vicious.register(volumeicon, vicious.widgets.volume, function(widget, args)
        local paraone = tonumber(args[1])

		if args[2] == "♩" or paraone == 0 then
			volumeicon:set_image(beautiful.mute)
		elseif paraone >= 67 and paraone <= 100 then
			volumeicon:set_image(beautiful.music)
		elseif paraone >= 33 and paraone <= 66 then
			volumeicon:set_image(beautiful.music)
		else
			volumeicon:set_image(beautiful.music)
		end
end, 0.3, "Master")

-- mpd
mpdwidget = wibox.widget.textbox()
vicious.register(
	mpdwidget,
	vicious.widgets.mpd,
	function ( widget, args )
		if args["{state]"] == "Stop" then
			return "Stopped "
		else
			return '<span color="#AAAAAA" background="#313131">'..args["{Artist}"]..' - '..args["{Title}"]..' </span>'
		end
	end,
	5);
mpdicon = wibox.widget.imagebox()
mpdicon:set_image(beautiful.mpd)

-- prompt
prompts = {}
wiboxes = {}
taglists = {}
layoutboxes = {}

taglists.buttons = awful.util.table.join(
					awful.button({ }, 1, awful.tag.viewonly),
					awful.button({ modkey }, 1, awful.client.movetotag),
					awful.button({ }, 3, awful.tag.viewtoggle),
					awful.button({ modkey }, 3, awful.client.toggletag),
					awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
					awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
					)

for s=1,screen.count() do
	prompts[s] = awful.widget.prompt()
	wiboxes[s] = awful.wibox({position = "top", screen = s, height = "16"})
	taglists[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, tagbuttons);
    layoutboxes[s] = awful.widget.layoutbox(s)
    layoutboxes[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))

	-- Widgets that are aligned to the left
	local left_layout = wibox.layout.fixed.horizontal()
	left_layout:add(layoutboxes[s])
	left_layout:add(taglists[s])
	left_layout:add(prompts[s])

	-- Widgets that are aligned to the right
	local right_layout = wibox.layout.fixed.horizontal()

    right_layout:add(arrl_ld)
    right_layout:add(mpdicon)
	right_layout:add(mpdwidget)

    right_layout:add(arrl_dl)
    right_layout:add(cpuicon)
    right_layout:add(cpuwidget)
    --right_layout:add(cpufreqwidget)

    right_layout:add(arrl_ld)
    right_layout:add(memicon)
    right_layout:add(memwidget)

    right_layout:add(arrl_dl)
    right_layout:add(volumeicon)
    right_layout:add(volume)

    right_layout:add(arrl_ld)
    right_layout:add(batwidget)

    right_layout:add(arrl_dl)
    right_layout:add(clockicon)
    right_layout:add(datewidget)

    right_layout:add(arrl_ld)
	if s == 1 then
		right_layout:add(wibox.widget.systray())
		spacer = wibox.widget.textbox()
		spacer:set_text(" ")
		right_layout:add(spacer)
	end

	-- Now bring it all together (with the tasklist in the middle)
	local layout = wibox.layout.align.horizontal()
	layout:set_left(left_layout)
	layout:set_right(right_layout)

	wiboxes[s]:set_widget(layout)
end

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(

	-- tab selection
    awful.key({"Control", "Shift"}, "h", awful.tag.viewprev ),
    awful.key({"Control", "Shift"}, "l", awful.tag.viewnext ),

	-- focus management
    awful.key({"Mod1"}, "j",
        function ()
            awful.client.focus.byidx(1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({"Mod1"}, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),

    -- Layout manipulation
    awful.key({"Control", "Mod1"}, "k", function () awful.client.swap.bydirection("up") end),
    awful.key({"Control", "Mod1"}, "j", function () awful.client.swap.bydirection("down") end),
    awful.key({"Control", "Mod1"}, "l", function () awful.client.swap.bydirection("right") end),
    awful.key({"Control", "Mod1"}, "h", function () awful.client.swap.bydirection("left") end),
    awful.key({"Mod4"}, "l", function () awful.util.spawn( "xscreensaver-command -lock" ) end ),

    awful.key({modkey}, "u", awful.client.urgent.jumpto),
    awful.key({modkey}, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({"Control", "Shift"}, "Return", function () awful.util.spawn(terminal) end),
    awful.key({modkey, "Control"}, "r", awesome.restart),
    awful.key({modkey, "Shift"}, "q", awesome.quit),

    awful.key({modkey}, "Left", function () awful.tag.incmwfact(0.05) end),
    awful.key({modkey}, "Right", function () awful.tag.incmwfact(-0.05) end),
    awful.key({modkey}, "space", function () awful.layout.inc(layouts, 1) end),
    awful.key({modkey, "Shift"}, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
	awful.key({modkey}, "r", function () 
		wiboxes[mouse.screen].visible = true 
		prompts[mouse.screen]:run() end ),

	-- audio
    awful.key({modkey}, "p", function () awful.util.spawn( "mpc prev" ) end ),
    awful.key({modkey}, "n", function () awful.util.spawn( "mpc next" ) end ),
    awful.key({modkey}, "t", function () awful.util.spawn( "mpc toggle" ) end ),
    awful.key({}, "XF86AudioPrev", function () awful.util.spawn( "mpc prev" ) end ),
    awful.key({}, "XF86AudioNext", function () awful.util.spawn( "mpc next" ) end ),
    awful.key({}, "XF86AudioPlay", function () awful.util.spawn( "mpc toggle" ) end ),
    awful.key({}, "XF86AudioMute", function () awful.util.spawn( "amixer set Capture toggle" ) end ),

	awful.key({modkey}, "=", function () 
		awful.util.spawn( "mixer_ctl up 5" )
		naughty.notify( { text = "volume up", timeout = 1 })
	end ), 

    awful.key({modkey}, "-", function () 
		awful.util.spawn( "mixer_ctl down 5" )
		naughty.notify( { text = "volume down", timeout = 1 })
	end ),

    awful.key({}, "XF86AudioRaiseVolume", function () 
		awful.util.spawn( "mixer_ctl up 5" )
		naughty.notify( { text = "volume up", timeout = 1 })
	end ),

    awful.key({}, "XF86AudioLowerVolume", function () 
		awful.util.spawn( "mixer_ctl down 5" )
		naughty.notify( { text = "volume down", timeout = 1 })
	end )
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "Escape",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end)
)

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ "Mod1" }, 1, awful.mouse.client.move),
    awful.button({ "Mod1" }, 3, awful.mouse.client.resize))

-- Set keys
local ror = require("aweror")
globalkeys = awful.util.table.join(globalkeys, ror.genkeys(modkey));
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { instance = "plugin-container" },
      properties = { floating = true } },
    { rule = { class = "Android SDK Manager" },
      properties = { floating = true } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
	{ rule = { class = "Skype", role = "CallWindow" },
	properties = { floating = true, ontop = true } },
	{ rule = { class = "Skype", name = "File Transfers" },
	properties = { floating = true, ontop = true } },
	{ rule = { class = "Wine" },
	properties = { floating = true, border_width = 0 } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = ("Wine" ~= c.class) and ( awful.client.floating.get( c ) or "ConversationsWindow" == c.role )
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
--
awful.util.spawn_with_shell("/home/sarumont/.dotfiles/bin/dex -a -e Awesome")
