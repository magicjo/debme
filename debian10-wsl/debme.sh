#!/usr/bin/env bash

set -o nounset
set -o errexit

OPTS=$(getopt -o hu:d: --long help,desktop-ui:,dotfiles: -n 'parse-options' -- "$@")

if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi
eval set -- "$OPTS"

DESKTOP_UI="none"
DOTFILES=""

function help() {
    cat <<-EOF

 Install debme on wsl2.

 $ ./debian10-wsl/debme.sh [OPTIONS]

 OPTIONS:
   -h,--help)          Display usage
   -u,--desktop-ui UI) Set ui to use
                       Default: none
                       Available: none, wsl2-win
   -d,--dotfiles FILE) Set dotfiles path to unarchive
                       Default: ""
EOF
}

while true; do
  case "$1" in
    -h | --help ) help ; exit 0 ;;
    -u | --desktop-ui ) DESKTOP_UI="$2"; shift; shift ;;
    -d | --dotfiles ) DOTFILES="$2"; shift; shift ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

ansible-playbook --connection=local --extra-vars="desktop_ui=${DESKTOP_UI} dotfiles=${DOTFILES}" \
  scripts/tool.yml \
  scripts/fish.yml \
  scripts/dotfiles.yml \
  scripts/docker.yml \
  scripts/nodejs.yml \
  scripts/ide.yml \
  scripts/chrome.yml \
  scripts/wsl2.yml

sudo ./scripts/cleanup.sh
