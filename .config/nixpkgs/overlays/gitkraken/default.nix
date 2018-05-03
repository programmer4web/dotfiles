self: super:
{
  gitkraken_latest = with super; gitkraken.overrideAttrs(old: rec {
    version = "3.5.1";
    src = fetchurl {
      url = "https://release.gitkraken.com/linux/v${version}.deb";
      sha256 = "0lmv7fd6iz1nfy176q8fxrq5mivvz96dxvgr2famw57l6wp8jmz9";
    };
  });
}

