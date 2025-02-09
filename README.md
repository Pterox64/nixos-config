# nixos-config

## Подготовка диска

```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount machines/<name>/disk-config.nix
```
