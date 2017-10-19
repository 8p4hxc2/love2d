-- alias
local graphics = love.graphics

-- init the component
local init = function(self, config)
  config = config or {}

  -- define the properties of the component
  self.frames = config.frames or {}

  for i = 1, config.frameCount do
    self.frames[#self.frames + 1] = graphics.newQuad((i - 1) * config.frameWidth, 0, config.frameWidth, config.frameHeight, config.sheetWidth, config.sheetHeight)
  end

  self.currentFrame = config.currentFrame or 1
  self.frameDuration = config.frameDuration or 0.1
  self.lastUpdate = 0

  return self
end

-- expose the component
local animatedSprite = {init = init}

-- constructor
local new = function()
  return setmetatable({}, {__index = animatedSprite})
end

return {new = new}
