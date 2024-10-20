{ self, ... }: {

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # hardware-specific stuff
  security.pam.enableSudoTouchIdAuth = true;

  imports = [
    ./settings/environment.nix
    ./settings/homebrew.nix
    ./settings/services.nix
    ./settings/system.nix
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
