{ ... }:

{
  # Enable X11.
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };
  # Enable Gnome.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.gvfs.enable = true;
}
