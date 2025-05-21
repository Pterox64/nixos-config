{ pkgs, ... }:
{
  # https://gitlab.com/rycee/nur-expressions/-/blob/master/pkgs/firefox-addons/addons.json?ref_type=heads
  programs.firefox.profiles.egor.extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    censor-tracker
    clearurls
    immersive-translate
    betterttv
    bitwarden
    open-url-in-container
    container-tab-groups
    multi-account-containers
    onetab
    plasma-integration
    privacy-badger
    qr-code-address-bar
    smartproxy
    stylus
    tampermonkey
    ublock-origin
  ];
}
