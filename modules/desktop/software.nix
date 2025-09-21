{ config, lib, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Extract Tools
    # zip
    # xz
    # unzip
    # p7zip

    # Broswer
    google-chrome # chromium

    # Chat
    # telegram-desktop

    # Editor
    vim
    kdePackages.kate
    neovim

    # Graphics & Graphical Utils
    # xclip
    # xdg-utils
    # xorg.xrandr

    # Locales
    glibcLocales

    # Linux Basic
    linuxHeaders
    linux-firmware

    # Picture Capture
    # flameshot

    # Python
    (python3.withPackages (ps: with ps; [
      ipython
    ]))

    # Terminal
    alacritty
    ghostty
    # tmux

    git # used by nix flakes

    # RDP
    # Disk
    # KDE Apperence
    lightly-qt

    # Video
    # vlc
    # obs-studio
    # ffmpeg
  ];
}
