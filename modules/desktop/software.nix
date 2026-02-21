{ config, lib, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # zip
    # xz
    # unzip
    # p7zip
    google-chrome # chromium
    # telegram-desktop
    vim
    kdePackages.kate
    neovim
    # xclip
    # xdg-utils
    # xorg.xrandr
    glibcLocales
    linuxHeaders
    linux-firmware
    # flameshot
    (python3.withPackages (ps: with ps; [
      ipython
    ]))
    alacritty
    ghostty
    # tmux
    git # used by nix flakes
    # RDP
    # Disk
    # vlc
    # obs-studio
    # ffmpeg
  ];
}
