--##call it##--

local home=require'screens.home' --load home screen
local menu=require'screens.menu' --load menus (may end up not having any menus? idk how im gonna do this tbh)
--main argument for screens is for when i (fingers crossed) add more things to gamble on

function love.load()
    --###INIT BIG IMPORTANT VARAIBELS###--
    world={} --what goes to screen, calls its contents update/draw, add or delete screen tables to switch scenes
    h=home.screen --home screen, written in home.lua, holds all data (update/draw) for this scene
    e=menu.exit --exit menu

    --###add to tables###--
    table.insert(world,1,h) --begin on home screen. specify index as 1 as thats the index we'll call

    world[1]:load()
end

function love.update(dt)
    --love.timer.sleep(1/60)
    world[1]:update()end

function love.draw()
    love.timer.sleep(1/60)
    world[1]:draw()end
