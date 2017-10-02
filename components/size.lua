-- init the component
local init = function(self, config)
  config = config or {}

  -- define the properties of the component
  self.width = config.width or 0
  self.height = config.height or 0

  return self
end

-- expose the component
local canDraw = {init = init}

-- constructor
local new = function()
  return setmetatable({}, {__index = canDraw})
end

return {new = new}
