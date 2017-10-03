-- init the component
local init = function(self, config)
  config = config or {}

  -- define the properties of the component
  self.frames = config.frames or {}

  return self
end

-- expose the component
local animatedSprite = {init = init}

-- constructor
local new = function()
  return setmetatable({}, {__index = animatedSprite})
end

return {new = new}
