self: super:
let
  unstable = import <nixos-unstable> {
    config.allowUnfree = true;
  };
in {
  gitkraken_latest = unstable.gitkraken.overrideAttrs(old: rec {
    version = "3.5.1";
    src = self.fetchurl {
      url = "https://release.gitkraken.com/linux/v${version}.deb";
      sha256 = "0lmv7fd6iz1nfy176q8fxrq5mivvz96dxvgr2famw57l6wp8jmz9";
    };
  });
}

