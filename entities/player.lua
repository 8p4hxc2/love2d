-- alias
local physics = love.physics

-- init player
local init = function(self, world)
  self.head = physics.newBody(world, 0, 0, "dynamic")
  self.shape = physics.newRectangleShape(32, 32)
  self.fixture = physics.newFixture(self.head, self.shape, 1)
  self.path = {}
  self.body = {}
  self.texture = "box"

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
