-- init the component
local init = function(self, config)
  config = config or {}
  self.position = config.position or {x = 0, y = 0} -- the position to draw
  self.texture = config.texture or '' -- the name of the texture asset to be displayed

  return self
end

-- expose the component
local canDraw = {init = init}

-- constructor
local new = function()
  return setmetatable({}, {__index = canDraw})
end

return {new = new}
