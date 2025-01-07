# Aurora Image for Developer Desktop

## Building New Images

New images are built with Github actions only on semver tags
(example: `v40.1.4`).
The `latest` tag is also applied to the newest build image.
When a new image is built, a package is retained in Github and can then be applied to machines.

### Display Current Version Info

```bash
rpm-ostree status
```

### Updating and Upgrading

#### Rebase to New Version Tag

Switch to a specific version tag.

```base
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/glycerine102/aurora-desktop:v41.0.1
```

#### Upgrade On latest

While on the `latest` tag, a simply update will suffice.
Since images are set to _only_ build on new git tags, the build action will need triggered manually
if there was no git push with a tag.
This is sufficient to obtain image updates from the base stable source.

```bash
ujust update
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
