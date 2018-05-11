self: super: {
  plumNative = pkg: pkg.overrideAttrs(attrs: {
    NIX_CFLAGS_LINK = toString (attrs.NIX_CFLAGS_LINK or "") + " -O2 -pipe -march=native";
  });
}
