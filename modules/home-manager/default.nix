{ pkgs, ... }: {
  # specify my home-manager configs
  imports = [
    ./settings/zsh.nix
    ./settings/wezterm.nix
    ./settings/fonts.nix
    # ./settings/starship.nix
    # ./settings/tmux.nix
#    ./settings/neovim.nix
  ];

  home = {
    sessionVariables = {
      PAGER = "less";
      CLICLOLOR = 1;
      EDITOR = "nvim";
    };

    file.".inputrc".source = ./settings/inputrc;

    # Don't change this when you change package input. Leave it alone.
    stateVersion = "24.05"; # 23.11
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
}
