-- alias
local physics = love.physics

-- init player
local init = function(self, world, x, y)
  self.body = physics.newBody(world, x or 0, y or 0, "dynamic")
  self.shape = physics.newRectangleShape(32, 32)
  self.fixture = physics.newFixture(self.body, self.shape, 1)
  self.path = {}
  self.tail = {}
  self.texture = "box"

  self.fixture:setUserData(self)

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
