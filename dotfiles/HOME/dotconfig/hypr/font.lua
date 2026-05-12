-- GTK font preferences via gsettings
hl.on("hyprland.start", function()
    hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name           'NotoSans Nerd Font 10'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface document-font-name  'NotoSans Nerd Font 10'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface monospace-font-name 'CaskaydiaCove Nerd Font Mono 10'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface font-antialiasing   'rgba'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface font-hinting        'full'")
end)
