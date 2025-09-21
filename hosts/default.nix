{
  nixpkgs,
  # nixpkgs-unstable,
  self,
  ...
}: let
  inherit (self) inputs;
  # Modules: Config Files
  ## The following config files contain host's settings
  core = ../modules/core;
  boot = ../modules/boot;
  bootextra = ../modules/boot/extra.nix;
  desktop = ../modules/desktop;
  develop = ../modules/develop;
  editor = ../modules/editor;
  user = ../modules/user;

  nixOverlay = { 
    nixpkgs.overlays = [ 
      inputs.nur.overlays.default
      inputs.emacs-overlay.overlay
    ]; 
  };
  hmModule = inputs.home-manager.nixosModules.home-manager;

  # Modules: Shared Config Files
  sharedModule = [
    core
    boot
    hmModule
    nixOverlay
    desktop
    develop
    editor
    user
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit self;
    };
    users.evims = {
      imports = [
        ../home
      ];
    };
  };
  
in {
  # All the hosts list as follows
  evims = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = 
      sharedModule ++ 
      [
        { networking.hostName = "evims"; }
        ./evims
        { inherit home-manager;}
      ]; 
      
    specialArgs = { inherit inputs; }; 
    # // makeSystem system;
  };

}
