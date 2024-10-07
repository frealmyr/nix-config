{ pkgs, ... }: {

  home = {
    packages = with pkgs;
    [
      (nerdfonts.override { fonts = [ "FiraMono" ]; })
    ];
  };

  fonts.fontconfig.enable = true;
}
