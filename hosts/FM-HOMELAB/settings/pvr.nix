{ pkgs, ... }:
let
  domain = "fmlab.no";
in
{
  users.groups.pvr = {};
  users.users.pvr = {
    createHome = false;
    isSystemUser = true;
    group = "pvr";
  };

  systemd.tmpfiles.rules = [
    "d /media/storage/downloads 0770 pvr pvr"
    "d /media/storage/downloads/.incomplete 0770 pvr pvr"
    "d /media/storage/entertainment 0770 pvr pvr"
  ];

  services = {
    jellyfin = {
      enable = true;
      group = "pvr";
    };
    sonarr = {
      enable = true;
      group = "pvr";
    };
    prowlarr = {
      enable = true;
    };
    transmission = {
      enable = true;
      group = "pvr";
      webHome = pkgs.flood-for-transmission;
      settings = {
        download-dir = "/media/storage/downloads";
        incomplete-dir = "/media/storage/downloads/.incomplete";
        incomplete-dir-enabled = true;
        trash-original-torrent-files = true;
        peer-port = 50180;
        utp-enabled = false;
        rpc-bind-address = "0.0.0.0";
        rpc-host-whitelist-enabled = true;
        rpc-host-whitelist = "127.0.0.1,transmission.${domain}"; #Whitelist your remote machine (10.0.0.1 in this example)
      };
      openPeerPorts = true;
      openRPCPort = false;
      extraFlags = [
        "--encryption-preferred"
        "--no-portmap"
        "--no-dht"
        "--no-pex"
      ];
    };
  };

  services.traefik.dynamicConfigOptions = {
    http = {
      routers = {
          jellyfin = {
            rule = "Host(`jellyfin.${domain}`)";
            service = "jellyfin";
          };
          sonarr = {
            rule = "Host(`sonarr.${domain}`)";
            service = "sonarr";
          };
          prowlarr = {
            rule = "Host(`prowlarr.${domain}`)";
            service = "prowlarr";
          };
          transmission = {
            rule = "Host(`transmission.${domain}`) && PathPrefix(`/transmission`)";
            service = "transmission";
          };
      };
      services = {
          jellyfin.loadBalancer.servers = [{ url = "http://localhost:8096"; }];
          sonarr.loadBalancer.servers = [{ url = "http://localhost:8989"; }];
          prowlarr.loadBalancer.servers = [{ url = "http://localhost:9696"; }];
          transmission.loadBalancer.servers = [{ url = "http://localhost:9091"; }];
      };
    };
  };
}

