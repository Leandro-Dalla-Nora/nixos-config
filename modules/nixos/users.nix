{ pkgs, inputs, ...}:
let
  username = "leandro";
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { 
      inherit inputs username; 
    };
    users.${username} = {
      imports = [ 
        # ( ../user/default.nix )
         ../user/browser/browser.nix 
        ../user/development/ide.nix
        ../user/development/programming.nix
        ../user/development/git.nix
        ../user/browser/browser.nix
        ../user/office/office.nix
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