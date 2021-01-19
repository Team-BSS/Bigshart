local addonName, addonTbl = ...


local logLevels = {}
logLevels.ERROR = 10
logLevels.WARNING = 20
logLevels.INFO = 30
logLevels.DEBUG = 40

function biglog(level, msg)
    if level == 'WARNING' then
        if logLevels[addonTbl.config.logs.level] >= logLevels.WARNING then
            print(
                addonTbl.config.logs.warning ..
                msg
            )
        end
    end
    if level == 'DEBUG' then
        if logLevels[addonTbl.config.logs.level] >= logLevels.DEBUG then
            print(
                addonTbl.config.logs.debug ..
                msg
            )
        end
    end
    if level == 'ERROR' then
        if logLevels[addonTbl.config.logs.level] >= logLevels.ERROR then
            print(
                addonTbl.config.logs.error ..
                msg
            )
        end
    end
    if level == 'INFO' then
        if logLevels[addonTbl.config.logs.level] >= logLevels.INFO then
            print(
                addonTbl.config.logs.info ..
                msg
            )
        end
    end
end