{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Kompilyatorlar
    gcc # GNU Compiler Collection (Standart)
    gnumake # Make build tizimi
    cmake # Modern build tizimi

    # Debug va tahlil
    gdb # Debugger
    valgrind # Xotirani tahlil qilish uchun

    # LLVM asboblari (alternativa)
    clang # Clang kompilyatori
    clang-tools # clang-format va clang-tidy (kodni tartiblash uchun)

    # Kutubxonalar bilan ishlash
    pkg-config # Kutubxonalarni topish uchun
  ];
}
