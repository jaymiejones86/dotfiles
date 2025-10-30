#!/bin/bash

# AeroSpace workspace indicator script
# This script checks if a workspace is focused or has windows

# Extract workspace ID from the item name (e.g., "space.1" -> "1")
SID="${NAME#space.}"

# Get the currently focused workspace
FOCUSED=$(aerospace list-workspaces --focused)

# Check if this workspace has any windows
WINDOWS=$(aerospace list-windows --workspace "$SID" 2>/dev/null | wc -l | tr -d ' ')

# Update the appearance based on state
if [ "$SID" = "$FOCUSED" ]; then
  # Focused workspace - highlight with bright color
  sketchybar --set "$NAME" background.drawing=on background.color=0xff7aa2f7
elif [ "$WINDOWS" -gt 0 ]; then
  # Workspace has windows but not focused - show with default color
  sketchybar --set "$NAME" background.drawing=on background.color=0x40ffffff
else
  # Empty workspace - hide it
  sketchybar --set "$NAME" background.drawing=off
fi
