# PajGuildHelper

This addon is designed to provide various helpful features for guild leaders/officers

## Commands

### /pgh dump

This command creates a text area with a list of all your members and a bunch of information about them separated by tabs.  
Just type the command, select all, copy, paste into Excel or Google Sheets and do whatever magic you want on it.  
Current fields included:

- Name
- Rank index (useful for sorting)
- Rank name
- Level
- Class
- Note
- Officers note
- Last online date
- Zone (positon of the player, or last known position of the player if they're logged off)

If you don't want one of those fields included in your dump, you can open up the main.lua file and just remove one of the lines in the PGHDump function. Just search for "Remove any line"

## Libraries

This addon uses [LibTextDump-1.0](https://www.wowace.com/projects/libtextdump-1-0) and [LibStub](https://www.wowace.com/projects/libstub)
