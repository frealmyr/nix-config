{ pkgs, ... }: {

  # ZScaler Fuckery
  nix.settings.ssl-cert-file = "/opt/nix-and-zscaler.crt";
  security.pki.certificates = [
    "/opt/nix-and-zscaler.crt"
  ];

  environment.systemPackages = with pkgs; [
      bat
      curl
      ed
      findutils
      gawk
      gnused
      gnutar
      gnupg
      htop
      less
      gnumake
      neofetch
      neovim
      parallel
      tree
      vim
      wget
      xz
      jq
      yq
      cowsay
      fortune
    ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
