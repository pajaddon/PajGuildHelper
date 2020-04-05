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
    local interface = LibTextDump:New("Guild member dump(" .. numMembers .. " members")
    for i=1,numMembers do
        name, rank, rankIndex, level, class, _, note, officerNote = GetGuildRosterInfo(i)
        name = gsub(name, "%-[^|]+", "")
        interface:AddLine(name .. "\t" .. rankIndex .. "\t" .. rank .. "\t" .. level .. "\t" .. class .. "\t" .. note .. "\t" .. officerNote)
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
