-- alias
local physics = love.physics
local random = love.math.random

-- init enemy
local init = function(self, world)
  self.body = physics.newBody(world, random(500), random(500), "dynamic")
  self.shape = physics.newRectangleShape(32, 32)
  self.fixture = physics.newFixture(self.body, self.shape, 1)
  self.path = {}
  self.texture = "enemy"
  self.enn = true

  return self
end

-- exposed methods
local methods = {
  init = init
}

-- constructor
local new = function()
  return setmetatable({}, {__index = methods})
end

return {new = new}
