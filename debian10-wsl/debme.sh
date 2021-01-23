#!/usr/bin/env bash

set -o nounset
set -o errexit

OPTS=$(getopt -o hu:d:s: --long help,desktop-ui:,dotfiles:,custom-script: -n 'parse-options' -- "$@")

if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi
eval set -- "$OPTS"

DESKTOP_UI="none"
DOTFILES=""
CUSTOM_SCRIPTS=""

function help() {
    cat <<-EOF

 Install debme on wsl2.

 $ ./debian10-wsl/debme.sh [OPTIONS]

 OPTIONS:
   -h,--help)               Display usage
   -u,--desktop-ui UI)      Set ui to use
                            Default: none
                            Available: none, wsl2-win
   -d,--dotfiles FILE)      Set dotfiles path to unarchive
                            Default: ""
   -s,--custom-script FILE) Set custom script path to execute
                            Default: ""
EOF
}

while true; do
  case "$1" in
    -h | --help ) help ; exit 0 ;;
    -u | --desktop-ui ) DESKTOP_UI="$2"; shift; shift ;;
    -d | --dotfiles ) DOTFILES="$2"; shift; shift ;;
    -s | --custom-script ) CUSTOM_SCRIPTS="$2"; shift; shift ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

EXTRA_ARGS="desktop_ui=${DESKTOP_UI} dotfiles=${DOTFILES} custom_script=${CUSTOM_SCRIPTS}"
ansible-playbook --connection=local --extra-vars="${EXTRA_ARGS}" \
  scripts/tool.yml \
  scripts/fish.yml \
  scripts/dotfiles.yml \
  scripts/docker.yml \
  scripts/nodejs.yml \
  scripts/ide.yml \
  scripts/chrome.yml \
  scripts/wsl2.yml \
  scripts/custom.yml

sudo ./scripts/cleanup.sh
