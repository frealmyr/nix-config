{ lib, ... }: {
  home = lib.mkDefault {
    username = "fredrick";
    homeDirectory = "/Users/fredrick";
  };

  programs.zsh = {
    initExtra = ''
      export NIX_SSL_CERT_FILE=/opt/nix-and-zscaler.crt
    '';

    shellAliases = {
      nixswitch = "SSL_CERT_FILE=/opt/nix-and-zscaler.crt darwin-rebuild switch --flake ~/SCM/Github/frealmyr/nix-config";
    };

    oh-my-zsh = {
      plugins = [
        "aws"
        "azure"
        "fluxcd"
        "gh"
        "istioctl"
        "jira"
        "operator-sdk"
      ];
    };
  };
}
