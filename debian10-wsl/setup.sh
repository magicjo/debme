#!/usr/bin/env bash

set -o nounset
set -o errexit

OPTS=$(getopt -o h --long help -n 'parse-options' -- "$@")

if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi
eval set -- "$OPTS"

function help() {
    cat <<-EOF

 Setup debme on wsl2 before install.
 MUST run it as 'sudo'

 $ sudo ./debian10-wsl/setup.sh [OPTIONS]

 OPTIONS:
   -h,--help) Display usage

EOF
}

while true; do
  case "$1" in
    -h | --help ) help ; exit 0 ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

# Set sources list
cat <<-'EOF' > /etc/apt/sources.list
deb http://deb.debian.org/debian buster main contrib non-free
deb http://deb.debian.org/debian buster-updates main contrib non-free
deb http://security.debian.org/debian-security/ buster/updates main contrib non-free
deb http://ftp.debian.org/debian buster-backports main contrib non-free
EOF

# Run setup
SSH_USERNAME="${SUDO_USER}" scripts/setup.sh
