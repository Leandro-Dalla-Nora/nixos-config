{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vscode
    # jetbrains.pycharm-community
    # jetbrains.idea-community
  ];
}