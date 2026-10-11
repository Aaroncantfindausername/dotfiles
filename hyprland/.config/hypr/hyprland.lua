hl.monitor({ output = "DP-1", mode = "2560x1600@240", position = "auto", scale = 1.666 })
hl.monitor({ output = "DP-2", position = "auto", mode = "highres", scale = 1.2 })
local terminal = "kitty"
local fileManager = "nautilus"
local menu = "rofi -show drun"

hl.on("hyprland.start", function()
	hl.exec_cmd("slepp 2; clispe -listen") -- sleep to fix clipse issue https://github.com/savedra1/clipse/issues/51
	hl.exec_cmd("dunst")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("fcitx5 -d -r")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.dispatch(hl.dsp.focus({ workspace = 5 }))
end)
-- ENVIRONMENT VARIABLES

hl.env("GDK_SCALE", "2")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("ANKI_WAYLAND", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_SIZE", "24")
hl.env("SUDO_EDITOR", "/usr/bin/nvim")
hl.env("HISTSIZE", "30000")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("HISTFILESIZE", "30000")

hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 2,

		border_size = 2,

		col = {
			active_border = "rgba(a7c080ee)",
			inactive_border = "rgba(3c4841ee)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "scrolling",
	},
})

hl.config({
	decoration = {
		rounding = 10,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},
})

hl.config({ xwayland = { force_zero_scaling = true } })
-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("oldBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "easeOutQuint" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 5.50, bezier = "oldBezier" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5.5, bezier = "easeOutQuint", style = "slide" })
-- hl.animation({ leaf = "workspacesIn", enabled = true, speed = 4.5, bezier = "easeOutQuint", style = "slide" })
-- hl.animation({ leaf = "workspacesOut", enabled = true, speed = 4.5, bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.config({ dwindle = {
	preserve_split = true,
} })

hl.config({ master = {
	new_status = "master",
} })

hl.config({ scrolling = {
	follow_focus = true,
} })

hl.config({ misc = {
	force_default_wallpaper = 0,
	disable_hyprland_logo = true,
} })

hl.config({
	group = {
		col = {
			border_active = "rgba(e69875ee)",
			border_inactive = "rgba(dbbc7faa)",
		},
		groupbar = {
			enabled = false,
		},
	},
})

-- INPUT
hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0,

		repeat_delay = 230,
		repeat_rate = 100,
		touchpad = {
			natural_scroll = false,
			disable_while_typing = true,
		},
	},
})

-- KEYBINDINGS --
local mainMod = "SUPER"
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + O", hl.dsp.window.close())
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + J", hl.dsp.window.float())
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Comma", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())

-- Switch workspaces with mainMod + [1-9]
hl.bind(
	mainMod .. " + 0",
	hl.dsp.exec_cmd("hyprctl keyword animation workspaces, 1,6,default,fade && hyprctl dispatch workspace 5")
)

-- Window groups
hl.bind(mainMod .. " + f", hl.dsp.group.toggle())
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.group.next())
-- Scrolling workspace
hl.bind(mainMod .. " + left", hl.dsp.layout("colresize -0.03125"), { repeating = true })
hl.bind(mainMod .. " + right", hl.dsp.layout("colresize +0.03125"), { repeating = true })
hl.bind(mainMod .. " + down", hl.dsp.layout("colresize 0.5"))
hl.bind(mainMod .. " + up", hl.dsp.layout("colresize 1.0"))

hl.bind(mainMod .. " + period", hl.dsp.layout("promote"))
-- hl.bind(mainMod.." + i", hl.dsp.layout("togglefit")

------ 2D workspaces ------
-- Move to workspaces by direction

local function move(pos, dir)
	assert(type(pos) == "number" and pos >= 1 and pos <= 9, "position must be an integer from 1 to 9")

	dir = string.lower(tostring(dir))

	local index = pos - 1
	local row = math.floor(index / 3)
	local col = index % 3

	if dir == "left" then
		col = (col - 1) % 3
	elseif dir == "right" then
		col = (col + 1) % 3
	elseif dir == "up" then
		row = (row - 1) % 3
	elseif dir == "down" then
		row = (row + 1) % 3
	else
		error("direction must be 'left', 'right', 'up', or 'down'")
	end

	return row * 3 + col + 1
end

local move_table = {
	{ key = "k", direction = "left", animation = "slide" },
	{ key = "e", direction = "right", animation = "slide" },
	{ key = "a", direction = "up", animation = "slidevert" },
	{ key = "h", direction = "down", animation = "slidevert" },
}
local animation_speed = 6.5
local bezier = "oldBezier"
for _, v in ipairs(move_table) do
	-- Move focus
	hl.bind(mainMod .. " + " .. v.key, hl.dsp.focus({ direction = v.direction }))
	-- Move windows
	hl.bind(mainMod .. " + ALT + " .. v.key, hl.dsp.window.move({ direction = v.direction }))

	hl.bind(mainMod .. " + SHIFT + " .. v.key, function()
		local ws_id = hl.get_active_workspace().id
		hl.animation({
			leaf = "workspaces",
			enabled = true,
			speed = animation_speed,
			bezier = bezier,
			style = v.animation,
		})
		hl.dispatch(hl.dsp.focus({ workspace = move(ws_id, v.direction) }))
	end)

	-- Move active window to workspace silently to different directions
	hl.bind(mainMod .. " + CONTROL + " .. v.key, function()
		local ws_id = hl.get_active_workspace().id
		hl.animation({
			leaf = "workspaces",
			enabled = true,
			speed = animation_speed,
			bezier = bezier,
			style = v.animation,
		})
		hl.dispatch(hl.dsp.window.move({ workspace = move(ws_id, v.direction), follow = false }))
	end)

	hl.bind(mainMod .. " + CONTROL + SHIFT + " .. v.key, function()
		local ws_id = hl.get_active_workspace().id
		hl.animation({
			leaf = "workspaces",
			enabled = true,
			speed = animation_speed,
			bezier = bezier,
			style = v.animation,
		})
		hl.dispatch(hl.dsp.window.move({ workspace = move(ws_id, v.direction), follow = true }))
	end)
end

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 9 do
	hl.workspace_rule({ workspace = tostring(i), persistent = true, default = i == 5 })
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + " .. 0, hl.dsp.window.move({ workspace = 5 }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + r", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + CONTROL + r", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + SHIFT + r", function()
	hl.animation({
		leaf = "workspaces",
		enabled = true,
		speed = animation_speed,
		bezier = "easeOutQuint",
		style = "fade",
	})
	hl.dispatch(hl.dsp.window.move({ workspace = "special:magic", follow_focus = true }))
end)

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "previous" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "previous" }))

-- Alternative keybinds for brightness and volume for external keyboard
hl.bind(mainMod .. " + f11", hl.dsp.exec_cmd("~/scripts/changeVolume.sh 5%-"), { repeating = true, locked = true })
hl.bind(
	mainMod .. " + bracketright",
	hl.dsp.exec_cmd("~/scripts/changeVolume.sh 5%+"),
	{ repeating = true, locked = true }
)
hl.bind(
	mainMod .. " + SHIFT + f11",
	hl.dsp.exec_cmd("~/scripts/changeVolume.sh toggle"),
	{ repeating = true, locked = true }
)
hl.bind(
	mainMod .. " + equal",
	hl.dsp.exec_cmd("~/scripts/changeBrightness.sh 3%+"),
	{ repeating = true, locked = true }
)
hl.bind(
	mainMod .. " + semicolon",
	hl.dsp.exec_cmd("~/scripts/changeBrightness.sh 3%-"),
	{ repeating = true, locked = true }
)

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/scripts/changeVolume.sh 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/scripts/changeVolume.sh 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/scripts/changeVolume.sh toggle"), { locked = true, repeating = true })
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- Resize windows with keybinds
-- Switch to a submap called `resize`.
hl.bind(mainMod .. " + u", hl.dsp.submap("resize"))
-- Start a submap called "resize".
hl.define_submap("resize", function()
	-- Set repeating binds for resizing the active window.
	hl.bind("e", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
	hl.bind("k", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
	hl.bind("a", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
	hl.bind("h", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)
-- keybinds further down will be global again...
-- Laptop multimedia keys for volume and LCD brightness

-- Screenshot a window
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
-- Screenshot a monitor
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
-- Screenshot a region
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
-- Screenshot region copy but don't save
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

-- Sleep
hl.bind(mainMod .. " + BackSpace", hl.dsp.exec_cmd("systemctl suspend"))

--Clipboard manager
hl.bind(mainMod .. " + SHIFT + p", hl.dsp.exec_cmd("kitty --class clipse -e clipse"))
hl.window_rule({
	name = "clipse",
	match = {
		class = "clipse",
	},
	float = true,
	size = { 622, 652 },
})

hl.window_rule({
	name = "float-copyq",
	match = {
		class = "com.github.hluk.copyq",
	},
	float = true,
	size = { 700, 700 },
})

hl.window_rule({
	name = "float-waydroid",
	match = {
		class = "Waydroid",
	},
	float = true,
})

hl.device({
	name = "asuf1416:00-2808:0108-touchpad",
	enabled = false,
})

hl.bind("f10", function()
	hl.device({
		name = "asuf1416:00-2808:0108-touchpad",
		enabled = true,
	})
	hl.dispatch(hl.dsp.no_op())
end)

hl.bind("SHIFT + f10", function()
	hl.device({
		name = "asuf1416:00-2808:0108-touchpad",
		enabled = false,
	})
	hl.dispatch(hl.dsp.no_op())
end)

-- Zoom snippet from https://wiki.hypr.land/configuring/code-snippets/
local MAX_ZOOM = 3
local MIN_ZOOM = 1
local ZOOM_TOGGLE_FACTOR = 2.0

---@param offset number
---@return nil
local function zoom(offset)
	local current = hl.get_config("cursor.zoom_factor")
	if offset ~= nil then
		current = current + offset
	elseif current ~= MIN_ZOOM then
		current = MIN_ZOOM
	else
		current = ZOOM_TOGGLE_FACTOR
	end
	current = math.max(MIN_ZOOM, math.min(MAX_ZOOM, current))
	hl.config({ cursor = { zoom_factor = current } })
end

hl.bind(mainMod .. " + Z", zoom)
hl.bind(mainMod .. " + SHIFT + Z", function()
	zoom(0.5)
end)
hl.bind(mainMod .. " + ALT + Z", function()
	zoom(-0.5)
end)
