{ pkgs, ... }:

{
  # Este arquivo possui tudo o que é relacionado a linguagens de programação, comiladores, interpretadores, etc
  environment.systemPackages = with pkgs; [
    python3
  ];
}
