{ pkgs, ... }: {
  environment = {
    shells = with pkgs; [ bash zsh ];
    systemPackages = [ pkgs.coreutils ];
    pathsToLink = [ "/Applications" ];
    variables = {
      VISUAL = "vim";
      PAGER = "less";
      LESS = "-eFRX";
    };
  };
}
