# systemd-boot

See: <https://wiki.cachyos.org/configuration/boot_manager_configuration/>

Requires `sudo su` to go here and edit files in `/boot/loader`

## Kernel params

Edit your entry file, e.g: `/boot/loader/linux-cachyos.conf`, add to `options` line:

```conf
quiet amd_pstate=guided lsm=landlock,lockdown,yama,integrity,apparmor,bpf
```

TODO: `psi=1` is required for `waydroid`?

Or use cachyos's `sdboot-manage`. Edit the `/etc/sdboot-manage.conf` and run `sudo sdboot-manage gen`
