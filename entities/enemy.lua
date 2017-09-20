-- alias
local physics = love.physics

-- init enemy
local init = function(self, world)
  self.body = physics.newBody(world, 150, 150, "dynamic")
  self.shape = physics.newRectangleShape(32, 32)
  self.fixture = physics.newFixture(self.body, self.shape, 1)
  self.path = {}
  self.texture = "enemy"
  
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
