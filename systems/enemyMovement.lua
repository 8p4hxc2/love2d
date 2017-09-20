local random = love.math.random

-- move all the enemies
local process = function(enemy, dt)
  local move = random(0, 50);

  if move < 40 then
    enemy.body:setAngularVelocity(random(200) * dt)
  end

  local angle = enemy.body:getAngle();
  enemy.body:setLinearVelocity(math.cos(angle) * 100, math.sin(angle) * 100)
end

return {process = process}
