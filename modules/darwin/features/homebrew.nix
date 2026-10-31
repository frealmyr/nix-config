{ ... }: {
  homebrew = {
    enable = true;
    global.brewfile = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    brews = [
      {
        name = "sleepwatcher";
        start_service = true;
      }
    ];

    casks = [
      "betterdisplay"
      "firefox"
      "ghostty"
    ];
  };
}
