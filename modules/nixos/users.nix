{ pkgs, themes, inputs, ...}:
let
  username = "leandro";
  theme = themes.custom (import ./themes/colors/catppuccin-mocha.nix);
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { 
      inherit inputs username theme; 
    };
    users.${username} = {
      imports = [ 
        ../user/browser/browser.nix

        # ../user/colors/default.nix

        ../user/development/git.nix
        ../user/development/ide.nix
        ../user/development/programming.nix

        ../user/office/office.nix

        ../user/themes/gtk.nix

        # ../user/wayland/default.nix
        ../user/wayland/foot.nix
        ../user/wayland/hyprland.nix
        ../user/wayland/waybar.nix
        ../user/wayland/wofi.nix

        ../user/default.nix
       ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "23.11";
      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" ];
    shell = pkgs.fish;
  };
  nix.settings.allowed-users = [ "${username}" ];

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}