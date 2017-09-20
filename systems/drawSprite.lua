-- alias
local graphics = love.graphics

-- require
local cLoader = require("core/loader")

-- vars
local entities = {}
local blueprint = {"sprite", "physic"}

-- add entity to this system if the blueprint match
local register = function(entity)

end

-- draw all simple sprites
local process = function(sprite)
  graphics.draw(cLoader.get(sprite.texture), sprite.body:getX(), sprite.body:getY())
end

return {process = process}
