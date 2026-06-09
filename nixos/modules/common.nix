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

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  ################
  ### PACKAGES ###
  ################

  environment.systemPackages = with pkgs; [
    vim
    git
    nixfmt
  ];
}
