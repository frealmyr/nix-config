{ pkgs, ... }: {

  # Implicit used by home-manager, else will default to /var/empty
  users.users.fredrick.home = "/Users/fredrick/";

    # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

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
    casks = [
      "background-music"
      "discord"
      "moonlight"
      "netnewswire"
      "obs"
      "prusaslicer"
      "steam"
      "tailscale"
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
