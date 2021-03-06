{ config, lib, pkgs, ... }:

let
  my-theme = import ../themes/base16-onedark.nix;
in {
  users.users.notarock = {
    isNormalUser = true;
    home = "/home/notarock";
    description = "Notarock";
    extraGroups = [ "wheel" "docker" "video" ];
    shell = pkgs.zsh;
    initialPassword = "Ch4ngeMoi%%%";
  };

  home-manager = {
    users.notarock = { pkgs, ... }: {
      imports = [
        ./extras/herbstluftwm.nix
        ./extras/polybar.nix
        ./extras/udiskie.nix
        ./extras/dunst.nix
        ./extras/vim.nix
        ./extras/emacs.nix
        ./extras/zsh.nix
        ./extras/fzf.nix
        ./extras/kitty.nix
      ];

      gtk = {
        enable = true;
        iconTheme.package = pkgs.numix-icon-theme-square;
        iconTheme.name = "Numix-Square";
        theme.package = pkgs.amber-theme;
        theme.name = "Amber";
      };

      home.keyboard.layout = "ca,fr";

      programs = {
        rofi = {
          enable = true;
          separator = "solid";
          font = "Essential PragmataPro 14";
          theme = "/etc/nixos/extras/rofi/conf";
          extraConfig = {
            dpi = 0;
          };
        };

        git = {
          delta.enable = true;
          enable = true;
          userName = "Roch D'Amour";
          userEmail = "roch.damour@gmail.com";
          extraConfig = { pull.rebase = false; };
        };
      };

      services = {
        nextcloud-client.enable = true;
        picom.enable = true;
      };

      xresources.properties = {
        "xft.dpi" = "144";
        "XTerm*faceName" = "dejavu sans mono";
        "Xcursor.size" = "32";
        "Xcursor.theme" = "Bibata Oil";
      };

    };
  };

}
