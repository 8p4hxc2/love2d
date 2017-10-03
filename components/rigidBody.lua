-- alias
local physics = love.physics

-- init the component
local init = function(self, config)
  config = config or {}

  local entity = config.entity

  -- check mandatory config
  --assert((config.world == nil), 'missing world for rigidBody component')

  -- define the properties of the component
  self.body = physics.newBody(config.world, entity.transform.x or 0, entity.transform.y or 0, config.type or "dynamic")

  return self
end

-- expose the component
local rigidBody = {init = init}

-- constructor
local new = function()
  return setmetatable({}, {__index = rigidBody})
end

return {new = new}
