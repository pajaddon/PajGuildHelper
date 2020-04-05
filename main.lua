local function DumpUsage()
    print(' /pgh dump - dump all users into a text window to copy')
end

local function Usage()
    print('PajGuildHelper usage:')
    print(' /pgh help - show this help message')
    DumpUsage()
end

local function PGHDump(commands, command_i)
    local LibTextDump = LibStub("LibTextDump-1.0")
    local numMembers = GetNumGuildMembers()
    local interface = LibTextDump:New("Guild member dump(" .. numMembers .. " members)")
    local currentTime = time()
    for i=1,numMembers do
        name, rankName, rankIndex, level, class, _, note, officerNote = GetGuildRosterInfo(i)
        name = gsub(name, "%-[^|]+", "")
        years, months, days, hours = GetGuildRosterLastOnline(i)
        years, months, days, hours = years and years or 0, months and months or 0, days and days or 0, hours and hours or 0
        local timeOfflineSeconds = ((((years*12)+months)*30.5+days)*24+hours)*3600
        local lastOnline = currentTime - timeOfflineSeconds
        local lastOnlineString = date("%Y-%m-%d", lastOnline)
        -- Remove any line starting with .. below to remove any of the fields
        interface:AddLine(name
            .. "\t" .. rankIndex
            .. "\t" .. rankName
            .. "\t" .. level
            .. "\t" .. class
            .. "\t" .. note
            .. "\t" .. officerNote
            .. "\t" .. lastOnlineString
        )
    end
    interface:Display()
end

local function PGHDebug(commands, command_i)
    --
end

local function PGH(msg, editbox)
    commands = split(msg, " ")
    command_i = 1

    if commands[command_i] == "dump" then
        PGHDump(commands, command_i + 1)
        return
    end

    if commands[command_i] == "debug" then
        PGHDebug(commands, command_i + 1)
        return
    end

    Usage()
end

SLASH_PGH1 = '/pgh'

SlashCmdList["PGH"] = PGH
