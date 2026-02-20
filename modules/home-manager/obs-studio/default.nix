{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs # Захват экрана для wlroots (Sway/Hyprland)
      obs-pipewire-audio-capture # Захват звука через PipeWire
      obs-vkcapture # Прямой захват Vulkan игр (как в Steam Deck)
      obs-vaapi # Аппаратное ускорение (для Intel/AMD)
      obs-gstreamer # Дополнительные кодеки
    ];
  };
}
