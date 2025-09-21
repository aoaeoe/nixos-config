{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # config proxy, and set global http prox, for example:
  # export HTTP_PROXY=http://192.168.110.73:7890
  # export HTTPS_PROXY=http://192.168.110.73:7890
  # export ALL_PROXY=socks5://192.168.110.73:7890
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}