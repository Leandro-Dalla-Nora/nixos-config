{ inputs, nixpkgs, self, ...}:

# com este arquivo, é possível pegar todos os demais .nix e junta-los
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
in
{
  nixos = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs ; };
    modules =
      [ (import ./virtualisation.nix) ]
      ++ [ (import ./dns.nix) ]
      ++ [ (import ./utils.nix) ]
      ++ [ (import ./xserver.nix) ]
      ++ [ (import ./screen.nix) ]
      ++ [ (import ./terminal-utils.nix) ]
      ++ [ (import ./auto-upgrade.nix) ]
      ++ [ (import ./swap.nix) ]
      ++ [ (import ./list-arq-configs.py) ]
      ++ [ (import ./sound.nix) ]
      ++ [ (import ./mac-randomize.nix) ]
      ++ [ (import ./usb.nix) ]
      ++ [ (import ./gnome.nix) ]
      ++ [ (import ./hyprland.nix) ]
      ++ [ (import ./vpn.nix) ]
      ++ [ (import ./internationalisation.nix) ]
      ++ [ (import ./gc.nix) ]
      ++ [ (import ./security-services.nix) ]
      ++ [ (import ./services.nix) ]
      ++ [ (import ./printing.nix) ]
      ++ [ (import ./environment-variables.nix) ]
      ++ [ (import ./nix-settings.nix) ]
      ++ [ (import ./bootloader.nix) ]
      ++ [ (import ./hardware-configuration.nix) ]
      ++ [ (import ./networking.nix) ]
      ++ [ (import ./wayland.nix) ]
      ++ [ (import ./info-fetchers.nix) ]
      ++ [ (import ./fonts.nix) ]
      ++ [ (import ./open-ssh.nix) ]
      ++ [ (import ./bluetooth.nix) ]
      ++ [ (import ./configuration.nix) ]
      ++ [ (import ./programming.nix) ]
      ++ [ (import ./keyMap.nix) ]
      ++ [ (import ./users.nix) ]
      ++ [ (import ./nixpkgs.nix) ]
      ++ [ (import ./time.nix) ]
      ++ [ (import ./theme.nix) ]
    ;
  };
}