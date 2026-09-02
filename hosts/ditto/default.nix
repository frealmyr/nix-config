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
  # nix.settings.trusted-users = [ "fredrick" ]; # Danger! https://github.com/NixOS/nix/issues/6672#issuecomment-2335184129
  nixpkgs.hostPlatform = "aarch64-darwin"; # Set the architecture to aarch64-darwin
  system.stateVersion = 4; # Read changelog before changing, darwin-rebuild changelog
}
