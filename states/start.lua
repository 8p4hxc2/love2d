-- alias
local graphics = love.graphics
local keyboard = love.keyboard

-- inheritance
local state = require "base/state"

-- require core
local cSystem = require("core/system")
local cClass = require("core/class")


-- called one time at the creation of the state
local init = function(self)
  self.systems = cSystem.new():init()
end

-- called one time at the destruction of the state
local destroy = function(self)
end

-- called when activating the state
local play = function (self)
  self.paused = false
end

-- called when leaving the state
local pause = function(self)
  self.paused = true
end

-- called everyframe to update the state
local update = function(self, dt)
  if(not self.paused) then
    self.systems:update(dt)
  end
end

-- called everyframe to draw the state
local draw = function(self)
  self.systems:draw()
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
