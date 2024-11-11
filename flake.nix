{
  description = "Nix superpowers, lets go!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = inputs@{ self, nix, nixos-hardware, nixpkgs, nixpkgs-darwin, darwin, sops-nix }: {
    darwinConfigurations.FM-MBP = darwin.lib.darwinSystem {
      modules = [
        ({ pkgs, ... }: import ./modules/common { inherit self inputs pkgs; })
        ({ pkgs, ... }: import ./modules/darwin { inherit self inputs pkgs; })
        ({ pkgs, ... }: import ./hosts/FM-MBP { inherit self inputs pkgs; })
      ];
    };

    darwinConfigurations.FM-WORK = darwin.lib.darwinSystem {
      modules = [
        ({ pkgs, ... }: import ./modules/common { inherit self inputs pkgs; })
        ({ pkgs, ... }: import ./modules/darwin { inherit self inputs pkgs; })
        ({ pkgs, ... }: import ./hosts/FM-WORK { inherit self inputs pkgs; })
      ];
    };

    nixosConfigurations.FM-HOMELAB = nixpkgs.lib.nixosSystem {
      modules = [
        ({ pkgs, ... }: import ./modules/common { inherit self inputs pkgs; })
        ({ pkgs, ... }: import ./modules/nixos { inherit self inputs pkgs; })
        ./hosts/fm-srv
        sops-nix.nixosModules.sops
      ];
    };
  };
}
