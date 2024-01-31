{
  imports = [
  ];

  programs.niri.config = ''
    spawn-at-startup "swabg" "-i" "~/Pictures/Wallpapers/mult_falls.jpg"
    spawn-at-startup "ironbar"
    spawn-at-startup "mako"
  
    input {
      keyboard {
        xkb {
          layout "us"
        }
      }
      
      touchpad {
        tap
        natural-scroll
      }
    }
    
    output "eDP-1" {
      scale 1.0
      mode "1920x1080@60"
    }

    layout {
      border {
        width 4
        active-color 254 186 27 255
        inactive-color 80 73 69 170
      }
      
      focus-ring {
        off
      }

      preset-column-widths {
        proportion 0.45
        proportion 0.55
        proportion 0.8
      }

      default-column-width { proportion 0.45; }

      gaps 8

      center-focused-column "on-overflow"
    }
    
    screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

    binds {
      // Mod-Shift-/, which is usually the same as Mod-?,
      // shows a list of important hotkeys.
      Mod+Shift+Slash { show-hotkey-overlay; }
  
      // Suggested binds for running programs: terminal, app launcher, screen locker.
      Mod+Return { spawn "alacritty"; }
      Mod+A { spawn "fuzzel"; }
      Mod+B { spawn "vivaldi"; }
      Mod+F { spawn "thunar"; }
      
      Mod+Q { close-window; }
      
      // Volume key mappings
      XF86AudioRaiseVolume { spawn "bash" "pamixer" "-i" "5"; }
      XF86AudioLowerVolume { spawn "bash" "pamixer" "-d" "5"; }
      XF86AUdioMute { spawn "bash" "pamixer" "-t"; }

      // Brightness key mappings
      XF86MonBrightnessUp { "spawn" "bash" "light" "-A" "10"; }
      XF86MonBrightnessDown { "spawn" "bash" "light" "-U" "10"; }      
  
      Mod+Left  { focus-column-left; }
      Mod+Down  { focus-window-down; }
      Mod+Up    { focus-window-up; }
      Mod+Right { focus-column-right; }
      Mod+H     { focus-column-left; }
      Mod+J     { focus-window-down; }
      Mod+K     { focus-window-up; }
      Mod+L     { focus-column-right; }
  
      Mod+Ctrl+Left  { move-column-left; }
      Mod+Ctrl+Down  { move-window-down; }
      Mod+Ctrl+Up    { move-window-up; }
      Mod+Ctrl+Right { move-column-right; }
      Mod+Ctrl+H     { move-column-left; }
      Mod+Ctrl+J     { move-window-down; }
      Mod+Ctrl+K     { move-window-up; }
      Mod+Ctrl+L     { move-column-right; }
  
      // Alternative commands that move across workspaces when reaching
      // the first or last window in a column.
      // Mod+J     { focus-window-or-workspace-down; }
      // Mod+K     { focus-window-or-workspace-up; }
      // Mod+Ctrl+J     { move-window-down-or-to-workspace-down; }
      // Mod+Ctrl+K     { move-window-up-or-to-workspace-up; }
  
      Mod+Home { focus-column-first; }
      Mod+End  { focus-column-last; }
      Mod+Ctrl+Home { move-column-to-first; }
      Mod+Ctrl+End  { move-column-to-last; }
      
      // Alternatively, there are commands to move just a single window:
      // Mod+Shift+Ctrl+Left  { move-window-to-monitor-left; }
      // ...
  
      Mod+Page_Down      { focus-workspace-down; }
      Mod+Page_Up        { focus-workspace-up; }
      Mod+Ctrl+Page_Down { move-column-to-workspace-down; }
      Mod+Ctrl+Page_Up   { move-column-to-workspace-up; }
        
      // Alternatively, there are commands to move just a single window:
      // Mod+Ctrl+Page_Down { move-window-to-workspace-down; }
      // ...
  
      Mod+Shift+Page_Down { move-workspace-down; }
      Mod+Shift+Page_Up   { move-workspace-up; }
        
      Mod+1 { focus-workspace 1; }
      Mod+2 { focus-workspace 2; }
      Mod+3 { focus-workspace 3; }
      Mod+4 { focus-workspace 4; }
      Mod+5 { focus-workspace 5; }
      Mod+6 { focus-workspace 6; }
      Mod+7 { focus-workspace 7; }
      Mod+8 { focus-workspace 8; }
      Mod+9 { focus-workspace 9; }
      Mod+Ctrl+1 { move-column-to-workspace 1; }
      Mod+Ctrl+2 { move-column-to-workspace 2; }
      Mod+Ctrl+3 { move-column-to-workspace 3; }
      Mod+Ctrl+4 { move-column-to-workspace 4; }
      Mod+Ctrl+5 { move-column-to-workspace 5; }
      Mod+Ctrl+6 { move-column-to-workspace 6; }
      Mod+Ctrl+7 { move-column-to-workspace 7; }
      Mod+Ctrl+8 { move-column-to-workspace 8; }
      Mod+Ctrl+9 { move-column-to-workspace 9; }
  
      // Alternatively, there are commands to move just a single window:
      // Mod+Ctrl+1 { move-window-to-workspace 1; }
  
      Mod+Comma  { consume-window-into-column; }
      Mod+Period { expel-window-from-column; }
  
      Mod+R { switch-preset-column-width; }
      Mod+M { maximize-column; }
      Mod+Shift+M { fullscreen-window; }
      Mod+C { center-column; }
  
      // Finer width adjustments.
      // This command can also:
      // * set width in pixels: "1000"
      // * adjust width in pixels: "-5" or "+5"
      // * set width as a percentage of screen width: "25%"
      // * adjust width as a percentage of screen width: "-10%" or "+10%"
      // Pixel sizes use logical, or scaled, pixels. I.e. on an output with scale 2.0,
      // set-column-width "100" will make the column occupy 200 physical screen pixels.
      Mod+Minus { set-column-width "-10%"; }
      Mod+Equal { set-column-width "+10%"; }
  
      // Finer height adjustments when in column with other windows.
      Mod+Shift+Minus { set-window-height "-10%"; }
      Mod+Shift+Equal { set-window-height "+10%"; }
  
      // Actions to switch layouts.
      // Note: if you uncomment these, make sure you do NOT have
      // a matching layout switch hotkey configured in xkb options above.
      // Having both at once on the same hotkey will break the switching,
      // since it will switch twice upon pressing the hotkey (once by xkb, once by niri).
      // Mod+Space       { switch-layout "next"; }
      // Mod+Shift+Space { switch-layout "prev"; }
  
      Print { screenshot; }
      Ctrl+Print { screenshot-screen; }
      Alt+Print { screenshot-window; }
  
      Mod+Shift+E { quit; }
      Mod+Shift+P { power-off-monitors; }
  
      Mod+Shift+Ctrl+T { toggle-debug-tint; }
    }
  '';
}
