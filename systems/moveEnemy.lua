-- alias
local random = love.math.random

-- vars
local entities = {}
local blueprint = {"enn"}
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

-- move all the enemies
local update = function(dt)
  for key, enemy in pairs(entities) do
    local move = random(0, 50);

    if move < 40 then
      enemy.body:setAngularVelocity(random(200) * dt)
    end

    local angle = enemy.body:getAngle();
    enemy.body:setLinearVelocity(math.cos(angle) * 100, math.sin(angle) * 100)
  end
end

local draw = function()
end

return {update = update, draw = draw, register = register}
