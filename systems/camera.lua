-- inheritance
local system = require "base/system"

-- alias
local graphics = love.graphics

-- require
local cClass = require "core/class"

-- init system
local init = function(self)
  self.entities = {}
  self.blueprint = {"tail"}
  return self
end

-- draw the system
local draw = function(self)
  for key, entity in pairs(self.entities) do
    --graphics.translate(-entity.body:getX() + 400, - entity.body:getY() + 300)
  end
end

-- update the system
local update = function(self, dt)
  for key, entity in pairs(self.entities) do
  end
end

-- exposed methods
local methods = {
  init = init,
  update = update,
  draw = draw
}

-- constructor
local new = function()
  return cClass.inherit(methods, system)
end

return {new = new}
