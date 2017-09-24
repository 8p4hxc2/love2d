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
  self.blueprint = {"texture", "body"}
  return self
end

-- draw all simple sprites
local draw = function(self)
  for key, entity in pairs(self.entities) do
    graphics.draw(cLoader.get(entity.texture), entity.body:getX(), entity.body:getY())
  end
end

-- exposed methods
local methods = {
  init = init,
  draw = draw
}

-- constructor
local new = function()
  return cClass.inherit(methods, system)
end

return {new = new}
