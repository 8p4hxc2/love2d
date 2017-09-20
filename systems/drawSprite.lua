-- alias
local graphics = love.graphics

-- require
local cLoader = require("core/loader")

-- draw all simple sprites
local process = function(sprite)
  graphics.draw(cLoader.get(sprite.texture), sprite.body:getX(), sprite.body:getY())
end

return {process = process}
