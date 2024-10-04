{ pkgs, ... }: {
  # specify my home-manager configs
  imports = [
    # ./settings/zsh.nix
    ./settings/wezterm.nix
    # ./settings/tmux.nix
#    ./settings/neovim.nix
  ];

  home = {
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

  # Fonts
  # $HOME/Library/Fonts/HomeManager/*
  home.packages = with pkgs;
  [ 
    (nerdfonts.override { fonts = [ "FiraMono" ]; })
  ];
  fonts.fontconfig.enable = true; # Required for wezterms to use font pkgs

  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "24.05"; # 23.11
}
