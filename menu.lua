local helper=require'extensions.helper' --load extensions
local gui=require'extensions.gui' --load gui module

local menu={}
menu.exit={load=function(self)
    savefile=love.filesystem.newFile("fat_cash_stacks.BANK")
end,
update=function(self)
end,
draw=function(self)
end}