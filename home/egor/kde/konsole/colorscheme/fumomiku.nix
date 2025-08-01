{ config, pkgs, ... }:
let
  bgImageFumoMiku = pkgs.stdenv.mkDerivation {
    name = "fumomiku-image";
    src = ./img/fumo9.png;
    phases = [ "installPhase" ];
    installPhase = "cp $src $out";
  };
in
{
  home.file.".local/share/konsole/FumoMiku.colorscheme".text = ''
    [Background]
    Color=35,38,39
    RandomHueRange=360
    RandomSaturationRange=100

    [BackgroundFaint]
    Color=49,54,59
    RandomHueRange=360
    RandomSaturationRange=100

    [BackgroundIntense]
    Color=0,0,0
    RandomHueRange=360
    RandomSaturationRange=100

    [Color0]
    Color=35,38,39

    [Color0Faint]
    Color=49,54,59

    [Color0Intense]
    Color=127,140,141

    [Color1]
    Color=237,21,21

    [Color1Faint]
    Color=120,50,40

    [Color1Intense]
    Color=192,57,43

    [Color2]
    Color=17,209,22

    [Color2Faint]
    Color=23,162,98

    [Color2Intense]
    Color=28,220,154

    [Color3]
    Color=246,116,0

    [Color3Faint]
    Color=182,86,25

    [Color3Intense]
    Color=253,188,75

    [Color4]
    Color=29,153,243

    [Color4Faint]
    Color=27,102,143

    [Color4Intense]
    Color=61,174,233

    [Color5]
    Color=155,89,182

    [Color5Faint]
    Color=97,74,115

    [Color5Intense]
    Color=142,68,173

    [Color6]
    Color=26,188,156

    [Color6Faint]
    Color=24,108,96

    [Color6Intense]
    Color=22,160,133

    [Color7]
    Color=252,252,252

    [Color7Faint]
    Color=99,104,109

    [Color7Intense]
    Color=255,255,255

    [Foreground]
    Color=252,252,252
    RandomHueRange=360
    RandomSaturationRange=100

    [ForegroundFaint]
    Color=239,240,241
    RandomHueRange=360
    RandomSaturationRange=100

    [ForegroundIntense]
    Color=61,174,233
    RandomHueRange=360
    RandomSaturationRange=100

    [General]
    Anchor=1,1
    Blur=true
    ColorRandomization=false
    Description=FumoMiku
    FillStyle=Adapt
    Opacity=0.7
    Wallpaper=${bgImageFumoMiku}
    WallpaperFlipType=NoFlip
    WallpaperOpacity=0.4
  '';
}
