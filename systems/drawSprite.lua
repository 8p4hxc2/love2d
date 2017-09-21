-- alias
local graphics = love.graphics

-- require
local cLoader = require("core/loader")

-- vars
local entities = {}
local blueprint = {"texture", "body"}
local total = table.getn(blueprint)

-- add entity to this system if the blueprint match
local register = function(entity)
  local match = 0

  for key, value in pairs(blueprint) do
    if entity[value] then
      match = match + 1
    end
  end

  if match == total then
    entities[#entities + 1] = entity
  end
end

local update = function(dt)
end

-- draw all simple sprites
local draw = function()
  for key, entity in pairs(entities) do
    graphics.draw(cLoader.get(entity.texture), entity.body:getX(), entity.body:getY())
  end
end

return {update = update, draw = draw, register = register}
