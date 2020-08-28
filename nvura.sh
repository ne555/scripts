#!/bin/sh
#export $(dbus-launch)
zathura --synctex-editor-command="nvr --servername $1-socket -c \"let g:syncpdf='$1'\" --remote -c %{line} %{input}" $1 &>error.log &
reset
nvim --listen "$1-socket" -c "let g:syncpdf='$1'"
