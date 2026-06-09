{
  pkgs,
  ...
}:

{
  programs.zsh.enable = true;

  # Set password with "passwd"
  users.users."anthonydecruz" = {
    isNormalUser = true;
    description = "Anthony de Cruz";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
}
