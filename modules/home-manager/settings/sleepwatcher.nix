{ pkgs, ... }: {
  programs.gpg = {
    enable = true;
  };
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry_mac;
    enableSshSupport = true;
  };
}
