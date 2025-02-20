{ config, lib, pkgs, ... }:

{
  nixpkgs.overlays = [
    # Waybar needs to be compiled with the experimental flag for wlr/workspaces to work
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        patchPhase = ''
          substituteInPlace src/modules/wlr/workspace_manager.cpp --replace "zext_workspace_handle_v1_activate(workspace_handle_);" "const std::string command = \"hyprctl dispatch workspace \" + name_; system(command.c_str());"
        '';
      });
    })
  ];

  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "sway-session.target"; # Needed for waybar to start automatically
    };

    style = ''
      * {
        border-radius: 0;
        font-family: 'Operator Mono Lig Book';
        font-size: 13pt;
        min-height: 0;
      }

      window#waybar {
        background: transparent;
        color: #DADAE8;
      }

      tooltip {
        background: #1E1E28;
        border-radius: 15px;
        border-width: 2px;
        border-style: solid;
        border-color: #a4b9ef;
      }

      #workspaces {
        background: transparent;
        font-size: 14px;
        margin-left: 20px;
        margin-top: 15px;
        margin-bottom: 5px;
        border-radius: 15px;
      }

      #workspaces button {
        padding-left: 10px;
        padding-right: 10px;
        min-width: 0;
        color: #DADAE8;
      }

      #workspaces button.focused {
        color: #A4B9EF;
      }

      #workspaces button.urgent {
        color: #F9C096;
      }

      #workspaces button:hover {
        background: #332e41;
        border-color: #332e41;
        color: #A4B9EF;
      }

      #clock, #battery, #pulseaudio, #workspaces, #mpd  {
        padding: 2px 10px;
        background: #332E41;
        margin-top: 15px;
      }

      #network {
        margin-top: 15px;
        padding-left: 15px;
        padding-right: 2px;
        background: #332E41;
        border-radius: 15px 0px 0px 15px;
      }

      #clock {
        padding-right: 15px;
        margin-right: 20px;
        border-radius: 0px 15px 15px 0px;
      }

      #custom-spotify {
        background: #332E41;
        margin-top: 15px;
        padding-top: 5px;
        padding-bottom: 5px;
        padding-right: 15px;
        padding-left: 15px;
        border-radius: 15px;
      }
    '';
    settings = {
      Main = {
        layer = "top";
        position = "top";
        min-height = 0;
        # output = [
        #   "${mainMonitor}"
        # ];
        tray = { spacing = 5; };

        modules-center = [ "custom/spotify" ];
        modules-left = [ "wlr/workspaces" ];
        modules-right = [ "network" "pulseaudio" "clock" ];

        "sway/workspaces" = {
          format = "<span font='12'>{icon}</span>";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
          };
          all-outputs = true;
          persistent_workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
          };
        };
        "wlr/workspaces" = {
          format = "{icon}";
          persistent_workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
            "6" = [ ];
            "7" = [ ];
            "8" = [ ];
            "9" = [ ];
            "10" = [ ];
          };
          format-icons =
            {
              "default" = "";
              "urgent" = "";
              "focused" = "";
            };
          all-outputs = true;
          active-only = false;
          on-click = "activate";
        };
        clock = {
          format = "<span foreground='#C6AAE8'> </span>{:%H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          #format-alt = "{:%A, %B %d, %Y} ";
        };
        cpu = {
          format = " {usage}% <span font='11'></span> ";
          interval = 1;
        };
        disk = {
          format = "{percentage_used}% <span font='11'></span>";
          path = "/";
          interval = 30;
        };
        memory = {
          format = "{}% <span font='11'></span>";
          interval = 1;
        };
        # battery = {
        #   interval = 60;
        #   states = {
        #     warning = 30;
        #     critical = 15;
        #   };
        #   format = "{capacity}% <span font='11'>{icon}</span>";
        #   format-charging = "{capacity}% <span font='11'></span>";
        #   format-icons = [ "" "" "" "" "" ];
        #   max-length = 25;
        # };
        network = {
          format-wifi = "<span font='11'></span>";
          format-ethernet = "<span font='11'></span>";
          #format-ethernet = "<span font='11'></span> {ifname}: {ipaddr}/{cidr}";
          format-linked = "<span font='11'>睊</span> {ifname} (No IP)";
          format-disconnected = "<span font='11'>睊</span> Not connected";
          #format-alt = "{ifname}: {ipaddr}/{cidr}";
          tooltip-format = "{essid} {ipaddr}/{cidr}";
          #on-click-right = "${pkgs.alacritty}/bin/alacritty -e nmtui";
        };
        "custom/spotify" = {
          format = "<span foreground='#E5B4E2'> </span><span font='Operator Mono Lig weight=325 Italic'>{}</span>";
          interval = 1;
          exec-if = "pgrep spotify";
          on-click = "playerctl -p spotify play-pause";
          on-scroll-up = "playerctl -p spotify previous";
          on-scroll-down = "playerctl -p spotify next";
          tooltip = false;
          escape = true;
          max-length = 60;
          exec = "~/.config/waybar/scripts/spotify.sh";
        };
        pulseaudio = {
          format = "<span font='11'>{icon}</span> {volume}% {format_source} ";
          format-bluetooth = "<span font='11'>{icon}</span> {volume}% {format_source} ";
          format-bluetooth-muted = "<span font='11'>x</span> {volume}% {format_source} ";
          format-muted = "<span font='11'>x</span> {format_source} ";
          #format-source = "{volume}% <span font='11'></span>";
          format-source = "<span font='10'></span> ";
          format-source-muted = "<span font='11'> </span> ";
          format-icons = {
            default = [ "" "" "" ];
            headphone = "";
            #hands-free = "";
            #headset = "";
            #phone = "";
            #portable = "";
            #car = "";
          };
          tooltip-format = "{desc}, {volume}%";
          on-click = "${pkgs.pamixer}/bin/pamixer -t";
          on-click-right = "${pkgs.pamixer}/bin/pamixer --default-source -t";
          on-click-middle = "${pkgs.pavucontrol}/bin/pavucontrol";
        };
        tray = {
          icon-size = 13;
        };
      };
    };
  };
  home.file = {
    ".config/waybar/scripts/spotify.sh" = {
      # Custom script: Toggle speaker/headset
      text = ''
        #!/run/current-system/sw/bin/bash
        #album=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|egrep -A 2 "album"|egrep -v "album"|egrep -v "array"|cut -b 44-|cut -d '"' -f 1|egrep -v ^$`
        artist=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|egrep -A 2 "artist"|egrep -v "artist"|egrep -v "array"|cut -b 27-|cut -d '"' -f 1|egrep -v ^$`
        title=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|egrep -A 1 "title"|egrep -v "title"|cut -b 44-|cut -d '"' -f 1|egrep -v ^$`

        echo $artist " - " $title;
      '';
      executable = true;
    };
  };
}
