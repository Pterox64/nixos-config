{ config, ... }:
{
  programs.firefox.policies = {
    DisplayBookmarksToolbar = "newtab";
    PasswordManagerEnabled = false;
    SearchBar = "separate";
    # HardwareAcceleration = true;
    #   DefaultDownloadDirectory = "${config.xdg.userDirs.download}";
    #   DNSOverHTTPS = {
    #     Enabled = true;
    #     Locked = true;
    #     Fallback = false;
    #     ExcludedDomains = [
    #       "pterox.website"
    #       "local"
    #     ];
    #   };
    #   TranslateEnabled = false;
    #   RequestedLocales = [
    #     "ru"
    #     "en-US"
    #   ];
    #   PostQuantumKeyAgreementEnabled = true;
    #   ExtensionUpdate = true;
    #   EnableTrackingProtection = {
    #     Value = true;
    #     Cryptomining = true;
    #     Fingerprinting = true;
    #   };
  };
}
