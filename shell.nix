with import <nixpkgs> {};

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    wget      # wget
    qemu      # qemu-img, qemu-system-*
    udevil    # udevil
    gzip      # gzip
    cpio      # cpio
    findutils # find, xargs
    cdrkit    # genisoimage
    syslinux  # isohybrid
  ];

  hardeningDisable = [ "all" ];
}
