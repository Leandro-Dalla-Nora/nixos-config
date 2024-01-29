{ pkgs, ... }:
{
    gtk = {
        enable = true;

        theme = {
            name = "Catppuccin-Mocha-Standard-Blue-Dark";
            package = pkgs.catppuccin-gtk.override { 
                variant = "mocha"; 
                accents = [ "blue" ];
            };
        };
        
        font = {
            name = "RobotoMono Nerd Font";
            size = "12";
        };

        iconTheme = {
            name = "Papirus-Dark";
            package = pkgs.catppuccin-papirus-folders;
        };

        cursorTheme = {
            name = "Numix-Cursor";
            package = pkgs.numix-cursor-theme;
        };
        
        gtk3.extraConfig = {
            Settings = ''
                gtk-application-prefer-dark-theme=1
                '';
        };

        gtk4.extraConfig = {
            Settings = ''
                gtk-application-prefer-dark-theme=1
                '';
        };
    };
}
