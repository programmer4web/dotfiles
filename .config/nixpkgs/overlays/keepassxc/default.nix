self: super: {
  keepassx-community = with super; keepassx-community.overrideAttrs(old: rec {
    patches = old.patches ++ [./qt511.patch];
  });
}

