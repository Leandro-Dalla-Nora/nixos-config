{ pkgs, ... }:

{
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    settings.mysqld.port = 3307;
  };

  # environment.systemPackages = with pkgs; [
  #   mysql-workbench
  # ];

}