-- inheritance
local system = require "base/system"

-- alias
local graphics = love.graphics

-- require
local cLoader = require "core/loader"
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
    for i = 1, table.getn(entity.tail) do
      graphics.draw(cLoader.get(entity.texture), entity.tail[i].x, entity.tail[i].y)
    end
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
