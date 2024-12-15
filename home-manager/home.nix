{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];
  disabledModules = [
    ./modules/ssh.nix
    ./modules/vivaldi.nix
    ./modules/spoofdpi.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "egor";
  home.homeDirectory = "/home/egor";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  xdg.systemDirs.data = [ "${config.home.homeDirectory}/.local/share" ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/egor/etc/profile.d/hm-session-vars.sh
  #

  services.syncthing.enable = true;
  services.gnome-keyring.enable = true;
  # services.home-manager.autoUpgrade.enable = true;
  # services.home-manager.autoUpgrade.frequency = "weekly";
}
