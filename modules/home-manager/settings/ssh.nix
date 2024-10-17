{ pkgs, ... }: {
  programs.ssh = {
    enable = true;
    hashKnownHosts = true;
    addKeysToAgent = "confirm";
    extraConfig = "UseKeychain yes";
    includes = [
      "~/.colima/ssh_config"
    ];
  };
}
