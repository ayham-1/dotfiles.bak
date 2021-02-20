# Firejail profile for Newsboat
# Description: RSS program

#include default.profile

#include newsboat.local
## Persistent global definitions
#include globals.local
#
#noblacklist ${HOME}/.config/newsboat
#noblacklist ${HOME}/.cache/newsboat
#noblacklist ${HOME}/vimwiki/news/
#whitelist ${HOME}/.config/newsboat
#whitelist ${HOME}/.cache/newsboat
#whitelist ${HOME}/vimwiki/news/
#
### mpv
##private-bin mpv
##whitelist ${HOME}/.config/mpv
##whitelist ${HOME}/.config/youtube-dl
##whitelist ${HOME}/.netrc
##include whitelist-common.inc
##include whitelist-players.inc
##whitelist /usr/share/lua
##whitelist /usr/share/lua*
##whitelist /usr/share/vulkan
##include whitelist-usr-share-common.inc
##include whitelist-var-common.inc
##private-bin env,mpv,python*,waf,youtube-dl
#
## Lynx private-bin sh,gzip,lynx
##private-etc lynx.cfg,lynx.lss
#
#include disable-common.inc
#include disable-devel.inc
#include disable-exec.inc
#include disable-interpreters.inc
#include disable-passwdmgr.inc
#include disable-programs.inc
#include disable-xdg.inc
#
##mkdir ${HOME}/.newsboat
#whitelist ${HOME}/.newsboat
#include whitelist-common.inc
#
#apparmor
#caps.drop all
#ipc-namespace
#netfilter
#no3d
#nodvd
#nogroups
#nonewprivs
#noroot
#notv
#nou2f
#novideo
#protocol unix,inet,inet6,netlink
#seccomp
#shell none
#
#disable-mnt
#private-bin newsboat
#private-cache
#private-dev
#private-etc alternatives,ca-certificates,crypto-policies,pki,resolv.conf,ssl,terminfo
#private-tmp
#
#dbus-user none
#dbus-system none
#
#memory-deny-write-execute
