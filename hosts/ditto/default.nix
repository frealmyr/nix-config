{ ... }: {

  imports = [
    ./features/homebrew.nix
    ./features/launchd.nix
    ./features/pkgs.nix
  ];

  services.jankyborders = {
    active_color = "0xffff70a6";
  };

  environment.shellAliases = {
    nixswitch = "darwin-rebuild switch --flake ~/nix-config";
  };

  # Nix settings
  system.primaryUser = "Fredrick";
  nixpkgs.hostPlatform = "aarch64-darwin"; # Set the architecture to aarch64-darwin
  system.stateVersion = 7; # Read changelog before changing, darwin-rebuild changelog
}
