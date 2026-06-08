{ pkgs, inputs, ... }:

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
    wifitui
    bluetui

    ### DESKTOP APPS ###
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    nautilus # File Explorer
    loupe # Image Viewer
    showtime # Video Player
    decibels # Audio Player
    evince # Document Viewer
    snapshot # Camera Viewer
    simple-scan # Document Scanner
    gnome-calculator # Calculator
    #gimp # Image Editor
    #wayscriber # Desktop Drawing
    #obs-studio # Video Recorder
    #spotify
    #steam
    #discord
    #libreoffice-qt-fresh

    ### MUSIC ###
    # mpd
    # mpc
    # rmpc

    ### MEDIA CODECS ###
    # ffmpeg
    # flac
    # libvorbis
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
}
