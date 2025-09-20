```sh
curl -L -O https://github.com/nix-community/NixOS-WSL/releases/download/2505.7.0/nixos.wsl
wsl --install --from-file nixos.wsl
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz home-manager
sudo nix-channel --update
sudo nixos-rebuild switch
sudo mkdir -p /home/zobweyt
nix-shell -p git --run "sudo git clone https://github.com/zobweyt/nix.git /home/zobweyt/.nix"
sudo ln -sf /home/zobweyt/.nix/hosts/nixos-wsl/configuration.nix /etc/nixos/configuration.nix
sudo nixos-rebuild boot
exit
wsl --shutdown
wsl -d NixOS --user root exit
wsl --shutdown
wsl -d NixOS
sudo rm -rf /home/nixos
sudo chown -R $(id -u):$(id -g) /home/zobweyt/.nix
```

- ssh (mv ~/.ssh)
- gpg (https://gist.github.com/angela-d/8b27670bac26e4bf7c431715fef5cc51)

---

```sh
wsl --unregister NixOS
```

---

```sh
explorer.exe (Get-ChildItem -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Lxss | Where-Object { $_.GetValue("DistributionName") -eq 'NixOS' }).GetValue("BasePath")
```

---
---
---

```sh
sudo ln -sf "$(pwd)/configuration.nix" /etc/nixos/configuration.nix
```

```sh
sudo nixos-rebuild switch
```

---

```sh
sudo unlink /etc/nixos/configuration.nix
```
