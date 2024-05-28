{ pkgs, ...}:

{
  # habilitar wayland
  services.xserver = {
    enable = true;
    xkb.variant = "";
    xkb.options = "caps:escape";
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
  
  environment.systemPackages = with pkgs; [
    at-spi2-atk
    qt6.qtwayland
    swaylock-effects
    swayidle
    grim
    slurp
    swappy
    wl-clipboard
    cliphist
    clipboard-jh
    wtype
    wlrctl
    hyprpicker
    pyprland
    dunst
    wlogout
    wpaperd
    kitty
  ];

  xdg.desktopEntries."org.gnome.Settings" = {
    name = "Settings";
    comment = "Gnome Control Center";
    icon = "org.gnome.Settings";
    exec = "env XDG_CURRENT_DESKTOP=gnome ${pkgs.gnome.gnome-control-center}/bin/gnome-control-center";
    categories = [ "X-Preferences" ];
    terminal = false;
  };
}
