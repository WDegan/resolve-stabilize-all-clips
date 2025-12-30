# Stabilize All Clips (DaVinci Resolve Lua Script)

A tiny DaVinci Resolve utility script that batch-stabilizes **every clip on every video track** in the **current timeline**.

It’s designed for fast “get me in the ballpark” stabilization passes—especially useful for rough cuts, selects reels, or messy vérité days.

## What it does

- Switches to the **Color** page (where stabilization is available).
- Finds the current project + current timeline.
- Iterates through every **video track** and every **clip** in that track.
- Calls Resolve’s `Stabilize()` on each clip.
- Prints per-clip success/failure to the Resolve Console.

## Requirements

- DaVinci Resolve (Free or Studio)
- Scripting enabled (built-in Resolve scripting)
- A project with a timeline loaded

## Install

Rename the script file to:

- `StabilizeAllClips.lua`

Copy it into the Resolve scripts folder:

### Windows
`%PROGRAMDATA%\Blackmagic Design\DaVinci Resolve\Fusion\Scripts\Utility\`

### macOS
`/Library/Application Support/Blackmagic Design/DaVinci Resolve/Fusion/Scripts/Utility/`

(or)

`~/Library/Application Support/Blackmagic Design/DaVinci Resolve/Fusion/Scripts/Utility/`

### Linux
`/opt/resolve/Fusion/Scripts/Utility/`

(or depending on install)

`~/home/resolve/Fusion/Scripts/Utility/`

## Usage

1. Open DaVinci Resolve and load a project + timeline.
2. Run the script:
   - `Workspace > Scripts > Utility > StabilizeAllClips.lua`
3. View output in:
   - `Workspace > Console`

## Notes / Limitations

- Some timeline items (titles, generators, certain compound/nested items) may fail to stabilize—those will print a FAILED line.
- Stabilization settings/mode are whatever Resolve uses for that clip context. If you want a specific method/strength, set it up first in the Inspector/Stabilization panel before running.
- On long timelines this can take a while. Keep the Console open so you can confirm it’s working.

## Why this exists

Because clicking Stabilize 300 times is tedious. 

## Author

Wayne Degan

## License

MIT — see `LICENSE`.