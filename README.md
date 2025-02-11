# nixos-config

## Подготовка диска

```bash
git clone https://github.com/Pterox64/nixos-config.git
cd nixos-config
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount machines/<name>/disk-config.nix
```

## Install

 ```bash
 sudo nixos-generate-config --root /mnt
 sudo mkdir /mnt/home/<user>/git
 cd /mnt/home/<user>/git
 sudo git clone https://github.com/Pterox64/nixos-config.git
 cd nixos-config
 sudo rm -f machines/<name>/hardware-configuration.nix
 sudo cp /mnt/etc/nixos/hardware-configuration.nix  machines/<name>/
 sudo nixos-install --flake .#huawei_mate15
 sudo nixos-enter
 nix daemon &
 chown -R <user>:<user> /home/<user>/git
 sbctl create-keys
 sbctl enroll-keys --microsoft
 sbctl verify
 nixos-rebuild boot --flake .#huawei_mate15
 ```