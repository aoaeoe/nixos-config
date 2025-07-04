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
    google-chrome

    # Chat
    # telegram-desktop

    # Editor
    kate
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
    # libsForQt5.krdc

    # Polkit
    # libsForQt5.polkit-kde-agent

    # Disk
    # libsForQt5.filelight

    # SDDM Theme Dependencies
     # SDDM Theme Dependencies
#     environment.systemPackages = [
#       pkgs.qt6Packages.qtquickcontrols2
#       pkgs.qt6Packages.qtgraphicaleffects
# #       pkgs.blueman
#     ];
    # KDE Apperence
    lightly-qt

    # Video
    # vlc
    # obs-studio
    # ffmpeg
  ];
}
