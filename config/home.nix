{ pkgs, ...}:

with import <nixpkgs> {};

rec {
  home = {
    packages = with pkgs; [];
  };

  programs = {
    home-manager = {
      enable = true;
    };
  };

}
