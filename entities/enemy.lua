-- inheritance
local entity = require "base/entity"

-- alias
local physics = love.physics

-- require
local cClass = require "core/class"

-- init enemy
local init =
  function(self, config)
  self.enn = true

  self:add("transform", {x = 100, y = 300, width = 200, height = 200})
  self:add("canPress")
  --  self:add("spriteRenderer", {texture = "sorcererVillain"})

  self:add(
    "animatedSprite",
    {frameWidth = 200, frameHeight = 200, sheetWidth = 2000, sheetHeight = 200, frameCount = 10, frameDuration = 0.1}
  )
  self:add("rigidBody", {entity = self, world = config})

  return self
end

-- exposed methods
local methods = {
  init = init
}

-- constructor
local new = function()
  local class = setmetatable({}, {__index = methods})
  setmetatable(methods, {__index = entity})
  return class
end

return {new = new}
