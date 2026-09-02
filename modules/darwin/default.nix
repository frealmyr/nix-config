{ self, ... }: {
  imports = [
    ./features/homebrew.nix
    ./features/keybindings.nix
    ./features/ollama.nix
    ./features/pkgs.nix
    ./features/security.nix
    ./features/system.nix
    ./features/yabai.nix
  ];

  # Nix settings, no touchy
  nix.enable = false; # Use determinate for managing nix daemon
  system.configurationRevision = self.rev or self.dirtyRev or null; # Set Git commit hash for darwin-version.
  system.stateVersion = 4; # Read changelog before changing, darwin-rebuild changelog
}
