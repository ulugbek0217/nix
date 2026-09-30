{ pkgs, ... }:
let
  extensions = [
    "env"
    "glsl"
    "html"
    "css"
    "ini"
    "just"
    "latex"
    "make"
    "material-icon-theme"
    "nginx"
    "nix"
    "sql"
    "toml"
    "xml"
    "go"
    "gotmpl"
    "dockerfile"
    "docker-compose"
    "alejandra"
    "one-dark-pro"
    "cargo-tom"
    "catppuccin"
  ];

  settings = {
    auto_update = false;
    disable_ai = true;
    telemetry = {
      metrics = false;
      diagnostics = false;
    };

    show_edit_predictions = false;

    node = {
      path = "${pkgs.nodejs}/bin/node";
      npm_path = "${pkgs.nodejs}/bin/npm";
    };

    languages = {
      Markdown = {
        format_on_save = "on";
        use_on_type_format = true;
        remove_trailing_whitespace_on_save = true;
      };

      JavaScript = {
        format_on_save = "on";
      };

      TypeScript = {
        format_on_save = "on";
      };

      Nix = {
        formatter = "language_server";
        language_servers = [
          "nixd"
          "!nil"
        ];
      };
    };

    lsp = {
      nixd = {
        binary = {
          ignore_system_version = false;
        };
        settings = {
          formatting = {
            command = [
              "alejandra"
            ];
          };
          diagnostic = {
            suppress = [
              "sema-extra-with"
              "sema-extra-rec"
            ];
          };
        };
      };

      clangd = {
        initialization_options = {
          fallbackFlags = [ "-style=Google" ];
        };
      };
    };

    theme = {
      mode = "system";
      light = "One Light";
      dark = "Catppuccin Mocha";
    };
    icon_theme = "Material Icon Theme";

    preferred_line_length = 100;

    autosave = "off";
    format_on_save = "on";
    enable_language_server = true;

    soft_wrap = "editor_width";

    buffer_font_size = 14;
    buffer_font_family = "JetBrainsMono Nerd Font";

    ui_font_size = 15;
    ui_font_family = ".SystemUIFont";

    confirm_quit = false;
    use_autoclose = true;

    inlay_hints = {
      enabled = true;
    };

    title_bar = {
      show_branch_status_icon = true;
    };

    collaboration_panel = {
      button = false;
    };

    agent = {
      enabled = false;
    };
  };
in
{
  config = {
    programs.zed-editor = {
      enable = true;
      inherit extensions;
      userSettings = settings;
      installRemoteServer = true;
      package = pkgs.unstable.zed-editor;
    };
  };
}
