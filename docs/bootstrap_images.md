# Generating the bootstrap QEMU images

## All
- leave `root` password empty
- set timezone as UTC
- most guided installers are really nice these days
- make the partitioner use the entire disk
- prefer picking a better mirror over enabling a proxy
- always install/enable OpenSSH

## Debian
- `./generate/_all.sh debian`
- Click "Install" option in GRUB when KVM boots up
- Most questions are prefilled but you do have to hit enter on the disk selection question
- During "Tasksel", unclick "desktop environment" and "print server"

## Alpine
- `./generate/_all.sh alpine`
- Login as "root"
- Run `setup-alpine` command and answer the installer prompts
- Run `poweroff` to shutdown the system
