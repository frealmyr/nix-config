{ pkgs, ... }: {
  # specify my home-manager configs
  imports = [
    ./settings/zsh.nix
    ./settings/kitty.nix
    ./settings/tmux.nix
#    ./settings/neovim.nix
  ];

  home = {
    username = "fredrick";
    homeDirectory = "/Users/fredrick";
    packages = with pkgs; [
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
    ];

    sessionVariables = {
      PAGER = "less";
      CLICLOLOR = 1;
      EDITOR = "nvim";
    };
  };

  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    bat = {
      enable = true;
      config.theme = "TwoDark";
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    eza.enable = true;
    git.enable = true;
  };

  home.file.".inputrc".source = ./settings/inputrc;
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "24.05"; # 23.11
}
