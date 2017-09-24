-- alias
local physics = love.physics

-- require
local cClass = require "core/class"

-- init enemy
local init = function(self, world)
  self.position = {x = -600, y = -600}
  self.texture = "background"

  return self
end

-- exposed methods
local methods = {
  init = init
}

-- constructor
local new = function()
  return cClass.new(methods)
end

return {new = new}
