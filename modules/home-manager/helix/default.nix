{pkgs, ...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;

    languages = {
      language = [
        {
          name = "rust";
          auto-format = true;
          formatter = {command = "rustfmt";};
        }
        {
          name = "go";
          auto-format = true;
          formatter = {command = "goimports";};
          language-servers = ["gopls"];
        }
        {
          name = "python";
          auto-format = true;
          formatter = {
            command = "black";
            args = ["--quiet" "-"];
          };
        }
      ];
      language-server.gopls = {
        command = "gopls";
        config = {
          formatting.gofumpt = true;
          ui.diagnostic.staticcheck = true;
        };
      };
    };

    settings = {
      theme = "dracula";

      editor = {
        line-number = "absolute";

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        file-picker = {
          hidden = false;
          git-ignore = true;
          git-global = true;
        };

        lsp = {
          enable = true;
          display-messages = true;
          display-inlay-hints = true;
        };

        statusline = {
          left = ["mode" "spinner" "read-only-indicator" "file-modification-indicator"];

          center = ["file-name"];

          right = [
            "diagnostics"
            "selections"
            "position"
            "file-encoding"
            "file-line-ending"
            "file-type"
          ];

          separator = "│";

          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
      };

      keys.normal = {
        "C-left" = "jump_view_left";
        "C-right" = "jump_view_right";
        "C-up" = "jump_view_up";
        "C-down" = "jump_view_down";

        "C-r" = ":reload";
        "C-s" = ":w";
      };
      keys.insert = {
        "C-s" = [":w " "insert_mode"];
      };
    };

    extraPackages = with pkgs;
      [
        go
        gopls
        gotools
        gomodifytags
        impl
        delve
        golangci-lint

        (python3.withPackages (ps:
          with ps; [
            black
            # python-lsp-server
            pylsp-rope
            python-lsp-ruff
          ]))
        pyright
        ruff

        cmake
        cmake-language-server
        gnumake
        checkmake
        gcc
        llvmPackages.clang-unwrapped
        lldb

        rust-analyzer
        cargo
        rustfmt
        lldb_19

        nixd
        statix
        deadnix
        alejandra

        deno
        typescript-language-server

        ruby
        solargraph

        bash-language-server
        shellcheck
        shfmt

        emmet-ls
        jsonnet
        jsonnet-language-server

        taplo
        yaml-language-server
        sqls
        sqlfluff
        actionlint

        tree-sitter
        marksman
        glow
        fzf
      ]
      ++ (
        lib.optionals
        (!pkgs.stdenv.hostPlatform.isDarwin)
        [
          verible
          gdb
        ]
      );
  };
}
