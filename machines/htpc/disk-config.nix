{
  disko.devices = {
    disk = {
      boot = {
      	device = "/dev/disk/by-id/usb-SanDisk_Cruzer_Glide_3.0_4C530001181023112053-0:0";
      	type = "disk";
      	content = {
          type = "gpt";
          partitions = {
            ESP = {
#              priority = 1;
              name = "ESP";
#              start = "1M";
              size = "100%";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
          };
        };
      };
      main = {
        device = "/dev/nvme0n1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            root = {
              end = "-24G";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ]; # Override existing partition
                subvolumes = {
                  # Subvolume name is different from mountpoint
                  "/rootfs" = {
                    mountpoint = "/";
                  };
                  # Subvolume name is the same as the mountpoint
                  "/home" = {
                    mountOptions = [ "compress=zstd" ];
                    mountpoint = "/home";
                  };
                  # Sub(sub)volume doesn't need a mountpoint as its parent is mounted
                  "/home/tanya" = { };
                  # Parent is not mounted so the mountpoint must be set
                  "/nix" = {
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                    mountpoint = "/nix";
                  };
                };
              };
            };
            plainSwap = {
              size = "100%";
              content = {
                type = "swap";
                discardPolicy = "both";
                resumeDevice = true; # resume from hiberation from this device
              };
            };
          };
        };
      };
    };
  };
  nodev = {
    "/tmp" = {
      fsType = "tmpfs";
      mountOptions = [ "size=200M" ];
    };
  };
}
