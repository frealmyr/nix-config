{ lib, ... }: {

  home = lib.mkDefault {
    username = "fredrick";
    homeDirectory = "/Users/fredrick";
  };

  programs.zsh = {
    shellAliases = {
      nixswitch = "darwin-rebuild switch --flake ~/SCM/Github/frealmyr/nix-config";
    };

    oh-my-zsh = {
      plugins = [
        "gcloud"
        "gh"
        "opentofu"
      ];
    };
  };
}
