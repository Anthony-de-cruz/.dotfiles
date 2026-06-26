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
    nvtopPackages.intel

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

    moonlight-qt
  ];

  # Rebind keys.
  services.keyd = {
    enable = true;
    keyboards.default.settings = {
      main = {
        capslock = "esc";
      };
    };
  };

  ######################
  ### VIRTUALISATION ###
  ######################

  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "anthonydecruz" ];

  virtualisation.libvirtd.enable = true;

  ##############
  ### GAMING ###
  ##############

  hardware.graphics.enable = true;

  programs.steam.enable = true;
  programs.gamescope.enable = true;
}
