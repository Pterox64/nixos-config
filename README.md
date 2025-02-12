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
 sudo nixos-install --flake .#<name>
 sudo nixos-enter
 chown -R <user>:users /home/<user>/git
 ```

> Если используется загрузчик **Lanzaboote** необходимо совершить дополнительные действия:
>
> ```bash
> sbctl create-keys
> sbctl enroll-keys --microsoft
> nixos-rebuild boot --flake /home/<user>/git/nixos-config#<name>
> ```
