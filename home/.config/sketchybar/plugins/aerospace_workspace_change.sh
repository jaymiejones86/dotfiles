#!/bin/bash

# This script is called by AeroSpace when workspace changes
# It triggers a custom event in SketchyBar to update all workspace indicators

sketchybar --trigger aerospace_workspace_change
sketchybar --trigger space_windows_change
