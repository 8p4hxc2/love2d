-- alias
local graphics = love.graphics

-- require
local cLoader = require "core/loader"

-- draw the player
local process = function(player)
  graphics.draw(cLoader.get(player.texture), player.head:getX(), player.head:getY())

  for i = 1, table.getn(player.body) do
    graphics.draw(cLoader.get(player.texture), player.body[i].x, player.body[i].y)
  end
end

return {process = process}
