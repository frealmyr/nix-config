{ pkgs, ... }: {
  nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    bat
    coreutils
    curl
    direnv
    ed
    findutils
    fzf
    gawk
    git
    gnugrep
    gnumake
    gnupg
    gnused
    gnutar
    htop
    jq
    less
    parallel
    skhd
    tmux
    tree
    vim
    wget
    xz
    yabai
    yq
    zsh
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
