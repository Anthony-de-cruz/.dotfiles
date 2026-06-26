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
      "render"
      "video"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
}
