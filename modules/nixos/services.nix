{ pkgs, ... }:

{
  # Systemd services setup
  systemd.packages = with pkgs; [
    auto-cpufreq
    preload
    prelink
  ];
  
  # Enable Services
  services.geoclue2.enable = true;
  programs.direnv.enable = true;
  services.upower.enable = true;
  programs.fish.enable = true;
  programs.dconf.enable = true;
  services.dbus.enable = true;
  services.dbus.packages = with pkgs; [ # Ative para 
  	gnome2.GConf
  ];
  services.mpd.enable = true;
  programs.thunar.enable = true;
  services.tumbler.enable = true; 
  services.fwupd.enable = true;
  services.auto-cpufreq.enable = true;
  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  environment.systemPackages = with pkgs; [
    psi-notify
    poweralertd
    playerctl
    psmisc
    imagemagick
    ffmpeg_6-full
    wf-recorder
    xdg-utils
    avizo
    gifsicle
    psi-notify
    poweralertd
    playerctl
    psmisc
    imagemagick
    ffmpeg_6-full
    wf-recorder
    xdg-utils
    avizo
    gifsicle
    haruna
  ];
}
