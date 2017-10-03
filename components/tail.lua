-- init the component
local init = function(self, config)
  config = config or {}

  -- define the properties of the component
  self.tail = {}

  return self
end

-- expose the component
local tail = {init = init}

-- constructor
local new = function()
  return setmetatable({}, {__index = tail})
end

return {new = new}
