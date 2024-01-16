{
  description = "Leandro's NixOS configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... } @ inputs: {
      nixosConfigurations.leandro = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { 
          inherit inputs; 
        };
        modules = [
          ./modules/nixos/nixpkgs.nix
          ./modules/nixos/utils.nix
          ./modules/nixos/auto-upgrade.nix
          ./modules/nixos/configuration.nix
          ./modules/nixos/terminal-utils.nix
          ./modules/nixos/networking.nix
          ./modules/nixos/keyMap.nix
          ./modules/nixos/bootloader.nix
          ./modules/nixos/wayland.nix
          ./modules/nixos/sound.nix
          ./modules/nixos/programming.nix
          ./modules/nixos/xserver.nix
          ./modules/nixos/virtualisation.nix
          ./modules/nixos/users.nix
          ./modules/nixos/bluetooth.nix
          ./modules/nixos/info-fetchers.nix
          ./modules/nixos/security-services.nix
          ./modules/nixos/environment-variables.nix
          ./modules/nixos/mac-randomize.nix
          ./modules/nixos/printing.nix
          ./modules/nixos/theme.nix
          ./modules/nixos/dns.nix
          ./modules/nixos/nix-settings.nix
          ./modules/nixos/screen.nix
          ./modules/nixos/gnome.nix
          ./modules/nixos/fonts.nix
          ./modules/nixos/usb.nix
          ./modules/nixos/vpn.nix
          ./modules/nixos/gc.nix
          ./modules/nixos/time.nix
          ./modules/nixos/internationalisation.nix
          ./modules/nixos/swap.nix
          ./modules/nixos/services.nix
          ./modules/nixos/open-ssh.nix
          ./modules/nixos/hardware-configuration.nix
        ];
      };
  };
}
