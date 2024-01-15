{ pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xserver = true;
  };
  
  environment = {
    
    sessionVariables = { 
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };

    systemPackages = with pkgs; [
      wezterm
      cool-retro-term

      starship
      helix

      qutebrowser
      zathura
      mpv
      imv
    ];
  };
}
