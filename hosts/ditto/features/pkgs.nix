{ pkgs-unstable, ... }: {
  environment.systemPackages = with pkgs-unstable; [
    colima
    docker
    lima
    fastfetch
    exiftool
  ];
}