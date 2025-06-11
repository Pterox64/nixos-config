{
  description = "Home configurations";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    attic.url = "github:zhaofengli/attic";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };
  outputs =
    {
      attic,
      nixpkgs,
      nixos-wsl,
      nixos-hardware,
      agenix,
      home-manager,
      nur,
      lanzaboote,
      sops-nix,
      plasma-manager,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        huawei_mate15 = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./machines/huawei-mate15/configuration.nix
            lanzaboote.nixosModules.lanzaboote
            agenix.nixosModules.default
            sops-nix.nixosModules.sops
            { environment.systemPackages = [ agenix.packages.${system}.default ]; }
            nixos-hardware.nixosModules.common-hidpi
            nixos-hardware.nixosModules.common-pc-laptop
            nixos-hardware.nixosModules.common-pc-laptop-ssd
            nixos-hardware.nixosModules.common-cpu-amd
            nixos-hardware.nixosModules.common-gpu-amd
          ];
        };
        htpc = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./machines/htpc/configuration.nix
            nixos-hardware.nixosModules.common-hidpi
            nixos-hardware.nixosModules.common-pc
            nixos-hardware.nixosModules.common-pc-ssd
            nixos-hardware.nixosModules.common-cpu-intel-cpu-only
          ];
        };
        server_attic = nixpkgs.lib.nixosSystem {
          inherit system;
          modules =
            [ ./machines/server-attic/configuration.nix ]
            ++ [ ./machines/server-attic/utilities.nix ]
            ++ [
              attic.nixosModules.atticd
              ./machines/server-attic/attic.nix
            ];
        };
        wsl = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./machines/wsl/configuration.nix
            nixos-wsl.nixosModules.default
            home-manager.nixosModules.home-manager
          ];
        };
      };

      homeConfigurations = {
        egor = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          modules = [
            {
              nixpkgs.overlays = [
                (final: prev: {
                  nur = import nur {
                    nurpkgs = prev;
                    pkgs = prev;
                  };
                })
              ];
            }
            plasma-manager.homeManagerModules.plasma-manager
            ./home/egor/home.nix
          ];
        };
        tanya = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          modules = [
            {
              nixpkgs.overlays = [
                (final: prev: {
                  nur = import nur {
                    nurpkgs = prev;
                    pkgs = prev;
                  };
                })
              ];
            }
            ./home/tanya/home.nix
          ];
        };
      };
    };
}
