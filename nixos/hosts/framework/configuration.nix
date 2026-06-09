# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
	  ../../modules/common.nix
	  ../../modules/user.nix
	  ../../modules/mpd.nix
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

  ############
  ### BOOT ###
  ############

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot = {
    consoleMode = "auto";
    editor = false;
  };

  boot.kernelModules = [ "tun" ]; # For networking.

  ##################
  ### NETWORKING ###
  ##################

  networking.hostName = "framework";
  networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  # GNOME virtual fs. Enables trash locations for explorer.
  services.gvfs.enable = true;

  ################
  ### PACKAGES ###
  ################

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    ### CLI UTILS ###
    zsh
    tmux
    btop
    fzf
    yazi # File Explorer TUI
    poppler # Yazi PDF Preview
    jq # Yazi JSON Preview
    ripgrep # Yazi File Search
    fd # Yazi Directory Search
    zoxide # Yazi Search History
    fastfetch # Ofc

    ### NETWORKING ###
    wifitui
    bluetui
    nmap
    wget
    curl
    tcpdump
    nftables
    conntrack-tools
    dnsmasq

    ### DEV TOOLS ###
    # VCS
    git
    lazygit
    # AI
    opencode
    codex
    # Debugging
    gdb
    # Nix
    nixd
    # C/C++
    gcc
    gnumake
    cmake
    # Python
    uv
    ruff
    python314
    pyright
    # Rust
    rustup
    # Lua
    luajitPackages.lua-lsp
    stylua
    # JS
    nodejs_22
    prettierd

    ### DESKTOP ENVIRONMENT ###
    hyprpaper # Wallpapers
    hyprshot # Screenshots
    hypridle # Idle Daemon
    hyprlock # Lock Screen
    waybar # Desktop Bar
    wofi # Launcher
    mako # Notification Daemon
    kitty # Terminal
    ghostty
    lxqt.lxqt-policykit # Polkit GUI
    brightnessctl
    adwaita-icon-theme # GTK symbolic icons

    ### DESKTOP APPS ###
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    nautilus # File Explorer
    loupe # Image Viewer
    showtime # Video Player
    vlc # General Media Player
    evince # Document Viewer
    snapshot # Camera Viewer
    simple-scan # Document Scanner
    gnome-calculator # Calculator
    gimp # Image Editor
    wayscriber # Desktop Drawing
    obs-studio # Video Recorder
    spotify
    steam
    #discord
    #libreoffice-qt-fresh

    ### EDITORS ###
    # CLI
    vim
    neovim
    tree-sitter
    # GUI
    zed-editor
    #jetbrains.pycharm
    #jetbrains.datagrip
    jetbrains.rust-rover
    jetbrains.rider
    unityhub
    obsidian # Markdown Editor

    ### VIRTUALISATION ###
    quickemu
    spice
  ];

  programs.nix-ld.enable = true;
  programs.direnv.enable = true;

  #############
  ### USERS ###
  #############

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "anthonydecruz" = import ./home.nix; # Pass args down to our modules.
    };
  };

  ######################
  ### VIRTUALISATION ###
  ######################

  virtualisation.docker.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    allowedBridges = [ "br-5g" ]; # For a project.
  };

  ###########################
  ### DESKTOP ENVIRONMENT ###
  ###########################

  programs.hyprland.enable = true;

  # Stylix *may* require ld to link non native binaries.
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
    polarity = "dark";
    targets.gtk.enable = true;
  };

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    font-awesome
    material-design-icons
  ];

  # Allow hyprland to handle laptop lid switch.
  services.logind = {
    settings.Login = {
      HandleLidSwitch = "ignore";
      HandleLidSwitchDocked = "ignore";
      HandleLidSwitchExternalPower = "ignore";
    };
  };

  systemd.sleep.settings.Sleep = {
    HibernateDelaySec = "30m";
  };

  # Rebind keys.
  services.keyd = {
    enable = true;
    keyboards.default.settings = {
      main = {
        capslock = "esc";
      };
    };
  };

  ####################
  ### POLKIT / XDG ###
  ####################

  security.polkit.enable = true;

  systemd.user.services.polkit-lxqt-agent = {
    description = "LXQt Polkit Agent";
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.lxqt.lxqt-policykit}/bin/lxqt-policykit-agent";
      Restart = "on-failure";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  ##############
  ### GAMING ###
  ##############

  programs.steam.enable = true;
  programs.gamescope.enable = true;
}
