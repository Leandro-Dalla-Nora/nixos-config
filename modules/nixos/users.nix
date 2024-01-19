{ pkgs, inputs, username, ...}:
let
  username = "leandro";
  packages = with pkgs; [
    vscode
    brave
  ];
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username; };
    users.${username} = {
      imports = [ (import ../user) ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "22.11";
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