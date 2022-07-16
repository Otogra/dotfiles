if [ -z "${DISPLAY}" ] && [[ "$(tty)" = "/dev/tty1" ]] then;
    pgrep awesome || startx -depth
fi
