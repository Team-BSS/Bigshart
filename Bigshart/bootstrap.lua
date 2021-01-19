local addonName, addonTbl = ...

addonTbl.config = {}
addonTbl.config.appColor = "cff8533ff"
addonTbl.config.options = {}
addonTbl.config.options.enabled = true
addonTbl.config.version = "1.2.1"
addonTbl.config.logs = {}
addonTbl.config.logs.level = "DEBUG"
addonTbl.config.logs.debug = "\124cff00ff00[d] Bigshart\124r: "
addonTbl.config.logs.info = "\124cff8533ff[i] Bigshart\124r: "
addonTbl.config.logs.warning = "\124cffff9933[w] Bigshart\124r: "
addonTbl.config.logs.error = "\124cffff0000[e] Bigshart\124r: "
addonTbl.config.URL = "https://bigshart.com/"



-- LDB Object --
local ldb = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("Bigshart", {
    type = "launcher",
    icon = "Interface\\Icons\\Spell_Nature_StormReach",
    OnClick = function(clickedframe, button)
        InterfaceOptionsFrame_OpenToFrame(myconfigframe)
    end,
})

--[[ Minimap Icon --

local icon = LibStub("LibDBIcon-1.0")
icon:Register("Bigshart", )
-----------------------------------]]

local function addOptionsContext()
    --[[ Add Options Context
    
    Creates a context in the Interface Options Menu
    -----------------------------------]]
    biglog('DEBUG', 'Creating Options Menu Context')
    
    -- Bigshart Options Panel --
    local optionsPanel = CreateFrame("FRAME")
    optionsPanel.name = addonName
    -- General App Info --
    -- TEXT ONLY --
    local optionsAboutFont = optionsPanel:CreateFontString("optionsAboutFont", "ARTWORK", "GameFontNormal")
    optionsAboutFont:SetText(
        'Bigshart\n\n' ..
        'Version: \124cffffffff' .. addonTbl.config.version .. '\124r\n\n'
    )
    optionsAboutFont:SetPoint('CENTER', optionsPanel, "CENTER", 0, 0)
    -- Website Link --
    -- MAKE THIS AN EDITBOX w/Copy Button --
    local optionsWebsiteButton = CreateFrame("BUTTON", "optionsWebsiteButton", optionsPanel, "UIPanelButtonTemplate")
    optionsWebsiteButton:SetSize(160, 33)
    optionsWebsiteButton:SetText(
        '\124cff3366ff' ..
        addonTbl.config.URL ..
        '\124r'
    )
    optionsWebsiteButton:SetPoint('CENTER', optionsPanel, "CENTER", 0, -34)

    --[[ Future Updates ]]
    -- Okay Function
      -- Save Options
    -- Default Function
      -- Reset Options
    InterfaceOptions_AddCategory(optionsPanel)
end


function _bootstrap(self, event, ...)
    --[[ On Load

    Registers App with ADDON_LOADED listener
    -----------------------------------]]

    -- Register ADDON_LOADED Event Listener --
    biglog('DEBUG', 'Registering to Loading Addons event')
    self:RegisterEvent("ADDON_LOADED")
    biglog('DEBUG', 'Registered to Loading Addons event')

    -- Register Slash Handlers --
    biglog('DEBUG', 'Creating Slash Handlers')
    SLASH_Bigshart1 = '/bigshart'
    SLASH_Bigshart2 = '/bs'
    SlashCmdList['Bigshart'] = function(msg, editBox)
        InterfaceOptionsFrame_OpenToCategory(addonName)
        InterfaceOptionsFrame_OpenToCategory(addonName)
    end
    biglog('DEBUG', 'Created Slash Handlers')

    -- Create Interface Options Context --
    addOptionsContext()
    biglog('DEBUG', 'Created Options Menu Context')
end


function _listener(self, event, ...)
    --[[ On Event
    
    Handler for events
    -----------------------------------]]
    if event == "ADDON_LOADED" and ... == "Bigshart" then
        -- Unregister ADDON_LOADED Event Listener --
        biglog('Delisting from Loading Addons event')
        self:UnregisterEvent("ADDON_LOADED")
        biglog('DEBUG', 'Delisted Loading Addons event')

        -- MAINFRAME!!! --
        -- hahahahaaha GET IT?! just kidding, fuck me.
        -- This is the Main App Frame --
        biglog('DEBUG', 'Building UI')
        biglog('DEBUG', 'Frame')
        self:SetWidth(128)
        self:SetHeight(64)
        self:SetPoint("TOP", "Minimap", "BOTTOM", -256, 0)
        self:Show()

        biglog('DEBUG', 'Texture')
        -- Texture --
        self.texture = self:CreateTexture(nil, "BACKGROUND")
        self.texture:SetAllPoints()
        self.texture:SetColorTexture(0, 0, 0, 0.40)

        -- This is a placeholder so i can see where the damn frame is --
        -- Just a Text Field --
        biglog('DEBUG', 'FontString')
        local FF = self:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        FF:SetText('BIGSHART')
        FF:SetPoint("CENTER", 0, 0)
        FF:Show()

        biglog('DEBUG', 'Done Building UI')
        biglog('INFO', 'Loaded')
    end
end