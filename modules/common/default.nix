{ ... }: {
  imports = [
    ./features/direnv.nix
    ./features/environment.nix
    ./features/fonts.nix
    ./features/gnupg.nix
    ./features/pkgs.nix
    ./features/vim.nix
    ./features/zsh.nix
  ];
}
