{ config, pkgs, lib, ... } @ args:

{
  networking = {
    networkmanager.enable = true; 
    resolvconf.dnsExtensionMechanism = false;
    firewall = {
      enable = true;
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };
  };
}