{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    qemu_kvm
    wget
    curl
    vim
    neovim
    git
    tig
    ack
    tree
    exa
    fd
    ripgrep
    bc
    bat
    finger_bsd
    gnupg
    pass
    zip
    unzip
    colordiff
    rsync
    htop
    gotop
    lsof
    pstree
    nmap
    parted
    ranger
    traceroute
    telnet
    tcpdump
    whois
    dnsutils
    mtr
    docker-compose
    vagrant
    xorg.xhost
    libreoffice
    evince
    gnome3.cheese
    gnome3.gedit
    gnome3.pomodoro
    gimp
    krita
    vlc
    obs-studio
    arandr
    peek
    transmission
    postman
    chromium
    firefox
    brogue
    discord
    steam
    minecraft
    scrot
    rofi
    rofi-pass
    feh
    rhythmbox
    screenkey
    scrot
    neofetch
    unrar
    gnome3.gnome-tweaks
    bibata-cursors
    capitaine-cursors
    element-desktop
    pkgs.numix-icon-theme-square
    pkgs.numix-gtk-theme
    woeusb
    jdk11
    jre
    kubectl
    minikube
    kompose
    k9s
    terraform
    kubernetes-helm
    google-cloud-sdk
    ansible
    gnomeExtensions.dash-to-dock
    gnomeExtensions.caffeine
    gnomeExtensions.system-monitor
    gnomeExtensions.appindicator
    tldr
    nodejs-14_x
    spotify
    ccls
    clang-tools
    wakatime
    texlive.combined.scheme-medium
    go
    gomodifytags
    gocode
    gopls
    gore
    gotests
    goimports
    pandoc
    zoom-us
    yubioath-desktop
    virt-manager
    gnome3.dconf
    nitrogen
    xorg.xmessage
    ghc
    slack
    gdk-pixbuf
    librsvg
    gnumake
    cmake
    youtube-dl
    flameshot
    amber-theme
    python39
    python-language-server
    leiningen
    clojure
    kdenlive
    hunspell
    hunspellDicts.en-ca
    hunspellDicts.fr-any
    aspell
    aspellDicts.en
    aspellDicts.fr
    gitAndTools.delta
    dive
    gitlab-runner
    geogebra6
    picom
    sbcl
    pciutils
    killall
    pdftk
    audacity
    libnotify
    vegeta
    jq
    nixfmt
    gcc
    nix-index
    figlet
    (steam.override {
      extraPkgs = pkgs: [ mono gtk3 gtk3-x11 libgdiplus zlib ];
      nativeOnly = true;
    }).run
    (pkgs.dwarf-fortress-packages.dwarf-fortress-full.override {
      theme = "spacefox";
      enableFPS = false;
    })
  ];
  nixpkgs.overlays = [
    (final: prev: {
      nextcloud-client = (prev.nextcloud-client.overrideAttrs (o: rec {
        # does not find password
        # https://github.com/NixOS/nixpkgs/pull/113731
        # In case nextcloud will not remember passwords...
        qtWrapperArgs = [
          "--prefix LD_LIBRARY_PATH : ${
            prev.lib.makeLibraryPath [ prev.libsecret ]
          }"
        ];
      }));
    })
    (final: prev: {
        dune = final.dune_1;
    })
  ];

}
