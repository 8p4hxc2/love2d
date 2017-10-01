-- alias
local physics = love.physics

-- init the component
local init = function(self, config)
  config = config or {}

  -- define the properties of the component
  if(not config.world) then
    error("missing world for physic component")
  end

  self.body = physics.newBody(config.world, config.position.x or 0, config.position.y or 0, config.type or "dynamic")

  if(config.size) then
    self.shape = physics.newRectangleShape(config.size.width, config.size.height)
    self.fixture = physics.newFixture(self.body, self.shape, 1)
  end

  if(config.userData) then
    self.fixture:setUserData(config.userData)
  end

  return self
end

-- expose the component
local canDraw = {init = init}

-- constructor
local new = function()
  return setmetatable({}, {__index = canDraw})
end

return {new = new}
