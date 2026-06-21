{ config, pkgs, lib, ... } @ args:

{
  networking = {
    networkmanager.enable = true; 
    resolvconf.dnsExtensionMechanism = false;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 9002 ];
      # allowedUDPPorts = [ ... ];
    };
  };
}