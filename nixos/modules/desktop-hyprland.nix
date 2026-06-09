{
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    ### DESKTOP ENVIRONMENT ###
    hyprpaper # Wallpapers
    hyprshot # Screenshots
    hypridle # Idle Daemon
    hyprlock # Lock Screen
    waybar # Desktop Bar
    wofi # Launcher
    mako # Notification Daemon
    kitty # Terminal
    #ghostty
    lxqt.lxqt-policykit # Polkit GUI
    brightnessctl
    adwaita-icon-theme # GTK symbolic icons

    ### TUI APPS ###
    wifitui # WIFI.
    bluetui # Bluetooth.
    btop # Performance.
    lazygit # Git.
    rmpc # MPD Client.

    ### DESKTOP APPS ###
    # GNOME
    nautilus # File Explorer
    loupe # Image Viewer
    showtime # Video Player
    decibels # Audio Player
    evince # Document Viewer
    snapshot # Camera Viewer
    simple-scan # Document Scanner
    gnome-calculator # Calculator
    # Other
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    gimp # Image Editor
    #obs-studio # Video Recorder
    #wayscriber # Desktop Drawing
    #spotify
    #steam
    #discord
    #libreoffice-qt-fresh
  ];

  programs.hyprland.enable = true;

  programs.nix-ld.enable = true;
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

  # Enable GNOME virtual FS for nautilus.
  services.gvfs.enable = true;

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
}
