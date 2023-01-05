--##gui module##--
local gui={}

--create a new button
function gui.addButton(px,py,sw,sh,onpress,text,textcol) --pos, size, function to excec when button is clicked
    local txt=text or""
    local txtcol=textcol or{0,0,0}
    local btn={
        p={x=px,y=py},
        s={w=sw,h=sh},
        pressed=onpress,
        onmouse=function(self,x,y)                     
            if(x>self.p.x and x<self.p.x+self.s.w
            and y>self.p.y and y<self.p.y+self.s.h)then
                self:pressed()
            end
        end,
        update=function(self)
            return
        end,
        draw=function(self)
            love.graphics.rectangle("fill",self.p.x,self.p.y,self.s.w,self.s.h)
            gui.write(txt,px+(sw/4),py+(sh/4),txtcol)
        end
    }
    
    return btn --returns button object, should/have to add to world table
end

--create a new toggle
function gui.addToggle(px,py,sw,sh,colors) --pos, size, value to set on toggle, colors for t/f coloring toggle. structured so [1] are t [2] f {{a,b,c},{d,e,f}}
    local cols=colors or {{1,0,0},{0,0,1}}
    local tgl={
        p={x=px,y=py}, --should totally be handling pos and size as vectors initially but whatevs consistancy > good code 
        s={w=sw,h=sh},
        val=true,
        onmouse=function(self,x,y)                     
            if(x>self.p.x and x<self.p.x+self.s.w
            and y>self.p.y and y<self.p.y+self.s.h)then
                if(self.val)then
                    self.val=false
                else
                    self.val=true
                end
            end 
        end,
        update=function(self)
            return
        end,
        draw=function(self)
            if(self.val)then 
                love.graphics.setColor(cols[1]) 
            else 
                love.graphics.setColor(cols[2])
            end
            love.graphics.rectangle("line",self.p.x,self.p.y,self.s.w,self.s.h)
            love.graphics.setColor(1,1,1)
        end
    }
    return tgl
end

--add an option picker thing
function gui.addOptionPicker(px,py,options)
    local op={
        p={x=px,y=py},
        opt=options,
        selected=1,
        onmouse=function(self,x,y)

            --made it only one scroll thing for now becuase tiop one sitn working :((( drawing commented too
            --try and come back and fix it. not super priority because it does work

            --[[if(x>self.p.x+25 and x<self.p.x+75
            and y>self.p.y-25 and y<self.p.y-50)then
                if(self.selected<#self.opt)then
                    self.selected=self.selected+1 
                else 
                    self.selected=1 
                end
            else--]]if(x>self.p.x+25 and x<self.p.x+75
            and y>self.p.y+25 and y<self.p.y+50)then
                if(self.selected>1)then
                    self.selected=self.selected-1 
                else 
                    self.selected=#self.opt
                end
            end
        end,
        update=function(self) return end,
        draw=function(self)
            --love.graphics.polygon("fill",self.p.x+25,self.p.y-25,self.p.x+50,self.p.y-50,self.p.x+75,self.p.y-25) --mode,p1,p2,p3
            gui.write(self.opt[self.selected],self.p.x,self.p.y,{0.5,0.75,1})
            love.graphics.polygon("fill",self.p.x+25,self.p.y+25,self.p.x+50,self.p.y+50,self.p.x+75,self.p.y+25)
        end
    }
    return op
end

--print with colors
function gui.write(text,px,py,color)
    local x,y,col=px or 0,py or 0,color or {1,0.25,0.75} --offset possible nils (if they dont imput text they deserve an error)

    love.graphics.setColor(col)
    love.graphics.print(text,x,y)
    love.graphics.setColor(1,1,1)
end

return gui