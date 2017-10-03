local init = function(self, config)
  config = config or {}
  self.pressed = config.pressed or false -- is the entity pressed
  self.alreadyPressed = config.alreadyPressed or false -- has the entity already been pressed
  self.offsetV = config.offsetV or 4 -- offset to move the entity up/down
  self.offTexture = config.offTexture
  self.onTexture = config.onTexture

  return self
end

local canPress = {
  init = init
}

-- constructor
local new = function()
  return setmetatable({}, {__index = canPress})
end

return {new = new}
