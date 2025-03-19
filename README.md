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

## Шифрование секретов

### Подготовка

```bash
nix-shell -p sops age
```

### Создание Age ключа

sops-nix использует Age для шифрования. Создайте Age ключ:

1. Сгенерируйте новый Age ключ:

   ```bash
   age-keygen -o key.txt
   ```

1. Сохраните публичный ключ (он понадобится для шифрования):

   ```bash
   cat key.txt
   ```

   Скопируйте строку, начинающуюся с age1....

1. Поместите приватный ключ в безопасное место (например, /var/lib/sops-nix/key.txt):

   ```bash
   sudo mkdir -p /var/lib/sops-nix
   sudo mv key.txt /var/lib/sops-nix/key.txt
   sudo chmod 600 /var/lib/sops-nix/key.txt
   ```

### Шифруем секреты

```bash
sops --encrypt --in-place secrets.yaml
```
