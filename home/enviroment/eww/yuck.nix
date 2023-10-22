{ config, lib, pkgs, uservars, ... }:
{
  home.file.".config/eww/eww.yuck" = {
    text = ''
(defvar deftimeout "999999999ms")
(defpoll datetime :interval "1s" "date '+%a, %d. %b  %H:%M'")
(defvar soundvol "xx")
(defvar wss "xxx")
(defvar show_powerbuttons false)
(defvar show_calendar false)

(defwindow bar
  :monitor 0
  :stacking "fg"
  :exclusive true
  :geometry (geometry 
    :y "0.5%"
    :width "99.5%"
    :height "30"
    :anchor "top center")
  (bar-widget)
    
)
(defwidget bar-widget []
  (box 
    :orientation "h"
    :class "bar"
    (left)
    (center)
    (right)
  )
)
(defwidget left []
  (box 
    :orientation "h" 
		:space-evenly false  
    :halign "start"
    :spacing 6
    (launcher)
    (usageinfo)
    (workspaces)
  )
)
(defwidget center []
  (box 
    :orientation "h"
    :space-evenly false
    :halign "center"
    (clock)
  )
)
(defwidget right []
  (box 
    :orientation "h" 
		:space-evenly false
    :spacing 6
    :halign "end"
    (box 
      :orientation "h"
      :class "tray"
      (systray
        :pack-direction "left"
      )
    )
    (sound)
    (microphone)
    (battery)
    (power)
  )
)

(defwidget power []
  (box
    (button 
      :class "minipower"
      :orientation "h"
      :onclick "''${EWW_CMD} update show_powerbuttons=true"
      (box 
        "󰐥"
      )
    )
  )
)

(defwidget battery []
  (box 
    (button
      :orientation "h"
      :class "battery"
      :onclick ""
      (box
        "''${EWW_BATTERY.BAT0.capacity}%"
      )
    )
  )
)

(defwidget microphone []
  (box
    (button 
      :orientation "h"
      :class "mic"
      :onclick "bash ~/.scripts/microphone.sh"
      (box 
        "󰍬"
      )
    )
  )
)

(defwidget sound []
    (box
      :orientation "h"
      (button 
        :class "sound"
        :timeout "''${deftimeout}"
        :onclick "pavucontrol"
        (box 
          (box 
            :class "soundsymb"
            "󰕾"
          )
          (box 
            :class "soundvol"
            "''${soundvol}"
          )
        )
      )
    )
)

(defwidget clock []
  (box (button 
    :class "miniclock" 
    :orientation "h" 
    :onclick "''${EWW_CMD} update show_calendar=true"
    (box 
      :orientation "h"
      :space-evenly false
      :spacing 10
      :halign "start"
      :orientation "h"
      datetime
    )
  ))
)

(defwidget workspaces []
  (box 
    :orientation "horizontal"
    :hexpand false
    :vexpand false
    :class "workspaces"
    wss
  )
)  

(defwidget usageinfo []
  (box
    (button 
      :class "usageinfo"
      :orientation "h"
      :timeout "''${ deftimeout}"
      :onclick "kitty btop"
      (box 
        :orientation "h"
        :space-evenly false
        :spacing 10
        :halign "start"
        :orientation "h"
        (box 
          :class "ram"
          "''${round(EWW_RAM.used_mem/1073741824,1)}/''${round(EWW_RAM.total_mem/1073741824,1)} Gb "
        )
        (box :class "spacerh" "|")
        (box 
          :class "cputemp"
          " ''${EWW_TEMPS.CORETEMP_CORE_0}°C "
        )
        (box :class "spacerh" "|")
        (box 
          :class "disk"
          " ''${round(EWW_DISK['/'].free/1073741824,1)} Gb "
        )
        (box :class "spacerh" "|")
        (box 
          :class "boot"
          " ''${round(EWW_DISK['/boot'].free/1073741824,1)} Gb"
        )
      )
    )
  )
)

(defwidget launcher []
  (box
    :orientation "h"
    (button 
      :class "launcher"
      :timeout "''${deftimeout}"
      :onclick "rofi -show"
      (box
        " "
      )
    )
  )
)

(defwindow calendar-poppup-window
  :monitor 0
  :stacking "overlay"
  :exclusive false
  :geometry (geometry 
    ;:x "0.25%"
    :y "-50"
    :anchor "center top")
  (calendarpop)
)

(defwidget calendarpop []
  (eventbox 
    :onhover ""
    :onhoverlost "''${EWW_CMD} update show_calendar=false"
    (revealer
      :transition "slideup"
      :reveal show_calendar
      :duration "1500ms"
      (box 
        :class "calelndarpop"
        :orientation "v"
        ;;:space-evenly false
        (calendar 
          :class "calelndarpop"
          :day {formattime(EWW_TIME, "%d")}
          :month {formattime(EWW_TIME, "%m")}
          :year {formattime(EWW_TIME, "%Y")}
        )
      )
    )
  )
)

(defwindow popup-power-window
  :monitor 0
  :stacking "overlay"
  :exclusive false
  :geometry (geometry 
    :x "0.25%"
    :y "0"
    :anchor "top right")
  (powerbuttons)
)

(defwidget powerbuttons []
  (eventbox 
    :onhover ""
    :onhoverlost "''${EWW_CMD} update show_powerbuttons=false"
    (revealer
      :transition "slideup"
      :reveal show_powerbuttons
      :duration "500ms"
      (box
        :class "powerpopup"
        :halign "start" 
        :spacing 3
        :orientation "vertical"
        (button
          :class "suspend" 
          :onclick "systemctl suspend"
          ""
        )
        (button 
          :class "reboot"
          :onclick "reboot"
          ""
        )
        (button 
          :class "shutdown"
          :onclick "shutdown -h now"
          "󰐥"
        )
      )
    )
  )
)

    '';
  };
}