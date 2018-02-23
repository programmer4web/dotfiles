{ config, lib, pkgs, ... }:
{
  imports = [
    # all new pkgs and/or overlays
    ../pkgs/all.nix

    # config
    ../modules/services/X11/gnome3.nix 
    ../modules/virtualisation/lxc.nix
    ../modules/virtualisation/lxd.nix
    ../modules/virtualisation/vagrant.nix
    ../modules/hardware/ssd.nix
  ];

  nix.buildCores = 8;
  nixpkgs.config.allowUnfree = true;

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Bucharest";

  powerManagement = {
    enable = true;
  };

  programs = {
    tmux.enable = true;
    fish.enable = true;
    java.enable = true;
  };

  hardware = {
    pulseaudio.enable = true;
    cpu.intel.updateMicrocode = true;
    cpu.amd.updateMicrocode = true;

    opengl.extraPackages = with pkgs; [ vaapiIntel libvdpau-va-gl vaapiVdpau ];
  };

  boot = {
    initrd.availableKernelModules = [
      "hid-logitech-hidpp"
    ];
    kernelModules = [
      "coretemp"
    ];
    kernelPackages = pkgs.linuxPackages_4_15;
    blacklistedKernelModules = ["ideapad-laptop"];
  };

  environment.systemPackages = with pkgs; [
    acl
    p7zip
    wget
    gitKeyring
    slack
    firefox
    chromium
    google-chrome
    chromedriver
    lm_sensors
    nodejs
    libreoffice-fresh
    python35Packages.mps-youtube
    python35Packages.youtube-dl
    python27Packages.yamllint
    mpv
    mplayer
    cava
    ruby
    xsel
    atom
    parted
    gptfdisk
    cryptsetup
    ntfs3g
    tree
    unoconv
    atom
    vim_plum
    vim-vint
    neovim
    python27Packages.neovim
    python36Packages.neovim
    gitAndTools.tig
    gitkraken
    ag
    ripgrep
    keepassx-community
    skypeforlinux
    taskwarrior
    transmission_gtk
    epiphany
    ledger
    python27Packages.ledger-autosync
  ];

  users.defaultUserShell = "/run/current-system/sw/bin/fish";

  environment.variables = {
    EDITOR = "vim";
  };
}
