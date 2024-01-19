{ pkgs, username, ... }: 
{
  services.xserver = {
    enable = true;
    layout = "br";
    libinput = {
      enable = true;
      # mouse = {
      #   accelProfile = "flat";
      # };
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}