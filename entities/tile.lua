-- inheritance
local entity = require "base/entity"

-- alias
local graphics = love.graphics

-- require
local cClass = require "core/class"

-- init enemy
local init = function(self, config)
  -- adding components
  self:add("transform", {x = 0, y = 0, width = 128, height = 64})
  self:add("spriteRenderer", {texture = "box"})
  self.quad = graphics.newQuad(0, 0, 128, 64, 1024, 768)

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
