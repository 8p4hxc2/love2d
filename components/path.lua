-- init the component
local init = function(self, config)
  config = config or {}

  -- define the properties of the component
  self.path = {}

  return self
end

-- expose the component
local path = {init = init}

-- constructor
local new = function()
  return setmetatable({}, {__index = path})
end

return {new = new}
