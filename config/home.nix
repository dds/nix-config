{ pkgs, ...}:

with import <nixpkgs> {};

rec {
  home = {
    packages = [
      pkgs.gnupg
      pkgs.emacs
      pkgs.isync
    ];
  };
  programs.home-manager.enable = true;
  programs.home-manager.path = https://github.com/rycee/home-manager/archive/master.tar.gz;
}
