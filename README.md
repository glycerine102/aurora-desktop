# Bluefin Image for Developer Laptop

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
rpm-ostree rebase ostree--image-signed:docker://ghcr.io/glycerine102/bluefin-laptop:v40.1.5
```

## After a New Installation

New installs can also use the `ansible-playbook` to grab the needed `homebrew` packages.
