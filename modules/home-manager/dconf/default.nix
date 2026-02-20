{...}: {
  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      panel-run-dialog = [""]; # Освобождаем Alt+F2 для медиа-клавиши
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      volume-step = 2;
      # Пауза / Воспроизведение
      play = ["<Alt>F2"];

      # Предыдущий трек (из предыдущего шага)
      previous = ["<Alt>F1"];

      # Следующий трек (из предыдущего шага)
      next = ["<Alt>F3"];
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "CopyQ Show";
      command = "copyq toggle";
      binding = "<Alt>v";
    };

    "org/gnome/shell" = {
      enabled-extensions = [
        "Vitals@CoreCoding.com"
      ];
    };

    # Опционально: Настройки самого Vitals (например, частота обновления)
    "org/gnome/shell/extensions/vitals" = {
      hot-sensors = [
        "_processor_usage_"
        "_memory_usage_"
        "_temperature_cpu_"
        "_gpu_usage_"
        "_fan_rpm_"
      ];
      update-time = 1;
      show-icons = true;
    };
  };
}
