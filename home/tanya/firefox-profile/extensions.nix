{ pkgs, ... }:
{
  # https://gitlab.com/rycee/nur-expressions/-/blob/master/pkgs/firefox-addons/addons.json?ref_type=heads
  programs.firefox.profiles.tanya.extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
    censor-tracker
    clearurls
    immersive-translate
    betterttv
    bitwarden
    onetab
    privacy-badger
    qr-code-address-bar
    smartproxy
    stylus
    tampermonkey
    ublock-origin
  ];
}
