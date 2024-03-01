{ pkgs, ... }: {
  imports = [
  ];

  wayland.windowManager.river = {
    enable = true;
    xwayland.enable = true;
    package = null;
    extraConfig = ''
      #!${pkgs.bash}/bin/bash
      # This is the example configuration file for river.
      #
      # If you wish to edit this, you will probably want to copy it to
      # $XDG_CONFIG_HOME/river/init or $HOME/.config/river/init first.
      #
      # See the river(1), and riverctl(1), and filtile(1) man pages for complete
      # documentation.
      
      # Note: the "Super" modifier is also known as Logo, GUI, Windows, Mod4, etc.

      # Spawn at startup
      riverctl spawn filtile
      riverctl spawn "swaybg -i ~/Pictures/Wallpapers/mult_falls.jpg"
      riverctl spawn waybar
      riverctl spawn nm-applet
      riverctl spawn blueman-applet
      riverctl spawn "swayidle -w timeout 120 'swaymsg \"output * dpms off\"' timeout 150 'swaylock -f'"
      riverctl spawn "swayidle -w timeout 10 'if pgrep -x swaylock; then swaymsg \"output * dpms off\"; fi'"
      riverctl spawn sway-audio-idle-inhibit
          
      # Shortcuts for applications
      riverctl map normal Super Return spawn alacritty
      riverctl map normal Super A spawn kickoff
      riverctl map normal Super B spawn vivaldi
      riverctl map normal Super F spawn thunar
      
      # Super+Q to close the focused view
      riverctl map normal Super Q close
      
      # Super+Shift+E to exit river
      riverctl map normal Super+Shift E exit
      
      # Super+J and Super+K to focus the next/previous view in the layout stack
      riverctl map normal Super J focus-view next
      riverctl map normal Super K focus-view previous
      
      # Super+Shift+J and Super+Shift+K to swap the focused view with the next/previous
      # view in the layout stack
      riverctl map normal Super+Shift J swap next
      riverctl map normal Super+Shift K swap previous
      
      # Super+Period and Super+{Period,Comma} to focus the next/previous output
      riverctl map normal Super Period focus-output next
      riverctl map normal Super Comma focus-output previous
      
      # Super+Shift+{Period,Comma} to send the focused view to the next/previous output
      riverctl map normal Super+Shift Period send-to-output next
      riverctl map normal Super+Shift Comma send-to-output previous
      
      # Super+Return to bump the focused view to the top of the layout stack
      riverctl map normal Super S zoom

      # Super+Z to flip the main area to the other side
      riverctl map normal Super Z send-layout-cmd filtile "flip"

      # Super+{Arrow keys} to move the main location to that position
      riverctl map normal Super LEFT send-layout-cmd filtile "main-location left"
      riverctl map normal Super RIGHT send-layout-cmd filtile "main-location right"
      riverctl map normal Super UP send-layout-cmd filtile "main-location top"
      riverctl map normal Super DOWN send-layout-cmd filtile "main-location bottom"
      
      # Super+Shift+{Arrow keys} to move the split that direction
      riverctl map normal Super+Shift LEFT send-layout-cmd filtile "move-split-left 5"
      riverctl map normal Super+Shift RIGHT send-layout-cmd filtile "move-split-right 5"
      riverctl map normal Super+Shift UP send-layout-cmd filtile "move-split-up 5"
      riverctl map normal Super+Shift DOWN send-layout-cmd filtile "move-split-down 5"
          
      # Super+Shift+H and Super+Shift+L to increment/decrement the main count of filtile(1)
      riverctl map normal Super+Shift H send-layout-cmd filtile "main-count +1"
      riverctl map normal Super+Shift L send-layout-cmd filtile "main-count -1"
               
      # Super + Left Mouse Button to move views
      riverctl map-pointer normal Super BTN_LEFT move-view
      
      # Super + Right Mouse Button to resize views
      riverctl map-pointer normal Super BTN_RIGHT resize-view
      
      # Super + Middle Mouse Button to toggle float
      riverctl map-pointer normal Super BTN_MIDDLE toggle-float
      
      for i in $(seq 1 9)
      do
          tags=$((1 << ($i - 1)))
      
          # Super+[1-9] to toggle focus of tag [0-8]
          riverctl map normal Super $i toggle-focused-tags $tags
      
          # Super+Shift+[1-9] to tag focused view with tag [0-8]
          riverctl map normal Super+Shift $i set-view-tags $tags
      
          # Super+Control+[1-9] to focus tag [0-8]
          riverctl map normal Super+Control $i set-focused-tags $tags
      
          # Super+Shift+Control+[1-9] to toggle tag [0-8] of focused view
          riverctl map normal Super+Shift+Control $i toggle-view-tags $tags
      done
      
      # Super+0 to focus all tags
      # Super+Shift+0 to tag focused view with all tags
      all_tags=$(((1 << 32) - 1))
      riverctl map normal Super 0 set-focused-tags $all_tags
      riverctl map normal Super+Shift 0 set-view-tags $all_tags

      # Scratch pad on unused tag 20
      scratch_tag=$((1 << 20))

      # Toggle scratchpad with Super+P
      riverctl map normal Super P toggle-focused-tags ''${scratch_tag}

      # Send windows to the scratchpad with Super+Shift+P
      riverctl map normal Super+Shift P set-view-tags ''${scratch_tag}
      
      # Set spawn tagmask to ensure new windows don't have the scratchpad tag unless
      # explicitly set.
      all_but_scratch_tag=$(( ((1 << 32) - 1) ^ $scratch_tag))
      riverctl spawn-tagmask ''${all_but_scratch_tag}

      # Make windows titled "scratch" always float by default
      riverctl float-filter-add title "scratch"

      # Spawn scratchpad 
      riverctl spawn "alacritty -T scratch"
      
      # Super+Space to toggle float
      riverctl map normal Super Space toggle-float
      
      # Super+M to toggle monocle
      riverctl map normal Super M send-layout-cmd filtile "monocle"
                     
      # Declare a passthrough mode. This mode has only a single mapping to return to
      # normal mode. This makes it useful for testing a nested wayland compositor
      riverctl declare-mode passthrough
      
      # Super+F11 to enter passthrough mode
      riverctl map normal Super F11 enter-mode passthrough
      
      # Super+F11 to return to normal mode
      riverctl map passthrough Super F11 enter-mode normal
      
      # Various media key mapping examples for both normal and locked mode which do
      # not have a modifier
      for mode in normal locked
      do
          # Control pulse audio volume with pamixer (https://github.com/cdemoulins/pamixer)
          riverctl map $mode None F8 spawn 'pamixer -i 5'
          riverctl map $mode None F7 spawn 'pamixer -d 5'
          riverctl map $mode None F6 spawn 'pamixer --toggle-mute'
                   
          # Control screen backlight brightness with light (https://github.com/haikarainen/light)
          riverctl map $mode None F3 spawn 'light -A 5'
          riverctl map $mode None F2 spawn 'light -U 5'
      done
      
      # Set background and border color
      riverctl background-color 0x002b36
      riverctl border-color-focused 0x93a1a1
      riverctl border-color-unfocused 0x586e75
      
      # Set keyboard repeat rate
      riverctl set-repeat 50 300
      
      # Configure touchpad
      riverctl input pointer-1739-32951-SYN2602:00_06CB:80B7_Touchpad tap enabled
      riverctl input pointer-1739-32951-SYN2602:00_06CB:80B7_Touchpad drag enabled
      riverctl input pointer-1739-32951-SYN2602:00_06CB:80B7_Touchpad natural-scroll enabled
      riverctl input pointer-1739-32951-SYN2602:00_06CB:80B7_Touchpad scroll-method two-finger
      riverctl input pointer-1739-32951-SYN2602:00_06CB:80B7_Touchpad tap-button-map left-right-middle
      
      # Set the default layout generator to be filtile and start it.
      # River will send the process group of the init executable SIGTERM on exit.
      riverctl default-layout filtile
      riverctl send-layout-cmd filtile smart-padding off
    '';
  };
}
