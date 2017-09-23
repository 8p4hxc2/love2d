-- inheritance
local system = require "base/system"

-- alias
local random = love.math.random

-- init the system
local init = function(self)
  self.entities = {}
  self.blueprint = {"enn", "body"}
  self.total = table.getn(self.blueprint)

  return self
end

-- move all the enemies
local update = function(self, dt)
  for key, enemy in pairs(self.entities) do
    local move = random(0, 50);

    if move < 40 then
      enemy.body:setAngularVelocity(random(200) * dt)
    end

    local angle = enemy.body:getAngle();
    enemy.body:setLinearVelocity(math.cos(angle) * 100, math.sin(angle) * 100)
  end
end

-- exposed methods
local methods = {init = init, update = update}

-- constructor
local new = function()
  return setmetatable(methods, {__index = system})
end

return {new = new}
