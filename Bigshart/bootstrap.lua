local addonName, addonTbl = ...

addonTbl.config = {}
addonTbl.config.appColor = "cff8533ff"
addonTbl.config.options = {}
addonTbl.config.options.enabled = true
addonTbl.config.version = "1.2.1"
addonTbl.config.logs = {}
addonTbl.config.logs.info = "\124cff8533ffBigshart\124r: "
addonTbl.config.logs.warning = "\124cffff9933Bigshart\124r: "
addonTbl.config.logs.error = "\124cffff0000Bigshart\124r: "
addonTbl.config.URL = "https://bigshart.com/"

local function slashHandler(msg, editBox)
    --[[ Slash Handler

    All slash commands open the options panel
    -----------------------------------]]
    InterfaceOptionsFrame_OpenToCategory(addonName)
    InterfaceOptionsFrame_OpenToCategory(addonName)
end


local function addOptionsContext()
    --[[ Add Options Context
    
    Creates a context in the Interface Options Menu
    -----------------------------------]]
    print(
        addonTbl.config.logs.info ..
        'Creating Options Menu Context'
    )
    
    -- [[ Options Panel ]]
    local optionsPanel = CreateFrame("FRAME")
    optionsPanel.name = addonName
    print(optionsPanel.name)
    -- [[ About - General Text ]]
    local optionsAboutFont = optionsPanel:CreateFontString("optionsAboutFont", "ARTWORK", "GameFontNormal")
    optionsAboutFont:SetText(
        'Bigshart\n\n' ..
        'Version: \124cffffffff' .. addonTbl.config.version .. '\124r\n\n'
    )
    optionsAboutFont:SetPoint('CENTER', optionsPanel, "CENTER", 0, 0)
    -- [[ About - Website Button ]]
    -- Disclaimer: Can't launch browser windows from addons, boo
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
    -- InterfaceOptions_AddCategory(optionsChildPanel)
end


function Bigshart_Bootstrap(self, event, ...)
    --[[ On Load

    Registers App with ADDON_LOADED listener
    -----------------------------------]]

    -- Register Even Listener
    print(
        addonTbl.config.logs.info ..
        'Registering to Loading Addons event'
    )
    self:RegisterEvent("ADDON_LOADED")
    print(
        addonTbl.config.logs.info ..
        'Registered to Loading Addons event'
    )

    -- Slash Handlers
    print(
        addonTbl.config.logs.info ..
        'Creating Slash Handlers'
    )
    SLASH_Bigshart1 = '/bigshart'
    SLASH_Bigshart2 = '/bs'
    SlashCmdList['Bigshart'] = slashHandler
    print(
        addonTbl.config.logs.info ..
        'Created Slash Handlers'
    )

    -- Create Interface Options Context
    addOptionsContext()
    print(
        addonTbl.config.logs.info ..
        'Created Options Menu Context'
    )
end


function Bigshart_Listener(self, event, ...)
    --[[ On Event
    
    Handler for events
    -----------------------------------]]
    if event == "ADDON_LOADED" and ... == "Bigshart" then
        print(
            addonTbl.config.logs.info ..
            'Delisting from Loading Addons event'
        )
        self:UnregisterEvent("ADDON_LOADED")
        print(
            addonTbl.config.logs.info ..
            'Delisted Loading Addons event'
        )
        -- UI (doesn't work yet)
        print(
            addonTbl.config.logs.error ..
            'Building UI'
        )
        Bigshart:SetSize(100,50)
        Bigshart:SetPoint("BOTTOM", "Minimap", "CENTER", -50, -5)
        print(
            addonTbl.config.logs.error ..
            'Created Frame.'
        )
        local BigshartFont = Bigshart:CreateFontString("BigshartFontString", "ARTWORK", "GameFontNormal")
        -- BigshartFont:SetPoint("CENTER", Bigshart, "CENTER", 0, 0)
        BigshartFont:SetText("BIGSHART")
        print(
            addonTbl.config.logs.error ..
            'Created Label.'
        )
        BigshartFont:Show()
        Bigshart:Show()
        print(
            addonTbl.config.logs.error ..
            'Showed Frame & Label.'
        )
        print(
            addonTbl.config.logs.info ..
            'Loaded.'
        )
        print(Bigshart.name)
    end
end