--[[ 
   StabilizeAllClips.lua
   ---------------------------------------------
   Place in:  
       Windows:  %PROGRAMDATA%\Blackmagic Design\DaVinci Resolve\Fusion\Scripts\Utility\
       macOS:    /Library/Application Support/Blackmagic Design/DaVinci Resolve/Fusion/Scripts/Utility/
                 (or ~/Library/Application Support/Blackmagic Design/DaVinci Resolve/Fusion/Scripts/Utility/)
       Linux:    /opt/resolve/Fusion/Scripts/Utility/ 
                 (or ~/home/resolve/Fusion/Scripts/Utility/ depending on your install)
   ---------------------------------------------
   Usage:
      1. In DaVinci Resolve, open a project & timeline.
      2. Go to the top menu: Workspace > Scripts > Utility
         and select "StabilizeAllClips.lua".
      3. Watch the console output in the 'Console' tab 
         (Fusion page or menubar: Workspace > Console).
--]]

function main()
    -- Grab the Resolve API handle
    local resolve = Resolve()
    
    -- Optionally switch to the Color page (if not there already).
    resolve:OpenPage("color")

    -- Grab project & timeline
    local pm = resolve:GetProjectManager()
    local project = pm:GetCurrentProject()
    local timeline = project:GetCurrentTimeline()

    if timeline == nil then
        print("No timeline is loaded. Aborting script.")
        return
    end

    local trackCount = timeline:GetTrackCount("video")
    if trackCount < 1 then
        print("No video tracks found in the current timeline.")
        return
    end

    print("Beginning stabilization of all video clips...")

    -- Iterate over each video track
    for t = 1, trackCount do
        local clipList = timeline:GetItemListInTrack("video", t)
        if clipList ~= nil then
            for _, clip in ipairs(clipList) do
                local clipName = clip:GetName()
                
                -- Attempt stabilization
                local success = clip:Stabilize()
                if success then
                    print("Stabilized clip: " .. clipName)
                else
                    print("FAILED to stabilize clip: " .. clipName)
                end
            end
        end
    end

    print("All clips processed.")
end

main()
