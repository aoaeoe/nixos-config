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
  # Modules: Predefined
  ## Use nur overlay instead of nur module
  ## So that the home manager config files can use nur pkgs too
  ## Even I decided not to install any pkgs in home manager
  ## nurModule = inputs.nur.nixosModules.nur;
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
  
  # Use pkgs-unstable as specialArgs
  # makeSystem = system: {
  #   pkgs-unstable = import nixpkgs-unstable {
  #     inherit system;
  #     config = {
  #       allowUnfree = true;
  #     };
  #   };
  # };
  
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
