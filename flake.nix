{
  description = "Evims's NixOS configuration";
  
  outputs = {
    self,
    nixpkgs,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} ({withSystem, ...}: {
      systems = [
        "x86_64-linux"
      ];

      flake = {
        nixosConfigurations = import ./hosts inputs;
      };
    });
  
  # nixConfig only affects the flake itself,not the system configuration
  nixConfig ={
    # enable nixcomman and flakes for nixos-rebuild switch --flake
    experimental-features = [ "nix-command" "flakes"];
    # replace official cache with mirrors located in China
    substituters = [
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.bfsu.edu.cn/nix-channels/store"
      # "https://cache.nixos.org/"
    ];
  };
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # Home manager,used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NixOS User Repository
    nur.url = "github:nix-community/NUR";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
}