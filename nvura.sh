#!/bin/sh
#export $(dbus-launch)
socket_name="/tmp/nvimsocket-$1"
zathura --synctex-editor-command="nvr --servername ${socket_name} -c \"let g:syncpdf='$1'\" --remote -c %{line} %{input}" $1 &>error.log &
reset
nvim --listen "${socket_name}" -c "let g:syncpdf='$1'"
