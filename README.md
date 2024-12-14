# Aurora Image for Developer Desktop

## Building New Images

New images are built with Github actions only on semver tags
(example: `v40.1.4`).
When a new image is built a package is retained in Github and can then be applied to machines.

### Display Current Version Info

```bash
rpm-ostree status
```

### Rebase to New Version

```
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/glycerine102/aurora-desktop:v41.0.1
```

## After a New Installation

New installs can also use the `ansible-playbook` to grab the needed `homebrew` packages and flatpak applications.
The steps below are a rough outline to follow if needing to provision the computer locally after a fresh install.

- Import ZFS datasets
- Change to Ansible control directory
- Remove the local Python (.venv) environment directory
- Install and use Mise to configure a new environment
- Run the Ansible provisioning playbook
- Apply Chezmoi dotfiles configurations
