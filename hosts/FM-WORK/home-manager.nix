{ lib, ... }: {
  home = lib.mkDefault {
    username = "fredrick";
    homeDirectory = "/Users/fredrick";
  };

  programs.git = {
    signing = {
      key = "9F4D30E1";
    };
  };

  programs.ssh = {
    matchBlocks = {
      "ssh.dev.azure.com" = {
        identityFile = "~/.ssh/azure-devops";
      };
      "*.ghe.com" = {
        identityFile = "~/.ssh/github-enterprise";
      };
      "gitlab.com" = {
        identityFile = "~/.ssh/gitlab";
      };
      "github.com" = {
        identityFile = "~/.ssh/personal_github";
      };
    };
  };

  programs.zsh = {
    initExtra = ''
      export NIX_SSL_CERT_FILE=/opt/nix-and-zscaler.crt
    '';

    shellAliases = {
      nixswitch = "SSL_CERT_FILE=/opt/nix-and-zscaler.crt darwin-rebuild switch --flake ~/SCM/Personal/nix-config";
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
