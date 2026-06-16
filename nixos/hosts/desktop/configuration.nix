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
    ../../modules/desktop-hyprland.nix
    ../../modules/mpd.nix
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

  ############
  ### BOOT ###
  ############

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot = {
    consoleMode = "auto";
    editor = false;
  };

  ##################
  ### NETWORKING ###
  ##################

  networking.hostName = "desktop";
  networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "anthonydecruz" ];
      MaxAuthTries = 3;
      PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
    };
  };

  ################
  ### PACKAGES ###
  ################

  environment.systemPackages = with pkgs; [
    nvtopPackages.amd

    neovim
    tree-sitter
    gcc
    nixd
    codex
    tmux
    fzf

    jetbrains.rust-rover
    jetbrains.rider
    unityhub
  ];

  ##############
  ### GAMING ###
  ##############

  hardware.graphics.enable = true;

  programs.steam.enable = true;
  programs.gamescope.enable = true;

  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
  };
}
