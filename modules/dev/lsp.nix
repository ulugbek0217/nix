{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # C++
    gcc
    gnumake
    cmake
    gdb
    valgrind
    clang
    clang-tools

    pkg-config
    openssl.dev

    # NIX
    nixd
    alejandra
    nix-tree
    nixfmt-tree
    statix
    deadnix
    nixfmt

    # NODE JS
    nodejs
    corepack

    # PYTON
    (python3.withPackages (ps:
      with ps; [
        pip
        virtualenv
        black
        ruff
      ]))

    # RUST
    unstable.rustc
    unstable.cargo
    unstable.rust-analyzer
    unstable.clippy
    unstable.bacon
    unstable.rustfmt

    # GO
    go
    gopls
    delve
    golangci-lint
  ];

  environment.sessionVariables = {
    GOPATH = "$HOME/go";
    GOBIN = "$HOME/go/bin";
  };
}
