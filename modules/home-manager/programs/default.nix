{
  pkgs,
  inputs,
  ...
}: let
  my-python-packages = ps:
    with ps; [
      numpy
      psycopg2
      matplotlib
    ];
in {
  programs = {
    vscode = {
      enable = true;
      package = pkgs.stable.vscode.fhsWithPackages (ps:
        with ps; [
          libGL # Neccesary to debug FabricMC Mods
          flite # Mc Narrator
          usbmuxd
          #openssl_1_1
          fontconfig
          freetype
          xorg.libX11
          xorg.libXcursor
          xorg.libXrandr
          xorg.libXi
        ]);
    };

    java = {
      enable = true;
      package = pkgs.openjdk17;
    };

    direnv = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    # Games
    lutris
    heroic
    bottles
    protonup-qt
    cartridges
    prismlauncher
    ryujinx
    airshipper # veloren

    # GUI Applications
    d-spy
    github-desktop
    transmission_4-gtk
    android-studio
    jetbrains-toolbox
    zoom-us
    jetbrains.idea-ultimate
    chiaki

    # Tools
    bat
    bc
    helix
    hsetroot
    catimg
    eza
    fd
    ripgrep
    fzf
    socat
    htop
    jq
    acpi
    ffmpeg
    glib
    nodePackages_latest.pnpm
    yarn
    git-lfs
    moreutils
    cava
    mpdris2
    xorg.xev
    procps
    playerctl
    recode
    gcc
    zls
    mangohud
    imagemagick
    pavucontrol
    blueberry
    swappy
    micro
    alacritty
    bubblewrap
    fuse-overlayfs
    dwarfs
    psmisc
    toolbox

    # Frameworks
    love # lua

    # Languages
    bun
    rustup
    nodejs_20
    luajit
    typescript
    meson
    ninja
    (python3.withPackages my-python-packages)
  ];

  xdg.desktopEntries = {
    "heroic" = {
      exec = "heroic %u";
      icon = "heroic";
      name = "Heroic Games Launcher";
      categories = [
        "Game"
      ];
      settings = {
        "StartupWMClass" = "Heroic";
        "MimeType" = "x-scheme-handler/heroic";
        "Type" = "Application";
      };
    };
    "com.heroicgameslauncher.hgl" = {
      name = "Heroic";
      noDisplay = true;
    };
    "Ryujinx" = {
      exec = "ryujinx %u";
      icon = "Ryujinx";
      name = "Ryujinx";
      categories = [
        "Game"
      ];
    };
  };
}
