
{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    ### MUSIC ###
    mpd
    mpc

    ### MEDIA CODECS ###
    ffmpeg
    flac
    libvorbis
  ];

  # Music Daemon
  services.mpd = {
    enable = true;
    user = "anthonydecruz";
    dataDir = "/home/anthonydecruz/.config/mpd";
    startWhenNeeded = true;

    settings = {
      music_directory = "/home/anthonydecruz/Music";
      playlist_directory = "/home/anthonydecruz/.config/mpd/playlists";
      restore_paused = true;
      audio_output = [
        {
          type = "pipewire";
          name = "PipewireOutput";
        }
      ];
    };
  };

  # As a system level service, MPD doesn't know the user level socket by default.
  systemd.services.mpd.environment = {
    # Update with your UID, it might change in multiuser systems.
    XDG_RUNTIME_DIR = "/run/user/1000";
  };
}
