{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vagrant
    ansible_2_4_3
    redir
    bridge-utils
  ];
}

