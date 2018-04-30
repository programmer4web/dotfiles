self: super:

let 
  buildEnv = self.buildEnv;
  unstable = import <nixos-unstable> {};
  native = self.plumNative;
in {
  plumelo = with self; buildEnv {
    name  = "plumelo";
    paths = [
      #general
      ag
      ripgrep
      p7zip

      # audio
      python35Packages.mps-youtube
      python35Packages.youtube-dl
      mpv
      mplayer
      cava

      # office
      libreoffice-fresh
      unoconv

      # browsers
      firefox
      unstable.chromium
      google-chrome
      chromedriver
      epiphany

      # communication
      unstable.slack
      unstable.skypeforlinux

      # accounting
      ledger

      # editors
      atom
      (native editorconfig-core-c)
      (native vim_plum)
      vim-vint
      unstable.neovim
      python27Packages.neovim
      python36Packages.neovim
      python27Packages.yamllint

      # langs
      (native nodejs-8_x) 
      (native ruby)

      # misc
      unstable.keepassx-community
      taskwarrior
      transmission_gtk
      stress
      glmark2
      
      # git
      gitAndTools.tig
      git-lfs
      (native git-keyring)
      gitkraken_latest
      
      # configuration management
      vagrant_2
      redir
      bridge-utils
      unstable.ansible_2_4
    ];
  };
}
