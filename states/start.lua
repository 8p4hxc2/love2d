-- alias
local graphics = love.graphics
local keyboard = love.keyboard

-- require core
local cState = require "core/state"

-- vars
local str = "BEGIN"

local init = function()
end

local destroy = function()
end

local play = function ()
end

local pause = function()
end

local update = function(dt)
  if keyboard.isDown("escape") then
    cState.back()
  end

  if keyboard.isDown("up") then
    str = "up"
  end

  if keyboard.isDown("down") then
    str = "down"
  end
end

local draw = function()
  graphics.print(str, 100, 100)
end

return {init = init, play = play, update = update, draw = draw, pause = pause, destroy = destroy}
