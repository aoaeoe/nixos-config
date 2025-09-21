{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  };
#   boot.loader ={
#     efi = {
#       canTouchEfiVariables = false;
#       efiSysMountPoint = "/boot";
#     };
#     grub = {
#       enable = true;
#       devices = [ "nodev" ];
#       efiSupport = true;
#     };
#   };

  networking.hostName = "evims";   # Define your hostname.

  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";


  # Select internationalisation properties.
  i18n.defaultLocale = "zh_CN.UTF-8";
#   i18n.defaultLocale = "en_US.UTF-8";
  console = {
    # font = "Lat2-Terminus16";
    # keyMap = "us";
    useXkbConfig = true; # use xkbOptions in tty.
  };
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

#   i18n.supportedLocales = [
#     "en_US.UTF-8/UTF-8"
#     "zh_CN.UTF-8/UTF-8"
#     "zh_TW.UTF-8/UTF-8"
#     "zh_HK.UTF-8/UTF-8"
#   ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the Plasma 5 Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;


  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
#   sound.enable = false;
  services.pulseaudio.enable = false;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.evims = {
    name = "evims";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
  };
  nix.settings = {
    substituters = lib.mkForce [ 
      "https://mirror.sjtu.edu.cn/nix-channels/store"
    ];
    experimental-features = ["nix-command" "flakes"];
  };

  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    tree
    wget
    curl
    glibcLocales

    # nix utils
    nh
    nix-output-monitor

    # system tools
    sysstat
    pciutils
    usbutils

    # System Utils
    killall
    alsa-lib
    alsa-utils
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  users.users.root.shell = pkgs.fish;
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  networking.firewall.allowedUDPPorts = [ 22 ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
  # system.copySystemConfiguration = true;

  system.stateVersion = "25.05"; # Did you read the comment?

  time.hardwareClockInLocalTime = true;
}
