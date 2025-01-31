{ buildLinux, fetchgit, ... }@args:
buildLinux (
  args
  // rec {
    version = "6.1.3-huawei";
    modDirVersion = version;

    src = fetchGit {
      url = "https://github.com/codepayne/linux-sound-huawei.git";
      ref = "bom-wxx9-mclk";
      rev = "6976fc0fea0dcc5a367580cd7edf94574601837e";
    };
    kernelPatches = [ ];

    extraConfig = builtins.readFile ./kconfig.txt;
    ignoreConfigErrors = true;
    extraMeta.branch = "6.1.3";
  }
  // (args.argsOverride or { })
)
