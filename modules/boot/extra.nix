{ config, pkgs, lib, ... }:
{
  boot.extraModprobeConfig = ''
    options snd_hda_intel index=0 model=dell-headset-multi
  '';
}
  