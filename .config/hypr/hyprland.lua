local browser = "chromium"
local meta = "SUPER"  -- Sets "Windows" key as main modifier
local terminal = "kitty"

-- https://wiki.hypr.land/Configuring/Basics/Binds/
hl.bind(meta .. " + C", hl.dsp.exec_cmd(browser .. " -ozone-platform-hint=auto"))
hl.bind(meta .. " + F", hl.dsp.window.fullscreen({action="toggle", mode="maximized"}))
hl.bind(meta .. " + Q", hl.dsp.window.kill())
hl.bind(meta .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(meta .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(meta .. " + V", hl.dsp.window.float({action="toggle"}))
hl.bind(meta .. " + SHIFT + C", hl.dsp.exec_cmd(browser .. " --incognito --ozone-platform-hint=auto"))
hl.bind(meta .. " + SHIFT + S", hl.dsp.window.move({workspace = "special:magic"}))
hl.bind(meta .. " + TAB", hl.dsp.window.cycle_next())
hl.bind(meta .. " + mouse:272", hl.dsp.window.drag(), {mouse = true})
hl.bind(meta .. " + mouse:273", hl.dsp.window.resize(), {mouse = true})
for i = 1, 10 do
   local key = i % 10
   hl.bind(meta .. " + " .. key, hl.dsp.focus({ workspace = i }))
   hl.bind(meta .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%"), {locked = true, repeating = true})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {locked = true})
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), {locked = true})
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), {locked = true})
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), {locked = true})
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), {locked = true})
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), {locked = true, repeating = true})


-- https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
      -- https://wiki.hypr.land/Configuring/Basics/Variables/#general
      general = {
         col = {
            active_border = {
               colors = {"rgba(33ccffee)", "rgba(00ff99ee)"},

               angle = 45,
            },

            inactive_border = "rgba(595959aa)",
         },
      },

      -- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
      decoration = {
         rounding = 10,
      },

      -- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/#config
      dwindle = {
         preserve_split = true,
      },

      -- https://wiki.hypr.land/Configuring/Basics/Variables/#input
      input = {
         follow_mouse = 0,
         mouse_refocus = false,
      },

      -- https://wiki.hypr.land/Configuring/Basics/Variables/#cursor
      cursor = {
         no_warps = true,
      },
})

-- https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
      output = "",
      mode = "preferred",
      position = "auto",
      scale = "auto",
})

-- https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function ()
         hl.exec_cmd("systemctl --user start spotify")
         hl.exec_cmd("/opt/wechat/wechat")
         hl.exec_cmd("waybar")
end)

-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/
hl.window_rule({
      match = {
         class = ".*",
      },
      suppress_event = "maximize",
})
hl.window_rule({
      match = {
         class = "Spotify",
      },
      workspace = "name: silent",
})
hl.window_rule({
      match = {
         class = "wechat",
      },
      workspace = "name: silent",
})
