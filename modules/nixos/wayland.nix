{ pkgs, ...}:

{
  # habilitar wayland
  services.xserver = {
    enable = true;
    xkbVariant = "";
    xkbOptions = "caps:escape";
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}