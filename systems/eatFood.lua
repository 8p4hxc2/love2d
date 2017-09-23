-- alias
local random = love.math.random

local addBody = function(snake)
  local position = {};
  position.x = snake.head:getX()
  position.y = snake.head:getY()

  table.insert(snake.body, position)

  for i = 1, 6 do
    table.insert(snake.path, position)
  end
end

local process = function(food, snake)
  if food.eated then
    food.eated = false
    food.body:setPosition(random(500), random(500))
    addBody(snake)
  end
end

return {process = process}
