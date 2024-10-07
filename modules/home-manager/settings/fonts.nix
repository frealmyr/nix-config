{ pkgs, ... }: {

  home = {
    packages = with pkgs;
    [
      (nerdfonts.override { fonts = [
        "FiraMono"
        "FiraCode"
      ];})
    ];
  };

  fonts.fontconfig.enable = true;
}
