# Firejail profile for transmission-common
# Description: Fast, easy and free BitTorrent client
# This file is overwritten after every install/update
# Persistent local customizations
include transmission-common.local
# Persistent global definitions
# added by caller profile
#include globals.local

noblacklist ${HOME}/.cache/transmission
noblacklist ${HOME}/.config/transmission
noblacklist ${HOME}/dox/torrents

include disable-common.inc
include disable-devel.inc
include disable-exec.inc
include disable-interpreters.inc
include disable-passwdmgr.inc
include disable-programs.inc

mkdir ${HOME}/.cache/transmission
mkdir ${HOME}/.config/transmission
mkdir ${HOME}/dox/torrents
whitelist ${DOWNLOADS}
whitelist ${HOME}/.cache/transmission
whitelist ${HOME}/.config/transmission
whitelist ${HOME}/dox/torrents
include whitelist-common.inc
include whitelist-usr-share-common.inc
include whitelist-var-common.inc

apparmor
caps.drop all
machine-id
netfilter
nodvd
nonewprivs
noroot
nosound
notv
nou2f
novideo
protocol unix,inet,inet6
seccomp
shell none
tracelog

private-cache
private-dev
private-lib
private-tmp

dbus-user none
dbus-system none

memory-deny-write-execute