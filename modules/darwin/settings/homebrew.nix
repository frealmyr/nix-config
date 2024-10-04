{ ... }: {
  homebrew = {
    enable = true;
    brewPrefix = "/opt/homebrew/bin";
    # caskArgs.no_quarantine = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    global = {
      brewfile = true;
      # lockfiles = true;
    };
    casks = [
      "betterdisplay"
      "firefox"
      "kitty"
      "visual-studio-code"
    ];
    taps = [
      "cormacrelf/tap" # provides: dark-notify
      "homebrew/services"
      "zackelia/formulae" # provides: bclm
    ];
    brews = [
      # {
      #   name = "bclm"; # https://github.com/zackelia/bclm/issues/49
      # }
      {
        name = "dark-notify";
      }
      {
        name = "sleepwatcher";
        start_service = true;
      }
    ];
  };

  system.stateVersion = 4;
}
