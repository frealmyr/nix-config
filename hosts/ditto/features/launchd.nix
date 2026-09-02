{ ... }: {
# Fix stuttering when streaming games over Moonlight
  launchd.daemons.streamingcheck = {
    script = ''
      test -n "$(pgrep 'streaming_client|Steam Link|Moonlight')" && {
          /sbin/ifconfig awdl0 down;
          /sbin/ifconfig llw0 down;
          echo "down";
          # NOTE: I don't use handoff/continuity, so always disabled.
          ## Disable continuity handoff feature
          # defaults write "/Users/$USERNAME/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist" ActivityAdvertisingAllowed -bool no;
      } || {
          /sbin/ifconfig awdl0 up;
          /sbin/ifconfig llw0 up;
          echo "up";
          # NOTE: I don't use handoff/continuity, so always disabled.
          ## Enable continuity handoff feature
          # defaults write "/Users/$USERNAME/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist" ActivityAdvertisingAllowed -bool yes;
      }
    '';
    serviceConfig = {
      EnvironmentVariables = {
        USERNAME = "fredrick";
      };
      StartInterval = 60;
      ThrottleInterval = 0;
      # RunAtLoad = true;
      StandardOutPath = "/var/log/streamingcheck.out.log";
      StandardErrorPath = "/var/log/streamingcheck.err.log";
    };
  };
}