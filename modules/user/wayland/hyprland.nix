{ 
custom ? {
  fontsize = "12";
  primary_accent = "cba6f7";
  secondary_accent = "89b4fa";
  tertiary_accent = "f5f5f5";
  background = "11111B";
  opacity = ".85";
  cursor = "Numix-Cursor";
},
inputs,
pkgs,
... 
}:

{
  # Extra packages my hyprland config uses
  home.packages = with pkgs; [
    slurp
    swaybg
    swayidle
    swaylock-effects
    swaynotificationcenter
  ];
  
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    settings = {
      "$mainMod" = "SUPER";
      monitor = [
        ",preferred,auto,auto"
        # "eDP-1,1920x1080@60,0x0,1"
      ];
      exec-once = [
        "waybar"
        "swaybg -i ~/photos/wallpapers/wallpaper.png"
        ''swayidle -w timeout 1800 'swaylock -f -i ~/photos/wallpapers/wallpaper.png' timeout 1805 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' before-sleep "swaylock -f -i ~/photos/wallpapers/wallpaper.png"''
        "hyprctl setcursor ${custom.cursor} ${custom.fontsize}"
        "swaync"
      ];
      input = {
	      kb_layout = "br";
        follow_mouse = true;
        force_no_accel = 1;
        touchpad = {
          natural_scroll = 1;
        };
      };

      general = {
        gaps_in = 4;
        gaps_out = 4;
        border_size = 2;
        "col.active_border" = "rgb(${custom.primary_accent})";
        "col.inactive_border" = "rgba(${custom.background}00)";
        allow_tearing = true;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        shadow_ignore_window = true;
        drop_shadow = true;
        shadow_range = 50;
        shadow_render_power = 3;
        # "col.shadow" = "rgb(${custom.primary_accent})";
        "col.shadow" = "rgba(${custom.primary_accent}00)";
        "col.shadow_inactive" = "rgba(${custom.background}00)";
        blur = {
          enabled = true;
          size = 6;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
          noise = 0.0117;
          contrast = 1.2;
          xray = false;
          brightness = 1;
        };
      };
      animations = {
        enabled = true;
        bezier = [ "easeinoutsine, 0.37, 0, 0.63, 1" ];
        animation = [ 
          "windows,1,2,easeinoutsine,slide" 
          "border,1,10,default"
          "fade,1,1,default"
          "workspaces,1,2,easeinoutsine,slide"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
        force_split = 2;
      };
      master = {
        new_is_master = true;
      };
      gestures = {
        workspace_swipe = false;
      };
      misc = {
        vrr = 1;
        disable_hyprland_logo  = true;
        disable_splash_rendering = true;
      };
      bind = [
        # Exit to tty
        "$mainMod SHIFT, X, exit "
        # Launch
        "$mainMod, D, exec, wofi"
        "$mainMod SHIFT,N,exec, swaync-client -t -sw"
        "$mainMod SHIFT,M,exec, swaylock -f -i ~/photos/wallpapers/wallpaper.png"
        # Window Options
        "$mainMod, V, pseudo"
        "$mainMod, W, togglesplit"
        "$mainMod, F, fullscreen"
        "$mainMod, E, togglefloating "
        "$mainMod SHIFT, Q, killactive"
        # apps bind
        "$mainMod, K, exec, kitty"
        # Focus Windows
	      "$mainMod, TAB, movefocus, l"
        "$mainMod SHIFT, TAB, movefocus, r"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"
        # Move Windows
        "$mainMod SHIFT, left,  movewindow,l"
        "$mainMod SHIFT, right, movewindow,r"
        "$mainMod SHIFT, up,    movewindow,u"
        "$mainMod SHIFT, down,  movewindow,d"
        # Switch workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        # Switch active window to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        # Scroll workspace with mouse scrollwheel
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        # OBS
        "CTRL SHIFT, S, pass,^(com\.obsproject\.Studio)$"
      ];
      bindm = [
        # Move and resize windows with mouse too
        "$mainMod, mouse:272, movewindow"
        "$mainMod SHIFT, mouse:272, resizewindow"
      ];
      bindle = [
        # Backlight Keys
        ",XF86MonBrightnessUp,exec,light -A 5"
        ",XF86MonBrightnessDown,exec,light -U 5"
        # Volume Keys
        ",XF86AudioRaiseVolume,exec,pamixer -i 5"
        ",XF86AudioLowerVolume,exec,pamixer -d 5"
        # Mute/unmute system
        ", XF86AudioMute, exec, pamixer -t"
        # Media control
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
        # screenshot
        ", Print, exec, grim -g \"$(slurp)\" - | swappy -f -"
        # wlogout
        ", XF86PowerOff, exec, wlogout"
      ];
      bindl = [       
        ",switch:on:Lid Switch, exec, swaylock -f -i ~/photos/wallpapers/wallpaper.png"
        ",switch:off:Lid Switch, exec, swaylock -f -i ~/photos/wallpapers/wallpaper.png"
      ];
      windowrulev2 = [
        # "opacity ${custom.opacity} ${custom.opacity},class:^(thunar)$"
        # "opacity ${custom.opacity} ${custom.opacity},class:^(WebCord)$"
        # "opacity ${custom.opacity} ${custom.opacity},class:^(WebCord)$"
        # "opacity 0.90 0.90,class:^(Brave-browser)$"
        # "opacity 0.90 0.90,class:^(brave-browser)$"
        # "opacity 0.90 0.90,class:^(firefox)$"
        "float,class:^(pavucontrol)$"
        "float,class:^(file_progress)$"
        "float,class:^(confirm)$"
        "float,class:^(dialog)$"
        "float,class:^(download)$"
        "float,class:^(notification)$"
        "float,class:^(error)$"
        "float,class:^(confirmreset)$"
        "float,title:^(Open File)$"
        "float,title:^(branchdialog)$"
        "float,title:^(Confirm to replace files)$"
        "float,title:^(File Operation Progress)$"
        "float,title:^(mpv)$"
        # Ensure tearing for specific games
        "immediate, class:^(cs2)$" #counterstrike
        "immediate, title:^(DayZ)$" #DayZ
        "immediate, title:^(SonsOfTheForest)$" #DayZ
        "immediate, title:^(Arma 3)$" #DayZ
        "immediate, class:^(love)$" #vrrtest
        "immediate, class:^(steam_app_1659040)$" #Hitman 3
        "immediate, class:^(steam_app_1144200)$" #Ready or Not
      ];
      layerrule = [
        "blur, waybar"
        "blur, wofi"
        "ignorezero, wofi"
      ];
    };
    # Submaps
    extraConfig = ''
      # will switch to a submap called resize
      bind=$mainMod,R,submap,resize

      # will start a submap called "resize"
      submap=resize

      # sets repeatable binds for resizing the active window      
      binde = SUPER+CTRL, left , resizeactive, -15 0
      binde = SUPER+CTRL, down , resizeactive, 0 15
      binde = SUPER+CTRL, up   , resizeactive, 0 -15
      binde = SUPER+CTRL, right, resizeactive, 15 0

      # use reset to go back to the global submap
      bind=,escape,submap,reset 
      bind=$mainMod,R,submap,reset

      # will reset the submap, meaning end the current one and return to the global one
      submap=reset

      # For tearing
      env = WLR_DRM_NO_ATOMIC,1
    '';
  };
}
