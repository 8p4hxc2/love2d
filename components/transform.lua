-- init the component
local init = function(self, config)
  config = config or {}

  -- define the properties of the component
  self.x = config.x or 0
  self.y = config.y or 0
  self.width = config.width or 0
  self.height = config.height or 0
  self.angle = config.angle or 0

  return self
end

-- expose the component
local transform = {init = init}

-- constructor
local new = function()
  return setmetatable({}, {__index = transform})
end

return {new = new}
