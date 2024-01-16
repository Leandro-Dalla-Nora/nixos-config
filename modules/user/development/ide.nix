{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscode
    jetbrains.pycharm-community
    jetbrains.idea-community
  ];
}