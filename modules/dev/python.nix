{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (python3.withPackages (ps:
      with ps; [
        pip
        virtualenv
        black # Formatter
        ruff # Linter
      ]))
  ];
}
