{ pkgs, ... }: {

  # ZScaler Fuckery
  nix.settings.ssl-cert-file = "/opt/nix-and-zscaler.crt";
  security.pki.certificates = [
    "/opt/nix-and-zscaler.crt"
  ];

  environment.systemPackages = with pkgs; [
      colima
      cowsay
      docker
      fortune
      kind
      lima
      neofetch
      neovim
      pinentry_mac
      skhd
      yabai
    ];

  homebrew = {
    brewPrefix = "/opt/homebrew/bin";
    enable = true;
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
      "background-music"
      "discord"
      "moonlight"
      "netnewswire"
      "obs"
      "prusaslicer"
      "steam"
      "tailscale"
      # "launchcontrol"
    ];
    taps = [
      "cormacrelf/tap" # provides: dark-notify
      "zackelia/formulae" # provides: bclm
    ];
    # brews = [ "trippy" ];

  };
}

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
