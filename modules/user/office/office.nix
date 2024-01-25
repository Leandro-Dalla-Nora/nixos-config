{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libreoffice
    gnome.gnome-calculator
    gnome.nautilus
  ];
}