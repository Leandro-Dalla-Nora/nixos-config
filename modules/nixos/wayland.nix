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
  
  # environment.systemPackages = with pkgs; [
  #   wayland-protocols
  #   weston
  # ];
}
