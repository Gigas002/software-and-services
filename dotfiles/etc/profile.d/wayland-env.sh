# Prefer using /etc/environment instead

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  # GTK wayland backend: https://wiki.archlinux.org/title/Wayland#GTK
  # defaults to wayland
  # export GDK_BACKEND=wayland

  # Qt HidhDPI settings: https://doc.qt.io/qt-6/highdpi.html
  # export QT_AUTO_SCREEN_SCALE_FACTOR=1
  # export QT_SCALE_FACTOR=1

  # Qt wayland backend: https://wiki.archlinux.org/title/Wayland#Qt
  # defaults to wayland if installed
  # export QT_QPA_PLATFORM="wayland;xcb"

  # KDE File Picker by default: https://bbs.archlinux.org/viewtopic.php?id=253132
  export GTK_USE_PORTAL=1

  # Firefox wayland backend: https://wiki.archlinux.org/title/Firefox#Wayland
  # defaults to wayland since 121
  # export MOZ_ENABLE_WAYLAND=1

  # Nvidia-specific settings: https://wiki.archlinux.org/title/Wayland#Requirements
  # export GBM_BACKEND=nvidia-drm
  # export __GLX_VENDOR_LIBRARY_NAME=nvidia

  # Force session to run on Nvidia GPU on laptops with
  # prime render offload, see: https://wiki.archlinux.org/title/PRIME#Configure_applications_to_render_using_GPU
  # export __NV_PRIME_RENDER_OFFLOAD=1
  # Additional prime settings: https://wiki.archlinux.org/title/PRIME#Wayland-specific_configuration
  # export __VK_LAYER_NV_optimus=NVIDIA_only
  
  # SDL2 wayland backend: https://wiki.archlinux.org/title/Wayland#SDL2
  export SDL_VIDEODRIVER="wayland,x11"

  # Electron 28+ wayland backend: https://wiki.archlinux.org/title/Wayland#Electron
  export ELECTRON_OZONE_PLATFORM_HINT="wayland"
fi
