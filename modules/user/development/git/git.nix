{ config, lib, pkgs, name, email, ... }:

{
  programs.git = {
    enable = true;
  };
}