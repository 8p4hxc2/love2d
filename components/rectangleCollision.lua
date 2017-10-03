-- alias
local physics = love.physics

-- init the component
local init = function(self, config)
  config = config or {}

  local entity = config.entity

  -- check mandatory config
  assert(type(entity) == 'table', 'missing entity for collision component')

  -- define the properties of the component
  self.shape = physics.newRectangleShape(entity.transform.width, entity.transform.height)
  self.fixture = physics.newFixture(entity.rigidBody.body, self.shape, 1)
  self.fixture:setUserData(entity)

  return self
end

-- expose the component
local rectangleCollision = {init = init}

-- constructor
local new = function()
  return setmetatable({}, {__index = rectangleCollision})
end

return {new = new}
