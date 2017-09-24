-- inheritance
local system = require "base/system"

-- alias

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
  end
end

-- update the system
local update = function(self, dt)
  for key, entity in pairs(self.entities) do
    if entity.eating then
      entity.eating = false
      local position = {};
      position.x = entity.body:getX()
      position.y = entity.body:getY()

      table.insert(entity.tail, position)

      for i = 1, 6 do
        table.insert(entity.path, position)
      end
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
