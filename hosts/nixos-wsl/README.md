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
