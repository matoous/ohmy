#!/bin/sh
# This script saves the current brew setup (e.g. all casks, brews, mas and more)
# to .Brewfile in home directoru (--global flag). In ideal case this file is symlinked
# to its version in Dropbox so you have a backup.
brew bundle --global --force --describe dump
echo "OK ✅: brew backup done at $(date '+%H:%M:%S %d/%m/%y')"
