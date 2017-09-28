-- vars
local str = "omg"

-- alias
local graphics = love.graphics
local keyboard = love.keyboard

-- inheritance
local state = require "base/state"

-- require core
local cSystem = require("core/system")
local cClass = require("core/class")
local cState = require "core/state"

-- called one time at the creation of the state
local init = function(self)
  self.systems = cSystem.new():init()
  self.systems:add("drawStaticSprite")

  self.button=self.systems:registerEntity("button")
end

-- called one time at the destruction of the state
local destroy = function(self)
end

-- called when activating the state
local play = function (self)
end

-- called when leaving the state
local pause = function(self)
end

-- called everyframe to update the state
local update = function(self, dt)
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

-- called everyframe to draw the state
local draw = function(self)
  graphics.print(str, 100, 100)
end

-- exposed methods
local methods = {
  init = init,
  play = play,
  update = update,
  draw = draw,
  pause = pause,
  destroy = destroy
}

-- constructor
local new = function()
  return cClass.inherit(methods, state)
end

return {new = new}
