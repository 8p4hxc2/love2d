-- alias
local random = love.math.random
local keyboard = love.keyboard

-- move the player
local process = function(player, dt)
  local angularVelocity = 0

  if keyboard.isDown("right") then
    angularVelocity = 200
  end

  if keyboard.isDown("left") then
    angularVelocity = -200
  end

  local angle = player.head:getAngle();
  player.head:setAngularVelocity(angularVelocity * dt)
  player.head:setLinearVelocity(math.cos(angle) * 200, math.sin(angle) * 200)


  if (table.getn(player.path) > 0) then
    table.remove(player.path)
    local position = {}
    position.x = player.head:getX()
    position.y = player.head:getY()
    table.insert(player.path, 1, position)

    for i = 1, table.getn(player.body) do
      player.body[i].x = player.path[i * 6].x
      player.body[i].y = player.path[i * 6].y
    end
  end
end

return {process = process}
