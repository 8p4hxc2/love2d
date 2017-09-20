-- alias
local physics = love.physics

-- init food
local init = function(self, world)
  self.body = physics.newBody(world, 200, 200, "static")
  self.shape = physics.newRectangleShape(32, 32)
  self.fixture = physics.newFixture(self.body, self.shape, 1)
  self.fixture:setUserData(self)
  self.texture = "food"

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
