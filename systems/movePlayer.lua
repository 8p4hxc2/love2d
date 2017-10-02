-- inheritance
local system = require "base/system"

-- alias
local random = love.math.random
local keyboard = love.keyboard

-- require
local cClass = require "core/class"

-- init system
local init = function(self)
  self.entities = {}
  self.blueprint = {"tail"}
  return self
end

-- draw the system
local draw = function(self)
  for key, entity in pairs(self.entities) do
  end
end

-- update the system
local update = function(self, dt)
  local angularVelocity = 0

  if keyboard.isDown("right") then
    angularVelocity = 200
  end

  if keyboard.isDown("left") then
    angularVelocity = -200
  end

  for key, entity in pairs(self.entities) do
    local angle = entity.canPhysic.body:getAngle();
    entity.canPhysic.body:setAngularVelocity(angularVelocity * dt)
    entity.canPhysic.body:setLinearVelocity(math.cos(angle) * 200, math.sin(angle) * 200)


    if (#entity.path > 0) then
      table.remove(entity.path)
      local position = {}
      position.x = entity.canPhysic.body:getX()
      position.y = entity.canPhysic.body:getY()
      table.insert(entity.path, 1, position)

      for i = 1, #entity.tail do
        entity.tail[i].x = entity.path[i * 6].x
        entity.tail[i].y = entity.path[i * 6].y
      end
    end

    entity.transform.x = entity.canPhysic.body:getX()
    entity.transform.y = entity.canPhysic.body:getY()
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
