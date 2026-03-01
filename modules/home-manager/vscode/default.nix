{
  config,
  pkgs,
  ...
}: {
  # 2. VS Code Sozlamalari
  programs.vscode = {
    enable = true;

    # --- Extensionlar ro'yxati ---
    profiles.default.extensions = with pkgs.vscode-extensions;
      [
        # Tillar
        ms-python.python
        golang.go
        rust-lang.rust-analyzer
        ms-vscode.cpptools
        # xabikos.JavaScriptSnippets

        # DevOps va Formatlar
        ms-azuretools.vscode-docker
        # ahmadalli.vscode-nginx-conf
        jnoortheen.nix-ide
        tamasfe.even-better-toml
        ms-vscode.makefile-tools

        # Mavzular va Ikonkalar
        # zhuangtongfa.Material-Theme
        pkief.material-icon-theme
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        # Nixpkgs da yo'q maxsus extensionlar
        {
          name = "vscode-nginx-conf";
          publisher = "ahmadalli";
          version = "0.3.5";
          sha256 = "sha256-6gJtMQH2zanFt+UTaD0Vn1vDq5GY9R1CfelPCklYxYE="; # To'g'ri hashni nix-prefetch-url orqali olish mumkin
        }
        {
          name = "Material-Theme";
          publisher = "zhuangtongfa";
          version = "3.19.0";
          sha256 = "sha256-K0eXeAEn4s3YZHJJU9jxtytNQTgaGwvd3fBUsZiKfPw=";
        }
      ];

    # --- settings.json ---
    profiles.default.userSettings = {
      # Shrift sozlamalari
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'FiraCode Nerd Font', 'Fira Code', monospace";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 14;

      # Mavzu (Theme)
      "workbench.colorTheme" = "One Dark Pro"; # Material Theme o'rnatilganda keladi
      "workbench.iconTheme" = "material-icon-theme";

      # Avtomatik sozlamalar
      "editor.formatOnSave" = true;
      "editor.bracketPairColorization.enabled" = true;
      "editor.guides.bracketPairs" = "active";

      # Go sozlamalari
      "go.useLanguageServer" = true;
      "go.lintTool" = "golangci-lint";

      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd"; # Siz nixd ishlatayotganingiz uchun nixd deb ko'rsatamiz

      # 2. Server sozlamalari
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = ["nixfmt"]; # Yoki "alejandra" (tizimda o'rnatilgan bo'lishi shart)
          };
          "options" = {
            # NixOS options (Flake ishlatayotgan bo'lsangiz)
            "nixos" = {
              # Eslatma: "/etc/nixos" yo'lini o'zingizning config papkangizga moslang
              "expr" = "(builtins.getFlake \"/home/ulugbek/.config/nix\").nixosConfigurations.asus.options";
            };
            # Home-manager options
            "home-manager" = {
              "expr" = "(builtins.getFlake \"/home/ulugbek/.config/nix\").homeConfigurations.\"ulugbek@asus\".options";
            };
          };
        };
        "nil" = {
          "formatting" = {
            "command" = ["nixfmt"];
          };
        };
      };
    };
  };
}
