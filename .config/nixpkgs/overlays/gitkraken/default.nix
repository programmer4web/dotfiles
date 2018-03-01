self: super: {
  
  gitkraken = super.gitkraken.overrideAttrs(oldAttrs: rec {
    version = "3.3.4";
    name    = "gitkraken-${version}";

    src = super.fetchurl {
      url = "https://release.gitkraken.com/linux/v${version}.deb";
      sha256 = "1djrbpm1f258cicf65ddvndpxi1izmnc12253k1zwl77z4jjbwls";
    };

    libPath = with self; super.stdenv.lib.makeLibraryPath [
      super.stdenv.cc.cc.lib
      curl
      udev
      xorg.libX11
      xorg.libXext
      xorg.libXcursor
      xorg.libXi
      xorg.libxcb
      glib
      xorg.libXScrnSaver
      xorg.libxkbfile
      xorg.libXtst
      nss
      nspr
      cups
      alsaLib
      expat
      gdk_pixbuf
      dbus
      xorg.libXdamage
      xorg.libXrandr
      atk
      pango
      cairo
      freetype
      fontconfig
      xorg.libXcomposite
      xorg.libXfixes
      xorg.libXrender
      gtk2
      gnome2.GConf
      libgnome_keyring
    ];

    buildInputs = [ self.dpkg ];
    unpackPhase = "true";
    buildCommand = ''
      mkdir -p $out
      dpkg -x $src $out
      substituteInPlace $out/usr/share/applications/gitkraken.desktop \
        --replace /usr/share/gitkraken $out/bin
      cp -av $out/usr/* $out
      rm -rf $out/etc $out/usr $out/share/lintian
      chmod -R g-w $out

      for file in $(find $out -type f \( -perm /0111 -o -name \*.so\* \) ); do
        patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" "$file" || true
        patchelf --set-rpath ${libPath}:$out/share/gitkraken $file || true
      done

      find $out/share/gitkraken -name "*.node" -exec patchelf --set-rpath "${libPath}:$out/share/gitkraken" {} \; 

      rm $out/bin/gitkraken
      ln -s $out/share/gitkraken/gitkraken $out/bin/gitkraken
    '';
    });
  }
