To install run:
```
sudo nix --extra-experimental-features "nix-command flakes" run 'github:nix-community/disko/latest#disko-install' -- --mode mount --flake '.#loitsu' --disk main /dev/disk/by-id/nvme-WD_Blue_SN580_2TB_2451DE406975 --write-efi-boot-entries --extra-files "$PWD" /etc/nixos
```
