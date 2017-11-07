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
  self.blueprint = {"spriteRenderer", "transform"}
  return self
end

-- draw all simple sprites
local draw = function(self)
  for key, entity in pairs(self.entities) do
    if(entity.quad) then
      graphics.draw(cLoader.get("seasons_tiles"), entity.quad, entity.transform.x, entity.transform.y)
    else
      graphics.draw(cLoader.get(entity.spriteRenderer.texture), entity.transform.x, entity.transform.y)
    end
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
