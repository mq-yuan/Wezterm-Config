local wezterm = require 'wezterm'
local launch_menu = {}
local ssh_domains = {}
local background_table = {}
local colors = {}
local tab_bar = {}

-- WSL DOMAINS
local wsl_domains = wezterm.default_wsl_domains()

for idx, dom in ipairs(wsl_domains) do
  if dom.name == 'WSL:Ubuntu' then
    dom.default_prog = { 'zsh' }
    dom.default_cwd = "~"
  end
end

-- BACKGROUND
function RandomWithWeight(t, weights)
    local sum = 0
    for i = 1, #weights do
        sum = sum + weights[i]
    end
    local compareWeight = math.random(1, sum)
    local weightIndex = 1
    while sum > 0 do
        sum = sum - weights[weightIndex]
        if sum < compareWeight then
        return t[weightIndex]
        end
        weightIndex = weightIndex + 1
    end
    return nil
end

local background_name_list = {"ziluolan", "bleach", "caroline", "yan", "p5r", "bing"}
local background_weights = {5, 5, 2, 3, 1, 2}

local background_name = RandomWithWeight(background_name_list, background_weights)

background_table = {    
  {
      source = { File = "E:\\Photos\\steam\\background_black.png" },
      horizontal_align = 'Center',
      vertical_align = 'Middle',
      height = 'Cover',
      width = 'Cover',
      repeat_x = 'NoRepeat',
      repeat_y = 'NoRepeat',
      opacity = 1.0
  }
}
if background_name == "ziluolan" then
  table.insert(
    background_table,
      {
        source = { File = "E:\\Photos\\steam\\wlop_ziluolan_30.jpg" },
        horizontal_align = 'Center',
        vertical_align = 'Middle',
        height = 'Cover',
        width = 'Cover',
        repeat_x = 'NoRepeat',
        repeat_y = 'NoRepeat',
        opacity = 0.3
      }
  )
elseif background_name == "bleach" then
  table.insert(
    background_table,
      {
        source = { File = "E:\\Photos\\steam\\black_vleach_20.png" },
        horizontal_align = 'Center',
        vertical_align = 'Middle',
        height = 'Cover',
        width = 'Cover',
        repeat_x = 'NoRepeat',
        repeat_y = 'NoRepeat',
        opacity = 0.2
      }
  )
elseif background_name == "caroline" then
  table.insert(
    background_table,
      {
        source = { File = "E:\\Photos\\steam\\blue_caroline_and_Justine_10.png" },
        horizontal_align = 'Center',
        vertical_align = 'Middle',
        height = 'Cover',
        width = 'Cover',
        repeat_x = 'NoRepeat',
        repeat_y = 'NoRepeat',
        opacity = 0.1
      }
  )
elseif background_name == "yan" then
  table.insert(
    background_table,
      {
        source = { File = "E:\\Photos\\steam\\blue_yan_40.png" },
        horizontal_align = 'Center',
        vertical_align = 'Middle',
        height = 'Cover',
        width = 'Cover',
        repeat_x = 'NoRepeat',
        repeat_y = 'NoRepeat',
        opacity = 0.4
      }
  )
elseif background_name == "p5r" then
  table.insert(
    background_table,
      {
        source = { File = "E:\\Photos\\steam\\red_p5r_5.png" },
        horizontal_align = 'Center',
        vertical_align = 'Middle',
        height = 'Cover',
        width = 'Cover',
        repeat_x = 'NoRepeat',
        repeat_y = 'NoRepeat',
        opacity = 0.05
      }
  )
else
  table.insert(
    background_table,
    {
      source = { File = "E:\\Photos\\steam\\wlop_bing_20.jpg" },
      horizontal_align = 'Center',
      vertical_align = 'Middle',
      height = 'Cover',
      width = 'Cover',
      repeat_x = 'NoRepeat',
      repeat_y = 'NoRepeat',
      opacity = 0.2
    }
  )
end


-- LAUNCH MENU
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  table.insert(
    launch_menu,
    {
      label = "PowerShell",
      args = { "powershell.exe", "-NoLogo" },
      domain="DefaultDomain"
    }
  )

  table.insert(
    launch_menu,
    {
      label = "CMD",
      args = { "cmd.exe" },
      domain="DefaultDomain"
    }
  )

  table.insert(
    launch_menu,
    {
      label = "Aliyun",
      args = {"ssh.exe", "neovim@8.130.45.78"},
      domain="DefaultDomain",
    }
  )

  -- table.insert(
  --   ssh_domains,
  --   {
  --     name = "Aliyun-Neovim",
  --     remote_address = "8.130.45.78",
  --     username = 'neovim'
  --   }
  -- )
end

return {
  default_prog = {"powershell.exe"},
  launch_menu  = launch_menu,
  ssh_domains = ssh_domains,
  wsl_domains = wsl_domains,
  adjust_window_size_when_changing_font_size = false,
  audible_bell = 'Disabled',
  background = background_table,
  colors = {
    tab_bar = {
        -- The color of the strip that goes along the top of the window
        -- (does not apply when fancy tab bar is in use)
        -- background = '#000000',

        -- The active tab is the one that has focus in the window
        active_tab = {
          -- The color of the background area for the tab
          bg_color = '#2b2042',
          -- The color of the text for the tab
          fg_color = '#BB9AF7',

          -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
          -- label shown for this tab.
          -- The default is "Normal"
          -- intensity = 'Normal',

          -- Specify whether you want "None", "Single" or "Double" underline for
          -- label shown for this tab.
          -- The default is "None"
          underline = 'None',

          -- Specify whether you want the text to be italic (true) or not (false)
          -- for this tab.  The default is false.
          italic = false,

          -- Specify whether you want the text to be rendered with strikethrough (true)
          -- or not for this tab.  The default is false.
          strikethrough = false,
        },

        -- Inactive tabs are the tabs that do not have focus
        inactive_tab = {
          bg_color = '#000000',
          fg_color = '#808080',

          -- The same options that were listed under the `active_tab` section above
          -- can also be used for `inactive_tab`.
        },

        -- You can configure some alternate styling when the mouse pointer
        -- moves over inactive tabs
        inactive_tab_hover = {
          bg_color = '#3b3052',
          fg_color = '#909090',
          italic = true,

          -- The same options that were listed under the `active_tab` section above
          -- can also be used for `inactive_tab_hover`.
        },

        -- The new tab button that let you create new tabs
        new_tab = {
          bg_color = '#000000',
          fg_color = '#808080',

          -- The same options that were listed under the `active_tab` section above
          -- can also be used for `new_tab`.
        },

        -- You can configure some alternate styling when the mouse pointer
        -- moves over the new tab button
        new_tab_hover = {
          bg_color = '#3b3052',
          fg_color = '#909090',
          italic = true,

          -- The same options that were listed under the `active_tab` section above
          -- can also be used for `new_tab_hover`.
        },
    }
  },
  window_frame = {
    active_titlebar_bg = '#000000',
  },
  color_scheme = 'tokyonight',
  disable_default_key_bindings = true,
  exit_behavior = 'Close',
  font = wezterm.font_with_fallback({
    {family = "FiraCode Nerd Font",},
    {family = "FiraCode Nerd Font Mono",},
    {family = "FiraCode Nerd Font Propo",},
    {family = "Hack Nerd Font"},
    {family = "Hack Nerd Font Mono"},
    {family = "Hack Nerd Font Propo"},
    {
      family = 'MesloLGS NF',
      weight = 'Bold',
      stretch = 'Normal',
      style = 'Normal',
      harfbuzz_features = { 'cv29', 'cv30', 'ss01', 'ss03', 'ss06', 'ss07', 'ss09' },
    },

  }),
  font_size = 10,
  force_reverse_video_cursor = true,
  hide_mouse_cursor_when_typing = true,
  hide_tab_bar_if_only_one_tab = false,
  tab_bar_at_bottom = true,
  keys = {
    { action = wezterm.action.ActivateCommandPalette, mods = 'CTRL|SHIFT', key =     'P' },
    { action = wezterm.action.CopyTo    'Clipboard' , mods = 'CTRL|SHIFT', key =     'C' },
    { action = wezterm.action.DecreaseFontSize      , mods =       'CTRL', key =     '-' },
    { action = wezterm.action.IncreaseFontSize      , mods =       'CTRL', key =     '=' },
    { action = wezterm.action.Nop                   , mods =        'ALT', key = 'Enter' },
    { action = wezterm.action.PasteFrom 'Clipboard' , mods = 'CTRL|SHIFT', key =     'V' },
    { action = wezterm.action.ResetFontSize         , mods =       'CTRL', key =     '0' },
    { action = wezterm.action.ToggleFullScreen      ,                      key =   'F11' },

    -- Split AND Pane
    { action = wezterm.action.CloseCurrentPane{confirm=true}, mods = 'CTRL|ALT', key = 'd'},
    { action = wezterm.action.SplitVertical{domain="CurrentPaneDomain"}, mods = 'CTRL|ALT', key = 's'},
    { action = wezterm.action.SplitHorizontal{domain="CurrentPaneDomain"}, mods = 'CTRL|ALT', key = 'v'},
    { action = wezterm.action.AdjustPaneSize{"Left", 1}, mods = 'CTRL|SHIFT|ALT', key = 'LeftArrow'},
    { action = wezterm.action.AdjustPaneSize{"Right", 1}, mods = 'CTRL|SHIFT|ALT', key = 'RightArrow'},
    { action = wezterm.action.AdjustPaneSize{"Up", 1}, mods = 'CTRL|SHIFT|ALT', key = 'UpArrow'},
    { action = wezterm.action.AdjustPaneSize{"Down", 1}, mods = 'CTRL|SHIFT|ALT', key = 'DownArrow'},
    { action = wezterm.action.ActivatePaneDirection "Up", mods = 'CTRL|ALT', key = 'UpArrow'},
    { action = wezterm.action.ActivatePaneDirection "Down", mods = 'CTRL|ALT', key = 'DownArrow'},
    { action = wezterm.action.ActivatePaneDirection "Left", mods = 'CTRL|ALT', key = 'LeftArrow'},
    { action = wezterm.action.ActivatePaneDirection "Right", mods = 'CTRL|ALT', key = 'RightArrow'},

    -- TAB AND WINDOW
    { action = wezterm.action.CloseCurrentTab{confirm=true}, mods = 'CTRL', key = 'D'},
    { action = wezterm.action.ActivateTabRelative(-1), mods = 'CTRL|SHIFT', key = 'Tab'},
    { action = wezterm.action.ActivateTabRelative(1), mods = 'CTRL', key = 'Tab'},
    { action = wezterm.action.SpawnCommandInNewWindow {domain = 'DefaultDomain'}, mods = 'CTRL|SHIFT', key = '~'},
    { action = wezterm.action.SpawnCommandInNewWindow {args = {"ssh.exe", "neovim@8.130.45.78"}, domain='DefaultDomain'}, mods = 'CTRL|SHIFT', key = '@'},
    { action = wezterm.action.SpawnCommandInNewWindow {domain = {DomainName='WSL:Ubuntu'}, cwd="~"}, mods = 'CTRL|SHIFT', key = '!'},
    { action = wezterm.action.SpawnCommandInNewWindow {domain='CurrentPaneDomain'}, mods = 'CTRL|SHIFT', key = 'Enter'},
    { action = wezterm.action.SpawnCommandInNewTab {args = {"ssh.exe", "neovim@8.130.45.78"}, domain='DefaultDomain'}, mods = 'CTRL', key = '2'},
    { action = wezterm.action.SpawnCommandInNewTab {domain='CurrentPaneDomain'}, mods = 'CTRL', key = 'Enter'},
    { action = wezterm.action.SpawnCommandInNewTab {domain='DefaultDomain'}, mods = 'CTRL', key = '`'},
    { action = wezterm.action.SpawnCommandInNewTab {domain={DomainName='WSL:Ubuntu'}, cwd="~"}, mods = 'CTRL', key = '1'},
  },
  scrollback_lines = 10000,
  show_update_window = true,
  use_dead_keys = false,
  unicode_version = 15,
  window_close_confirmation = 'NeverPrompt',
  window_padding = {
    left = 0,
    right = 0,
    top = '0.6cell',
    bottom = 0,
  },
}