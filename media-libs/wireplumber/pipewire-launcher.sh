#!/bin/sh
# Begin /usr/bin/pipewire-launcher.sh

# First, kill any previous instances of pipewire, wireplumber, or pipewire-pulse
# that are running. Multiple instances of the daemon can not be run at the same
# time, and this helps prevent possible errors if a user logs out or logs in
# too fast, and restores audio if Pipewire hangs and needs to be reset.

pkill -u ${USER} -fx /usr/bin/pipewire-pulse
pkill -u ${USER} -fx /usr/bin/wireplumber
pkill -u ${USER} -fx /usr/bin/pipewire

# Start Pipewire first.
exec /usr/bin/pipewire &

sleep 1 

exec /usr/bin/pipewire -c pipewire-pulse.conf &
sleep 1

# Start Wireplumber now that Pipewire has been started.
exec /usr/bin/wireplumber &

# Start the Pulseaudio server included with Pipewire.
exec /usr/bin/pipewire-pulse &

# End /usr/bin/pipewire-launcher.sh