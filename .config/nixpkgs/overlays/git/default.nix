self: super: {
  git-keyring = super.git.overrideAttrs(old: rec {
    postBuild = ''
      pushd $PWD/contrib/credential/gnome-keyring/
      make
      popd
    '';

    preInstall = ''
      mkdir -p $out/bin
      mv $PWD/contrib/credential/gnome-keyring/git-credential-gnome-keyring $out/bin
    '';
    buildInputs = old.buildInputs ++ [self.glib self.gnome3.libgnome_keyring];
    nativeBuildInputs = [ self.pkgconfig ];
  });
}
