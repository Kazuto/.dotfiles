{ config, pkgs, home-manager, ... }:

{
  imports = [
    ./hardware-configuration.nix
    <home-manager/nixos>
  ];

  # Bootloader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };

    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "amaterasu";

    # Enables wireless support via wpa_supplicant.
    # wireless.enable = true;

    # Enable networking
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;
      displayManager.sddm.enable = true;

      # Configure keymap in X11
      layout = "de";
      xkbVariant = "mac_nodeadkeys";

      # Enable touchpad support (enabled default in most desktopManager).
      # libinput.enable = true;
    };


    # Enable CUPS to print documents.
    printing = {
      enable = true;
    };
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kazuto = import ./user.nix;
  home-manager.users.kazuto = import ./hm.nix;

  users.defaultUserShell = pkgs.zsh;

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "kazuto";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
    # If you cursor becomes invisible
    # WLR_NO_HARDWARE_CURSORS = "1";

    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Hyprland
    blueman
    brightnessctl
    curl
    dunst
    hyprland
    hyprpaper
    hyprpicker
    libnotify
    papirus-icon-theme
    pavucontrol
    pipewire
    polkit_gnome
    rofi-wayland
    sddm
    viewnior
    waybar
    wget
    wlroots
    wlogout
    wl-clipboard
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    xdg-utils
    xfce.thunar
    xwayland

    # Applications
    bitwarden
    brave
    discord
    firefox-wayland
    mailspring
    nextcloud-client
    spotify
    teams
    telegram-desktop

    # Development
    codespell
    cz-cli
    dbeaver
    docker
    editorconfig-checker
    fd
    gcc
    git
    gitkraken
    insomnia
    jetbrains.phpstorm
    kitty
    neovim
    nodejs_20
    nodePackages.eslint_d
    nodePackages.npm
    nodePackages.postcss
    nodePackages.prettier_d_slim
    nodePackages.vercel
    nodePackages.volar
    nodePackages.yarn
    oh-my-zsh
    php
    php81Packages.composer
    python311
    python311Packages.pip
    postman
    supabase-cli
    trash-cli
    tree
    vscode
    zsh
    zsh-powerlevel10k

    # Utilities
    bat
    exa
    gparted
    htop
    neofetch
    qemu_kvm
    ripgrep
  ];

  programs.hyprland = {
    enable = true;

    xwayland = {
      hidpi = true;
      enable = true;
    };
  };

  programs.zsh.enable = true;

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
       nerdfonts
       font-awesome
       google-fonts
    ];
  };

  environment.shells = with pkgs; [ zsh ];
  environment.pathsToLink = [ "/share/zsh" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:
  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
