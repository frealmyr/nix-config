{ config, pkgs, ... }: {
  # Secrets contains a envfile
  sops.secrets.traefik = {
      owner = config.users.users.traefik.name;
      group = config.users.users.traefik.group;
      restartUnits = [ "traefik.service" ];
  };

  services.traefik = {
    enable = true;
    environmentFiles = [ config.sops.secrets.traefik.path ];
    staticConfigOptions = {
      api.dashboard = true;
      entryPoints = {
        web = {
          address = ":80";
          asDefault = true;
          http.redirections.entrypoint = {
            to = "websecure";
            scheme = "https";
          };
        };
        websecure = {
          address = ":443";
          asDefault = true;
          http.tls.certResolver = "letsencrypt";
        };
      };
      certificatesResolvers.letsencrypt.acme = {
        email = "support@fmlab.no";
        storage = "${config.services.traefik.dataDir}/acme.json";
        # caServer =  "https://acme-staging-v02.api.letsencrypt.org/directory"; # staging
        dnsChallenge = {
            provider = "cloudflare";
            delayBeforeCheck = 5;
        };
      };
      log = {
        level = "INFO";
        filePath = "${config.services.traefik.dataDir}/traefik.log";
        format = "json";
      };
      global.sendAnonymousUsage = false;
    };
  };
  
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  services.traefik.dynamicConfigOptions = {
      http.routers = {
          dashboard = {
              rule = "Host(`traefik.fmlab.no`)";
              service = "api@internal";
            };
        };
    };
}

