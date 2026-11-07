{ pkgs, ... }:

{
  ###########
  ### NIX ###
  ###########

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  ##############
  ### LOCALE ###
  ##############

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  console.keyMap = "uk";

  ################
  ### SERVICES ###
  ################

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Firmware updates.
  services.fwupd.enable = true;

  # Bluetooth.
  hardware.bluetooth.enable = true;

  # Enable writing to devices.
  services.udisks2.enable = true;

  # Power management for connected devices.
  services.upower.enable = true;

  # Audio pipeline.
  security.rtkit.enable = true; # Allow realtime audio scheduling.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.extraConfig."10-bluez" = {
      "monitor.bluez.properties" = {
        # SubBand Codec eXtended Quality -
        #   Enable uni-directional A2DP codec. Should be higher quality.
        "bluez5.enable-sbc-xq" = true;
        # Modified SubBand Coding -
        #   Enable bi-directional codec. Should be better than the
        #   HandsFreeProfile and HeadsetProfile codecs.
        "bluez5.enable-msbc" = true; 
      };
    };
  };

  ################
  ### PACKAGES ###
  ################

  environment.systemPackages = with pkgs; [
    vim
    git
    nmap
  ];
}
