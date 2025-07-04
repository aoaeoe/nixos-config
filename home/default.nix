{ config, lib, pkgs, ... }:

{
  imports = [
    ./config
  ];

  home.username = "evims";
  home.homeDirectory = "/home/evims";

  xresources.properties = {
    "Xcursor.size" = 14;
    #"Xft.dpi" = 172;
  };

  # programs.zsh.enable = true;
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

}
