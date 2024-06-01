{ pkgs, ... }: {
  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig = ''
      ##################
      ## Applications ##
      ##################

      alt - return : open -na Alacritty
      alt + shift - space : code --new-window
      alt + shift - return : open -na Firefox --args --ProfileManager
      alt + ctrl + cmd - space : /usr/bin/osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to not dark mode'

      ################
      ## Blacklists ##
      ################

      #.blacklist [
      #  "IntelliJ IDEA"
      #]

      #######################
      ## Window Management ##
      #######################

      ## Window - Switch current active window focus
      ctrl - up    : yabai -m window --focus north
      ctrl - right : yabai -m window --focus east
      ctrl - left  : yabai -m window --focus west
      ctrl - down  : yabai -m window --focus south
      ctrl - h  : yabai -m window --focus west
      ctrl - j  : yabai -m window --focus south
      ctrl - k  : yabai -m window --focus north
      ctrl - l  : yabai -m window --focus east

      ## Window - Move focused window
      alt + shift - up : yabai -m window --swap north || $(yabai -m window --display north; yabai -m display --focus north)
      alt + shift - right : yabai -m window --swap east || $(yabai -m window --display east; yabai -m display --focus east)
      alt + shift - left : yabai -m window --swap west || $(yabai -m window --display west; yabai -m display --focus west)
      alt + shift - down : yabai -m window --swap south || $(yabai -m window --display south; yabai -m display --focus south)
      alt + shift - h : yabai -m window --swap west || $(yabai -m window --display west; yabai -m display --focus west)
      alt + shift - j : yabai -m window --swap south || $(yabai -m window --display south; yabai -m display --focus south)
      alt + shift - k : yabai -m window --swap north || $(yabai -m window --display north; yabai -m display --focus north)
      alt + shift - l : yabai -m window --swap east || $(yabai -m window --display east; yabai -m display --focus east)

      ## Window - Set insertion point for new windows in focused container
      alt + ctrl - up    : yabai -m window --insert north
      alt + ctrl - right : yabai -m window --insert east
      alt + ctrl - left  : yabai -m window --insert west
      alt + ctrl - down  : yabai -m window --insert south
      alt + ctrl - h : yabai -m window --insert west
      alt + ctrl - j : yabai -m window --insert south
      alt + ctrl - k : yabai -m window --insert north
      alt + ctrl - l : yabai -m window --insert east

      ## Window - Navigate - Next/Previous workspace
      # cmd - left  : yabai -m space --focus prev
      # cmd - right : yabai -m space --focus next

      ## Window - Navigate - Change current workspace
      # cmd - 1 : yabai -m display --focus $(yabai -m query --displays --space 1 | jq '.index'); skhd --key "shift + ctrl + alt + cmd - 1"
      # cmd - 2 : yabai -m display --focus $(yabai -m query --displays --space 2 | jq '.index'); skhd --key "shift + ctrl + alt + cmd - 2"
      # cmd - 3 : yabai -m display --focus $(yabai -m query --displays --space 3 | jq '.index'); skhd --key "shift + ctrl + alt + cmd - 3"
      # cmd - 4 : yabai -m display --focus $(yabai -m query --displays --space 4 | jq '.index'); skhd --key "shift + ctrl + alt + cmd - 4"
      # cmd - 5 : yabai -m display --focus $(yabai -m query --displays --space 5 | jq '.index'); skhd --key "shift + ctrl + alt + cmd - 5"
      # cmd - 6 : yabai -m display --focus $(yabai -m query --displays --space 6 | jq '.index'); skhd --key "shift + ctrl + alt + cmd - 6"
      # cmd - 7 : yabai -m display --focus $(yabai -m query --displays --space 7 | jq '.index'); skhd --key "shift + ctrl + alt + cmd - 7"
      # cmd - 8 : yabai -m display --focus $(yabai -m query --displays --space 8 | jq '.index'); skhd --key "shift + ctrl + alt + cmd - 8"
      # cmd - 9 : yabai -m display --focus $(yabai -m query --displays --space 9 | jq '.index'); skhd --key "shift + ctrl + alt + cmd - 9"
      # cmd - 0 : yabai -m display --focus $(yabai -m query --displays --space 10 | jq '.index'); skhd --key "shift + ctrl + alt + cmd - 0"

      ## Window - Navigate - Move focused window to workspace
      cmd + shift - 1 : yabai -m window --space 1
      cmd + shift - 2 : yabai -m window --space 2
      cmd + shift - 3 : yabai -m window --space 3
      cmd + shift - 4 : yabai -m window --space 4
      cmd + shift - 5 : yabai -m window --space 5
      cmd + shift - 6 : yabai -m window --space 6
      cmd + shift - 7 : yabai -m window --space 7
      cmd + shift - 8 : yabai -m window --space 8
      cmd + shift - 9 : yabai -m window --space 9
      cmd + shift - 0 : yabai -m window --space 10

      # # mirror tree y-axis
      alt + shift - y : yabai -m space --mirror y-axis

      # # mirror tree x-axis
      alt + shift - x : yabai -m space --mirror x-axis

      # balance size of windows
      alt + shift - 0 : yabai -m space --balance

      # increase window size
      alt + shift - a : yabai -m window --resize left:-20:0
      alt + shift - s : yabai -m window --resize bottom:0:20
      alt + shift - w : yabai -m window --resize top:0:-20
      alt + shift - d : yabai -m window --resize right:20:0

      # decrease window size
      cmd + shift - a : yabai -m window --resize left:20:0
      cmd + shift - s : yabai -m window --resize bottom:0:-20
      cmd + shift - w : yabai -m window --resize top:0:20
      cmd + shift - d : yabai -m window --resize right:-20:0

      # change layout of desktop
      alt + shift - e : yabai -m space --layout bsp
      alt + shift - s : yabai -m space --layout float
      alt - e : yabai -m space --layout bsp
      alt - s : yabai -m space --layout stack

      # float / unfloat window and center on screen
      #alt - t : yabai -m window --toggle float;\
      #          yabai -m window --grid 4:4:1:1:2:2
      # float / unfloat window and leave in its current location
      cmd + ctrl + alt - f : yabai -m window --toggle float
      #alt + ctrl - space : yabai -m window --toggle float

      # make floating window fill screen
      alt + cmd - up     : yabai -m window --grid 1:1:0:0:1:1

      # make floating window fill left-half of screen
      alt + cmd - left   : yabai -m window --grid 1:2:0:0:1:1

      # make floating window fill right-half of screen
      alt + cmd - right  : yabai -m window --grid 1:2:1:0:1:1

      # create desktop, move window and follow focus
      alt + shift + cmd - n : yabai -m space --create;\
                      index="$(yabai -m query --spaces --display | jq 'map(select(."native-fullscreen" == 0))[-1].index')"; \
                      yabai -m window --space "''${index}";\
                      yabai -m space --focus "''${index}"

      # create desktop, move window and stay in current workspace
      alt + shift - n : yabai -m space --create;\
                        index="$(yabai -m query --spaces --display | jq 'map(select(."native-fullscreen" == 0))[-1].index')"; \
                        yabai -m window --space "''${index}"

      # create desktop and follow focus
      # Note: script fails when workspace is empty due to Yabai not reporting the workspace (bug?)
      #       best to use the create + move window command instead of creating a blank window
      alt - n : yabai -m space --create;\
                        index="$(yabai -m query --spaces --display | jq 'map(select(."native-fullscreen" == 0))[-1].index')"; \
                        yabai -m space --focus "''${index}"

      # destroy desktop
      alt + cmd - w : yabai -m space --destroy

      # close focused window
      alt - w : yabai -m window --close

      # toggle sticky
      alt + ctrl - s : yabai -m window --toggle sticky

      # enter fullscreen mode for the focused container
      alt - f : yabai -m window --toggle zoom-fullscreen

      # toggle window native fullscreen
      alt + shift - f : yabai -m window --toggle native-fullscreen

      # focus monitor
      alt + ctrl - x  : yabai -m display --focus recent
      alt + ctrl - z  : yabai -m display --focus prev
      alt + ctrl - c  : yabai -m display --focus next
      alt + ctrl - 1  : yabai -m display --focus 1
      alt + ctrl - 2  : yabai -m display --focus 2
      alt + ctrl - 3  : yabai -m display --focus 3
    '';
  };
}
