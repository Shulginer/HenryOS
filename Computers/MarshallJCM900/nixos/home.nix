{ config, pkgs, ... }:

{
  home.username = "henrycrusher";
  home.homeDirectory = "/home/henrycrusher";

  home.stateVersion = "26.05";

  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };
}
