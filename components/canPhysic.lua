-- alias
local physics = love.physics

-- init the component
local init = function(self, config)
  config = config or {}

  -- define the properties of the component
  if(not config.world) then
    error("missing world for physic component")
  end

  self.body = physics.newBody(config.world, config.transform.x or 0, config.transform.y or 0, config.type or "dynamic")

  if(config.transform.width) then
    self.shape = physics.newRectangleShape(config.transform.width, config.transform.height)
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
