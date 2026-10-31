{ pkgs, lib, ... }:

let
  yabai-indicator = pkgs.stdenvNoCC.mkDerivation rec {
    pname = "yabai-indicator";
    version = "0.3.4";
    hash = "sha256-Xd4YLa6+P0QhkyMtPN771mNkI1x/oEkLvF5n9C4ZEu8=";

    src = pkgs.fetchurl {
      url = "https://github.com/xiamaz/YabaiIndicator/releases/download/${version}/YabaiIndicator-${version}.zip";
      sha256 = hash;
    };

    nativeBuildInputs = [ pkgs.unzip ];

    installPhase = ''
      runHook preInstall
      mkdir -p $out/Applications
      cp -R $(find . -name "*.app" -maxdepth 2 | head -n 1) $out/Applications/
      runHook postInstall
    '';

    meta = with lib; {
      description = "MacOS Menubar Applet for showing spaces and switching spaces easily";
      homepage = "https://github.com/xiamaz/YabaiIndicator";
      license = licenses.mit;
      platforms = platforms.darwin;
    };
  };

in {
  environment.systemPackages = [
    pkgs.skhd
    pkgs.yabai
    yabai-indicator
  ];

  launchd = {
    user = {
      agents = {
        yabai-indicator = {
          command = "${yabai-indicator}/Applications/YabaiIndicator.app/Contents/MacOS/YabaiIndicator";
          serviceConfig = {
            KeepAlive = true;
            RunAtLoad = true;
            StandardOutPath = "/tmp/yabai-indicator.out.log";
            StandardErrorPath = "/tmp/yabai-indicator.err.log";
          };
        };
      };
    };
  };

  services.skhd = {
    enable = true;
  };

  services.yabai = {
    enable = true;
  };

  services.jankyborders = {
    enable = true;
    hidpi = true;
    # active_color = "0xffe1d8ef";
    inactive_color = "0x00000000";
    background_color = "0x00000000";
    width = 10.0;
    style = "square";
  };
}
