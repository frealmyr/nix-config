{ self, pkgs, ... }: {

  # Implicit used by home-manager, else will default to /var/empty
  users.users.fredrick.home = "/Users/fredrick/";

    # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

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
    ];

  homebrew = {
    casks = [ 
      "discord"
      "obsidian"
      "ollama"
      "slack"
      # "launchcontrol"
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
