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

--rounds positive number to nearest postitive int (TODO: account for negative lmao)
function helper.round(n)
    if(n-math.floor(n)>0.5)then return math.floor(n)+1 
    else return math.floor(n)end
end

--random float :0 
function helper.randomFloat(min, max, precision)
	local precision = precision or 0
	local num = math.random()
	local range = math.abs(max - min)
	local offset = range * num
	local randomnum = min + offset
	return math.floor(randomnum * math.pow(10, precision) + 0.5) / math.pow(10, precision)
end

return helper
