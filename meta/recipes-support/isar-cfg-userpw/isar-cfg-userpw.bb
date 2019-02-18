# This software is a part of ISAR.

DESCRIPTION = "Isar configuration package for user passwords"
MAINTAINER = "isar-users <isar-users@googlegroups.com>"
DEBIAN_DEPENDS = "passwd"

SRC_URI = "file://postinst.tmpl"

TEMPLATE_FILES = "postinst.tmpl"
TEMPLATE_VARS = "CFG_USER_PW"

CFG_USER_PW ?= ""

python() {
    # Enforce CFG_USER_PW to be a single space separated array
    d.setVar("CFG_USER_PW", " ".join(d.getVar("CFG_USER_PW", True).split()))
}

inherit dpkg-raw

do_install() {
    echo "intentionally left blank"
}
