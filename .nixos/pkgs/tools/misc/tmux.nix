
{ config, lib, pkgs, ... }:
{
  nixpkgs.overlays = [( self: super: {
    tmux = super.tmux.overrideAttrs(oldAttrs: rec {
      src = super.fetchFromGitHub {
        owner = "tmux";
        repo = "tmux";
        rev = "5a44e18490ed9c8b556933ddbc2a68afba9827fc";
        sha256 = "1am6zb0vs29jdyncm2zvpynqyabzcrw0078s1wm7dpf7gzwfc88d";
      };
    });
  })];
}

