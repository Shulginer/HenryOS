# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  ###############
  # Boot/Kernel #
  ###############

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set bootloader timeout.
  boot.loader.timeout = 3;

  # During boot, check this swap partition for a hibernation image and resume from it if present. 
  boot.resumeDevice = "/dev/disk/by-uuid/3127cd0b-acec-4fc1-a1f7-40bd981933e0";

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable firmware with a license allowing redistribution.
  hardware.enableRedistributableFirmware = true;

  ####################
  # Network/Timezone #
  ####################

  networking.hostName = "MarshallJCM900"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  ############
  # Text/TTY #
  ############

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    #keyMap = "us";
    useXkbConfig = true; # use xkb.options in tty.
  };

  ###########
  # Desktop #
  ###########

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable greetd/tuigreet
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  # Enable Hyprland
  programs.hyprland.enable = true;

  # Enable foot ternminal
  programs.foot.enable = true;

  # Add fonts
  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
  ];

  ############
  # Keyboard #
  ############
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "dvorak";
  };

  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  ############
  # Printing #
  ############

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  #########
  # Audio #
  #########

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # rtkit (optional, recommended) allows Pipewire to use the realtime scheduler for increased performance.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment the following
    #jack.enable = true;
  };

  ############
  # Touchpad #
  ############

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  ################
  # Nix Settings #
  ################
 
  # Enable garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 	

  ########
  # User #
  ########

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.henrycrusher = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.users.henrycrusher = import ./home.nix;

  ############
  # Packages #
  ############

  # programs.firefox.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vis     
    wget
    curl
    git
    fastfetch
    swaybg
    pavucontrol
    crosspipe
    qutebrowser
    firefox
    brightnessctl
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  ############
  # Services #
  ############

  # Enable periodic SSD TRIM of mounted partitions in background. 
  services.fstrim.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}

