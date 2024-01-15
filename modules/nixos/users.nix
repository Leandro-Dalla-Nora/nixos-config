{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.leandro = {
    isNormalUser = true;
    description = "Leandro";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      #spotify
      #youtube-music
      #discord
      #tdesktop
      #vscode
      #brave

      # -------- adicionar os demais pacotes de usuário, como git, vscode, etc, da pasta users
    ];
  };

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
