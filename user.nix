{ config, pkgs, home-manager, ... }:

{
  isNormalUser = true;
  description = "Kazuto";
  extraGroups = [ "networkmanager" "wheel" ];
}
