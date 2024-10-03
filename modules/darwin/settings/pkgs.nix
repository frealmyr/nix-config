{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
      yabai
      skhd
    ];
}
