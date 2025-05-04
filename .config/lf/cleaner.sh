#!/bin/sh
printf '\033_Ga=d;\033\\'
exec kitten icat --clear --stdin no --transfer-mode memory </dev/null >/dev/tty

# rm -f /tmp/lf-*

exit 0
