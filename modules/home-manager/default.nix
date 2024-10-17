{ pkgs, ... }: {
  imports = [
    ./settings/bat.nix
    ./settings/direnv.nix
    # ./settings/firefox.nix
    ./settings/fonts.nix
    ./settings/fzf.nix
    ./settings/gh.nix
    ./settings/git.nix
    ./settings/gpg.nix
    # ./settings/neovim.nix
    # ./settings/sleepwatcher.nix
    ./settings/ssh.nix
    # ./settings/tmux.nix
    # ./settings/vscode.nix
    ./settings/wezterm.nix
    ./settings/zsh.nix
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
}
