#!/bin/bash

# Get all workspaces that currently have windows
WORKSPACES_WITH_WINDOWS=$(aerospace list-workspaces --all)

# Get the focused workspace
FOCUSED=$(aerospace list-workspaces --focused)

# Define all possible workspaces
ALL_WORKSPACES=("1" "2" "3" "4" "5" "6" "7" "8" "9" "A" "B" "C" "D" "E" "F" "G" "I" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")

# Update each workspace indicator
for workspace in "${ALL_WORKSPACES[@]}"; do
  # Check if this workspace has windows
  WINDOWS=$(aerospace list-windows --workspace "$workspace" 2>/dev/null | wc -l | tr -d ' ')

  if [ "$workspace" = "$FOCUSED" ]; then
    # Focused workspace - highlight with bright color
    sketchybar --set space."$workspace" drawing=on background.drawing=on background.color=0xff7aa2f7 icon.color=0xff000000
  elif [ "$WINDOWS" -gt 0 ]; then
    # Workspace has windows but not focused - show with default color
    sketchybar --set space."$workspace" drawing=on background.drawing=on background.color=0x40ffffff icon.color=0xffffffff
  else
    # Empty workspace - hide it completely
    sketchybar --set space."$workspace" drawing=off
  fi
done
