--##home screen##--
local gui=require'extensions.gui' --loading gui module
local helper=require'extensions.helper' --loading extensions

local home={}
home.screen={
    load=function(self)
        --#globals#--
        called=false --true heads, false tails
        bet=0 --gui determined cash variable
        cash,hasadded=100,false --cash variables

        --creating coin, this will have more meaning when we have graphics/audio
        coin={
            pos={x=400,y=400},
            flip=false,
            text="flip me!",
            update=function(self)
                if(self.flip and cash>0)then
                    hasadded=false
                    choices={"heads","tails"}
                    result=choices[math.random(#choices)]
                    self.text=result
                    self.flip=false
                end
            end,
            draw=function(self)
                gui.write(self.text,400,200,{0.5,1,0.75})
            end
        }

        --creating gui elements ("shii" -ariana grande)
        guiobj={}
        table.insert(guiobj,gui.addButton(370,195,100,30,
        function(self)
            if(not coin.flip)then
            coin.flip=true end
        end,
        "flip coin",{1,0,1},false))

        table.insert(guiobj, gui.addToggle(375,400,25,25,{{1,0,0},{0,0,1}},{"call it heads","call it tails"}))
        table.insert(guiobj,gui.addOptionPicker(350,300,{5,10,25,50,"all in"}))

        table.insert(guiobj,gui.addButton(10,570,75,20,
        function(self)
            love.event.quit() --add saving here. likely wont end up needing s&q menu cause im just that cool dunno what ill do about mobile tho
        end,
        "exit",{0,0,1}))
    end,
    update=function(self)
        --gui 
        --gui object variable assignments
        called=guiobj[2].val --haha yikes am i right choose ur toggle and assign your bool to that (worst handling of toggles ever)
        bet=guiobj[3].opt[guiobj[3].selected] --more horrific gui implementation for option  picker
        if(guiobj[3].opt[guiobj[3].selected]=="all in")then bet=cash end --selectign bet asmount finfish yayayyy

        function love.mousepressed(x, y, button, istouch)
            if(button==1)then
                for i=1,#guiobj do
                    guiobj[i]:onmouse(x,y) --if u have gui obj added to the list that doesnt need onmouse just have one with return (onmouse=function(self,x,y)return end)
                end
            end
        end

        coin:update()

        --make sure to utilize save files to keep money otherwise its worthless
        --ask ostrich about balancing ideas?
        if( ((called and coin.text=="heads")and not hasadded) or ((not called and coin.text=="tails")and not hasadded))then --smallest todo, make hasadded not redundant lol
            cash=cash+bet hasadded=true
        elseif( ((called and coin.text=="tails")and not hasadded) or ((not called and coin.text=="heads")and not hasadded))then
            cash=cash-bet hasadded=true end
    end,
    draw=function(self)                
        for i=1,#guiobj do
            guiobj[i]:draw()end

        gui.write(cash,10,10)

        coin:draw()
    end
}
return home
