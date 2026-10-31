{ pkgs-unstable, ... }: {
  environment.systemPackages = with pkgs-unstable; [
    fastfetch
    exiftool
  ];
}