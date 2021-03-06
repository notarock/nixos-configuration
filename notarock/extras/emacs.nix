{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    python-language-server
    yaml-language-server
  ];

  services.emacs = {
    enable = true;
  };

  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ../doom.d;
  };
}
