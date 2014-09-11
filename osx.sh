#!/bin/sh

# allow text selection Quick Look window
defaults write com.apple.finder QLEnableTextSelection -bool true

# expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# restart automatically if the computer freezes
systemsetup -setrestartfreeze on

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
