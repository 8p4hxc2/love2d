-- inheritance
local system = require "base/system"

-- alias
local random = love.math.random

-- require
local cClass = require "core/class"

-- init system
local init = function(self)
  self.entities = {}
  self.blueprint = {"rigidBody"}
  return self
end

-- draw the system
local draw = function(self)
  for key, entity in pairs(self.entities) do
  end
end

-- update the system
local update = function(self, dt)
  for key, entity in pairs(self.entities) do
    if entity.eated then
      entity.eated = false
      entity.rigidBody.body:setPosition(random(500), random(500))
      entity.transform.x = entity.rigidBody.body:getX()
      entity.transform.y = entity.rigidBody.body:getY()
    end
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
