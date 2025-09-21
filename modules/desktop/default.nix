{ config, lib, pkgs, ... }:
{

  services = {
    power-profiles-daemon.enable = false;
    upower.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable the X11 windowing system.
    xserver = {
      enable = true;
    };
    desktopManager.plasma6.enable = true;

    # Enable Sddm
    displayManager ={
      sddm.enable = true;
      sddm.theme = "${import ./sddm-theme.nix { inherit pkgs;}}";
    };
  
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;

      #media-session.enable = true;
    };

    blueman.enable = true;

    # https://flatpak.org/setup/NixOS
    flatpak.enable = false;

    # sysstat
    sysstat.enable = true;
  };

  services = {
    pulseaudio.enable = false;
  };

  programs = {
    dconf.enable = true;
    fish.enable = true;

  };

  # security with polkit
  security.polkit = {
    enable = true;
    extraConfig =
    ''
      polkit.addRule(function(action, subject) {
        if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" || action.id == "org.freedesktop.udisks.filesystem-mount-system-internal")  &&
            subject.local && subject.isInGroup("wheel"))
        {
            return polkit.Result.YES;
        }
      });
    '';
  };

  systemd = {
    user.services.plasma-polkit-agent = {
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # XDG
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      # xdg-desktop-portal-wlr # for wlroots based compositors(hyprland/sway)
      xdg-desktop-portal-gtk # for gtk
      kdePackages.xdg-desktop-portal-kde  # for kde
    ];
  };

  # add user's shell into /etc/shells
  environment.shells = with pkgs; [
    bash
    fish
  ];

  imports = [
    ./fonts.nix
    ./input.nix
    ./software.nix
  ];
}
