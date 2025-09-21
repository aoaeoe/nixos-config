{ config, pkgs, lib, ... } @ args:

{
  system.stateVersion = "25.05";

  time = {
    timeZone = "Asia/Shanghai";
    hardwareClockInLocalTime = true;
  };

  # We need to enable unfree packages
  nixpkgs.config = {
    allowUnfree = lib.mkForce true;
    joypixels.acceptLicense = true;
  };
  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = true;
  programs.clash-verge.enable = true;

}
