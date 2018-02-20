{ config, lib, pkgs, ... }:
{
  nixpkgs.overlays = [( self: super: {
    skypeforlinux = super.skypeforlinux.overrideAttrs(oldAttrs: rec {
      version= "8.16.76.8";
      src = super.fetchurl {
        url = "https://repo.skype.com/deb/pool/main/s/skypeforlinux/skypeforlinux_${version}_amd64.deb";
        sha256 = "19hzx7wwlwfmknh3awbiid7l2gk1psi09ngi93wrcyvcqkl35vpc";
      };
    });
  })];
}

