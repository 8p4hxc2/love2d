-- inheritance
local system = require "base/system"

-- alias
local graphics = love.graphics

-- require
local cClass = require "core/class"
local cLoader = require "core/loader"

-- init system
local init = function(self)
  self.entities = {}
  self.blueprint = {"map"}

  return self
end

-- draw the system
local draw = function(self)
  for key, entity in pairs(self.entities) do
    for x = 1, 10 do
      for y = 1, 10 do
        graphics.draw(cLoader.get(entity.map.properties.tilesets[1].name), entity.map.quads[x][y], x * entity.map.properties.tilesets[1].tilewidth, y * entity.map.properties.tilesets[1].tileheight)
      end
    end
  end
end

-- update the system
local update = function(self, dt)
  for key, entity in pairs(self.entities) do
    if(not entity.created) then
      local map = entity.map.properties

      entity.created = true

      for x = 1, 10 do
        entity.map.quads[x] = {}
        for y = 1, 10 do
          entity.map.quads[x][y] =
          graphics.newQuad(
            (map.layers[1].data[x + (y - 1) * 10] - 1) * map.tilesets[1].tilewidth,
            0,
            map.tilesets[1].tilewidth,
            map.tilesets[1].tileheight,
            map.tilesets[1].imagewidth,
            map.tilesets[1].imageheight
          )
        end
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
