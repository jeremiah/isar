# This software is a part of ISAR.
# Copyright (C) 2015-2017 ilbers GmbH

EXT4_IMAGE_FILE = "${IMAGE_FULLNAME}.ext4.img"

IMAGER_INSTALL += "e2fsprogs"

do_ext4_image[stamp-extra-info] = "${DISTRO}-${MACHINE}"

# Generate ext4 filesystem image
do_ext4_image() {
    rm -f '${DEPLOY_DIR_IMAGE}/${EXT4_IMAGE_FILE}'

    truncate -s ${ROOTFS_SIZE}K '${DEPLOY_DIR_IMAGE}/${EXT4_IMAGE_FILE}'

    image_do_mounts

    sudo chroot ${BUILDCHROOT_DIR} /sbin/mke2fs ${MKE2FS_ARGS} \
                -F -d '${PP_ROOTFS}' '${PP_DEPLOY}/${EXT4_IMAGE_FILE}'
}

addtask ext4_image before do_build after do_copy_boot_files do_install_imager_deps
do_ext4_image[prefuncs] = 'set_image_size'
