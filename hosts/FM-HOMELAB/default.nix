{ pkgs, config, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/satisfactory.nix
    ./settings/pvr.nix
    ./settings/reverse-proxy.nix
    ./settings/storage.nix
  ];

  # Secrets
  sops.defaultSopsFile = ./.secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/fredrick/.config/sops/age/keys.txt";

  # Services
  # services.satisfactory = {
  #     enable = true;
  #     address = "192.168.0.20";
  # };

  # Power Savings
  powerManagement = {
    cpuFreqGovernor = lib.mkForce "powersave";
    powertop.enable = true;
  };
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';

  # Networking
  networking.networkmanager.enable = true;
  networking.hostName = "FM-HOMELAB";
  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [
    22
  ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = false;

  # Localization
  time.timeZone = "Europe/Oslo";
  i18n.defaultLocale = "en_US.UTF-8";

  # Users
  users.users.fredrick = {
    isNormalUser = true;
    extraGroups = [ "wheel" "pvr" ]; # Enable 'sudo' for the user.
    packages = with pkgs; [
      neovim
      fastfetch
    ];
  };

  # Environment
  environment.systemPackages = with pkgs; [
    git
  ];

  # Virtualisation
  virtualisation.docker = {
    enable = true;
    liveRestore = false;
    autoPrune.enable = true;
    autoPrune.dates = "weekly";
  };

  # Nix Stuff
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.05"; # No touchy, even after upgrading!
}
