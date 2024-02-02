{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    librewolf
    tor-browser
  ];
}