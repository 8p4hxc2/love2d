-- init the component
local init = function(self, config)
  config = config or {}

  self.texture = config.texture or '' -- the name of the texture asset to be displayed

  return self
end

-- expose the component
local spriteRenderer = {init = init}

-- constructor
local new = function()
  return setmetatable({}, {__index = spriteRenderer})
end

return {new = new}
