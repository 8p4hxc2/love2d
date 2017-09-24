-- inheritance
local system = require "base/system"

-- alias
local random = love.math.random

-- require
local cClass = require "core/class"

-- init system
local init = function(self)
  self.entities = {}
  self.blueprint = {"enn", "body"}
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
    local move = random(0, 50);

    if move < 40 then
      entity.body:setAngularVelocity(random(200) * dt)
    end

    local angle = entity.body:getAngle();
    entity.body:setLinearVelocity(math.cos(angle) * 100, math.sin(angle) * 100)
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
