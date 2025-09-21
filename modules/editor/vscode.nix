{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs;[
    # vscode-fhs
    vscode
  ];
}
