{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    profiles.default.extensions = with pkgs.vscode-extensions;
      [
        ms-python.python
        golang.go
        rust-lang.rust-analyzer
        ms-vscode.cpptools

        ms-azuretools.vscode-docker
        jnoortheen.nix-ide
        tamasfe.even-better-toml
        ms-vscode.makefile-tools

        pkief.material-icon-theme
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscode-nginx-conf";
          publisher = "ahmadalli";
          version = "0.3.5";
          sha256 = "sha256-6gJtMQH2zanFt+UTaD0Vn1vDq5GY9R1CfelPCklYxYE=";
        }
        {
          name = "Material-Theme";
          publisher = "zhuangtongfa";
          version = "3.19.0";
          sha256 = "sha256-K0eXeAEn4s3YZHJJU9jxtytNQTgaGwvd3fBUsZiKfPw=";
        }
      ];

    profiles.default.userSettings = {
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'FiraCode Nerd Font', 'Fira Code', monospace";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 16;

      "workbench.colorTheme" = "One Dark Pro";
      "workbench.iconTheme" = "material-icon-theme";

      "editor.formatOnSave" = true;
      "editor.bracketPairColorization.enabled" = true;
      "editor.guides.bracketPairs" = "active";

      "rust-analyzer.server.path" = "rust-analyzer";

      "go.useLanguageServer" = true;
      "go.lintTool" = "golangci-lint";
      "go.diagnostic.vulncheck" = "Imports";

      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";

      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = ["nixfmt"];
          };
          "options" = {
            "nixos" = {
              "expr" = "(builtins.getFlake \"/home/ulugbek/.config/nix\").nixosConfigurations.asus.options";
            };
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
