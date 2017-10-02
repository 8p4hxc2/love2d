-- inheritance
local entity = require "base/entity"

-- alias
local physics = love.physics

-- require
local cClass = require "core/class"

-- init enemy
local init = function(self, config)
  self:add("canPress")
  self:add("position", {x = 600, y = 100})
  self:add("canDraw", {texture = "blue_button11"})

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
