local addonName, addonTbl = ...

-- Minimap Button
-- Minimap has black overlay
-- Overlay alpha is 100% when not in range
-- Overlay alpha is 0% when next to me
local function scanArea(self)
    --[[ Scan Area

    Scan's the area for Bigshart
    -----------------------------------]]
    if ( CheckInteractDistance("target", 4) ) then
        -- Change the minimap button icon
    else
        -- 
    end
end
