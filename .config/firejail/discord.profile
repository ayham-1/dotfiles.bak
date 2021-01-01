# Firejail profile for discord
# This file is overwritten after every install/update
# Persistent local customizations
include discord.local
# Persistent global definitions
include globals.local

noblacklist ${HOME}/.config/discord
noblacklist ${HOME}/pix/keyboards
noblacklist ${HOME}/pix/memes
noblacklist ${HOME}/pix/screengrabs

mkdir ${HOME}/.config/discord
whitelist ${HOME}/.config/discord
whitelist ${HOME}/pix/memes
whitelist ${HOME}/pix/sreengrabs
whitelist ${HOME}/pix/keyboards

private-bin discord
private-opt discord

# Redirect
include discord-common.profile
