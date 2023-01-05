--##extensions module##--
local helper={} 

--find index of given element in table
function helper.findIndex(table,val)
    for i=1,#table do 
        if(table[i]==val)then
            return i
        end 
    end
end

--returns if table contains given element (this feels redundant idk if it even works)
function helper.hasIndex(table,val)
    for i=1,#table do 
        if(table[i]==val)then
            return true
        end
    end
end

return helper