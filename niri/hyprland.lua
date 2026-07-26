-- ============================================================
--  hyprland.lua — Espelhando a paleta e atalhos do Niri
-- ============================================================

hl.monitor({
    output   = "HDMI-A-2",
    mode     = "1920x1080@60",
    position = "auto",
    scale    = 1.0,
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "fuzzel"


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("systemctl --user import-environment QT_QPA_PLATFORMTHEME")
hl.exec_cmd("~/dotfiles/scripts/xdph-watchdog.sh")
    hl.exec_cmd("waybar")
    hl.exec_cmd("udiskie")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("cliphist wipe")
    hl.exec_cmd("awww-daemon --format xrgb && sleep 1 && awww img /home/flix/dotfiles/wallpapers/metropolis.png")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "48")
hl.env("HYPRCURSOR_SIZE", "48")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,   -- alinhado ao "gaps 10" único do niri

        border_size = 3, -- paridade com focus-ring/border width=3 do niri

        ["col.active_border"]   = "rgba(26E664ee)",  -- verde "Metropolis" do niri
        ["col.inactive_border"] = "rgba(15301Baa)",
        resize_on_border = false,
        allow_tearing     = false,
        layout            = "dwindle",
    },

    decoration = {
        rounding       = 12,  -- paridade com geometry-corner-radius 12 do niri
        rounding_power = 2,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range   = 4,
            color   = "rgba(1a1a1ae0)",  -- paridade com shadow color do niri
        },

        -- NOTA: o niri não tem blur; mantido aqui por ser recurso exclusivo do Hyprland.
        -- Definir enabled = false para fidelidade estrita ao niri.
        blur = {
            enabled = true,
            size    = 3,
            passes  = 1,
        },
    },
})

-- Curvas suaves, sem overshoot — movimento contido, sem "salto"
hl.curve("smoothOut",    { type = "bezier", points = { {0.16, 1},   {0.3, 1}    } })  -- desaceleração suave
hl.curve("smoothInOut",  { type = "bezier", points = { {0.45, 0},   {0.55, 1}   } })  -- entrada e saída simétricas
hl.curve("linear",       { type = "bezier", points = { {0, 0},      {1, 1}      } })
hl.curve("gentle",       { type = "bezier", points = { {0.25, 0.1}, {0.25, 1}   } })  -- easing clássico, sem ricochete

hl.animation({ leaf = "global",     enabled = true, speed = 6,   bezier = "smoothInOut" })
hl.animation({ leaf = "windows",    enabled = true, speed = 5,   bezier = "smoothOut" })
hl.animation({ leaf = "windowsIn",  enabled = true, speed = 4,   bezier = "smoothOut", style = "popin 90%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3.5, bezier = "smoothInOut" })
hl.animation({ leaf = "border",     enabled = true, speed = 6,   bezier = "smoothOut" })
hl.animation({ leaf = "fade",       enabled = true, speed = 4,   bezier = "gentle" })
hl.animation({ leaf = "fadeIn",     enabled = true, speed = 4,   bezier = "gentle" })
hl.animation({ leaf = "fadeOut",    enabled = true, speed = 3.5, bezier = "gentle" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5,   bezier = "smoothInOut", style = "slide" })

hl.config({
    dwindle = { preserve_split = true },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        repeat_delay = 200,
        repeat_rate  = 35,

        follow_mouse = 1,  
	sensitivity  = -0.5,

        touchpad = {
            natural_scroll = false,
        },
    },
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- Aplicações
hl.bind(mainMod .. " + T",         hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",         hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Space",     hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + R",         hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("brave"))
hl.bind(mainMod .. " + Y",         hl.dsp.exec_cmd(terminal .. " -e yazi"))
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(fileManager))
hl.bind("Menu",                    hl.dsp.exec_cmd("kitty nvim"))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd("obsidian"))

-- Colunas / Janelas (equivalentes conceituais dwindle)
hl.bind(mainMod .. " + Comma",  hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + Period", hl.dsp.window.float({ action = "toggle" }))

-- Navegação (vim-like + setas)
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ direction = "right" }))

-- Mouse / Scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + mouse_up",   hl.dsp.focus({ direction = "up" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { locked = false })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { locked = false })

-- Sistema
hl.bind("F1",  hl.dsp.exec_cmd("systemctl hibernate"))
hl.bind("End", hl.dsp.exec_cmd("systemctl poweroff"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("CTRL + Escape", hl.dsp.exec_cmd("killall waybar || waybar"))
hl.bind("ALT + V", hl.dsp.exec_cmd("cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"))

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/Imagens/$(date +%Y-%m-%d_%H-%M-%S).png && wl-copy < ~/Imagens/$(date +%Y-%m-%d_%H-%M-%S).png"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("grim ~/Pictures/$(date +%Y-%m-%d_%H-%M-%S).png && wl-copy < ~/Pictures/$(date +%Y-%m-%d_%H-%M-%S).png"))

-- Áudio / Brilho
hl.bind("F7", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("F8", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("F9", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Workspaces
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Gestão de Janelas
hl.bind(mainMod .. " + Escape",    hl.dsp.window.close())
hl.bind(mainMod .. " + F",         hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mainMod .. " + V",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + C",         hl.dsp.window.center())
hl.bind(mainMod .. " + minus",     hl.dsp.window.resize({ x = -100, y = 0 }))
hl.bind(mainMod .. " + equal",     hl.dsp.window.resize({ x = 100, y = 0 }))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class = "^$", title = "^$", xwayland = true,
        float = true, fullscreen = false, pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "picture-in-picture",
    match = { class = "^brave$", title = "^Picture-in-Picture$" },
    float = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})
