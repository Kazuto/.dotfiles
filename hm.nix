{ config, pkgs, home-manager, ... }:

{

  home.stateVersion = "23.05";

  home.file = {
    ".p10k.zsh" = {
      source = ../zsh/.p10k.zsh;
      executable = true;
    };

    ".aliases" = {
      source = ../zsh/.aliases;
      executable = false;
    };

    "/.config/dunst/" = {
      source = ../dunst/dunstrc;
      executable = false;
    };

    "/.config/hypr/" = {
      source = ../hypr/;
      executable = false;
    };

    "/.config/kitty/" = {
      source = ../kitty/;
      executable = false;
    };

    "/.config/nvim/" = {
      source = ../nvim/;
      executable = false;
    };

    "/.config/rofi/" = {
      source = ../rofi/;
      executable = false;
    };

    "/.config/waybar/" = {
      source = ../waybar/;
      executable = false;
    };

    "/.config/wlogout/" = {
      source = ../wlogout/;
      executable = false;
    };
  };


  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "Kai Mayer";
    userEmail = "mail@kazuto.de";
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    dotDir = ".config/zsh";

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    initExtra = ''
      [[ ! -f ~/.aliases ]] || source ~/.aliases
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';

    zplug = {
      enable = true;
      plugins = [
        { name = "romkatv/powerlevel10k"; tags = [ "as:theme" "depth:1" ]; }
      ];
    };
  };
}
