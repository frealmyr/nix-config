{ pkgs, ... }: {
  environment = {
    loginShell = pkgs.zsh;
    systemPath = [ "/usr/local/bin" ];
  };
}
