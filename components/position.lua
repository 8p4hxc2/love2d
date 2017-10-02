-- init the component
local init = function(self, config)
  config = config or {}

  -- define the properties of the component
  self.x = config.x or 0
  self.y = config.y or 0

  return self
end

-- expose the component
local canDraw = {init = init}

-- constructor
local new = function()
  return setmetatable({}, {__index = canDraw})
end

return {new = new}
