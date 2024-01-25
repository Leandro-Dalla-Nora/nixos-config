{ pkgs, ... }:

{
  # Este arquivo possui tudo o que é relacionado a linguagens de programação, comiladores, interpretadores, etc
  home.packages = with pkgs; [
    python3
  ];
}
