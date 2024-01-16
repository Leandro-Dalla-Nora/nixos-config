{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libreoffice
    gnome.gnome-calculator
    gnome.nautilus
  ];
}