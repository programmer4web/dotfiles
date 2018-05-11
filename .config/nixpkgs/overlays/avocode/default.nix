self: super: {
  avocode = with super; stdenv.mkDerivation rec {
    name = "avocode-${version}";
    version = "2.26.0";
    src = fetchurl {
      url = "https://media.avocode.com/download/avocode-app/${version}/avocode-${version}-linux.zip";
      sha256 = "11d3nlshyzh5aqf5vsvnjwhr9qn8a2kd848x0ylv91y9p9njgsl5";
    }; 
   
    libPath = stdenv.lib.makeLibraryPath [
      stdenv.cc.cc.lib 
      gdk_pixbuf
      glib
      gtk2
      atk
      pango
      cairo
      freetype
      fontconfig
      dbus
      xorg.libX11
      xorg.libxcb
      xorg.libXi
      xorg.libXcursor
      xorg.libXdamage
      xorg.libXrandr
      xorg.libXcomposite
      xorg.libXext
      xorg.libXfixes
      xorg.libXrender
      xorg.libXtst
      xorg.libXScrnSaver
      gnome2.GConf
      nss
      nspr
      alsaLib
      cups
      expat
      udev
    ];

    desktopItem = makeDesktopItem {
      name = "Avocode";
      exec = "avocode";
      icon = "avocode";
      desktopName = "Avocode";
      genericName = "Design Inspector";
      categories = "Application;Development;";
      comment = "The bridge between designers and developers";
    };
    dontBuild= true;
    buildInputs = [unzip];
    nativeBuildInputs = [ makeWrapper ];
    buildCommand = ''
      mkdir -p $out
      unzip $src -d $out

      substituteInPlace $out/avocode.desktop.in \
        --replace /path/to/avocode-dir/Avocode $out/bin/avocode \
        --replace /path/to/avocode-dir/avocode.png avocode

      mkdir -p $out/bin
      mkdir -p $out/share/applications
      mkdir -p $out/share/pixmaps

      mv $out/avocode.desktop.in $out/share/applications/avocode.desktop
      mv $out/avocode.png $out/share/pixmaps/

      fixupPhase

      for file in $(find $out -type f \( -perm /0111 -o -name \*.so\* \) ); do
        patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" "$file" || true
        patchelf --set-rpath ${libPath}:$out/ $file || true
      done

      patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" $out/avocode
      patchelf --set-rpath ${libPath}:$out/ $out/avocode

      rm $out/resources/cjpeg

      ln -s $out/avocode $out/bin/avocode
      chmod -R g-w $out
    '';
  }; 
  
  
  
}
