# New Machine

Create a new key pair

> Optional: Skip if you already have a existing key pair


```
ssh-keygen -t ed25519 -C "homelab"
```

> Remember to add passphrase to secret vault

```
mkdir -p ~/.config/sops/age
nix-shell -p ssh-to-age --run "read -s SSH_TO_AGE_PASSPHRASE; export SSH_TO_AGE_PASSPHRASE; ssh-to-age -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt"
```

Grab the public age key

```bash
nix shell nixpkgs#age -c age-keygen -y ~/.config/sops/age/keys.txt
```



