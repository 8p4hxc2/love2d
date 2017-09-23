-- inheritance
local system = require "base/system"

-- alias
local random = love.math.random

-- require

-- init system
local init = function(self)
  self.entities = {}
  self.blueprint = {}
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
      entity.body:setPosition(random(500), random(500))
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
  local class = setmetatable({}, {__index = methods})
  setmetatable(methods, {__index = system})
  return class
end

return {new = new}
