{ pkgs, ... }: {
  services.yabai = {
    enable = true;
    config = {
      layout = "bsp";
      window_placement = "second_child";
      split_ratio = 0.5;
      auto_balance = "off";

      top_padding = 0;
      bottom_padding = 0;
      left_padding = 0;
      right_padding = 0;
      window_gap = 2;

      mouse_follows_focus = "off";
      focus_follows_mouse = "off";
      mouse_modifier = "alt";
      mouse_action1 = "move";
      mouser_action2 = "resize";
      # mouse_drop_action = "swap"; # TODO: Check what this does
    
    };
    extraConfig = ''
      ######################
      ## Floating Windows ##
      ######################

      ## System
      yabai -m rule --add app='^System Information$' manage=off
      yabai -m rule --add app='^System Settings$' manage=off
      yabai -m rule --add title='Preferences$' manage=off
      yabai -m rule --add app="^System Preferences$" sticky=on layer=above manage=off

      ## Tools
      yabai -m rule --add app='^Messages$' manage=off
      yabai -m rule --add app='^Cisco AnyConnect Secure Mobility Client$' manage=off
      yabai -m rule --add app='^Stats$' manage=off

      ## Coding
      yabai -m rule --add app='IntelliJ IDEA' title='^$' manage=off
      yabai -m rule --add app='IntelliJ IDEA' title='Project Structure' manage=off
      yabai -m rule --add app='IntelliJ IDEA' title='Preferences' manage=off
      yabai -m rule --add app='IntelliJ IDEA' title='Edit configuration' manage=off

      ## Office
      yabai -m rule --add app='^Microsoft Teams$' manage=off
      yabai -m rule --add app='^Calculator$' manage=off
      yabai -m rule --add app='^Calendar$' manage=off

      ## Music
      # yabai -m rule --add app='^Music$' manage=off

      ###################
      ## Event Exports ##
      ###################

      ## Workspace indicator tray
      yabai -m signal --add event=mission_control_exit action='echo "refresh" | nc -U /tmp/yabai-indicator.socket'
      yabai -m signal --add event=display_added action='echo "refresh" | nc -U /tmp/yabai-indicator.socket'
      yabai -m signal --add event=display_removed action='echo "refresh" | nc -U /tmp/yabai-indicator.socket'
      yabai -m signal --add event=window_created action='echo "refresh windows" | nc -U /tmp/yabai-indicator.socket'
      yabai -m signal --add event=window_destroyed action='echo "refresh windows" | nc -U /tmp/yabai-indicator.socket'
      yabai -m signal --add event=window_focused action='echo "refresh windows" | nc -U /tmp/yabai-indicator.socket'
      yabai -m signal --add event=window_moved action='echo "refresh windows" | nc -U /tmp/yabai-indicator.socket'
      yabai -m signal --add event=window_resized action='echo "refresh windows" | nc -U /tmp/yabai-indicator.socket'
      yabai -m signal --add event=window_minimized action='echo "refresh windows" | nc -U /tmp/yabai-indicator.socket'
      yabai -m signal --add event=window_deminimized action='echo "refresh windows" | nc -U /tmp/yabai-indicator.socket'

      ## Refocus after closing
      yabai -m signal --add event=window_destroyed action="yabai -m query --windows --window &> /dev/null || yabai -m window --focus mouse"
      yabai -m signal --add event=application_terminated action="yabai -m query --windows --window &> /dev/null || yabai -m window --focus mouse"
    '';
  };
}
