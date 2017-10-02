-- inheritance
local entity = require "base/entity"

-- alias

-- require
local cClass = require "core/class"

-- init enemy
local init = function(self, world)
  self:add("transform", {x = 0, y = 0})
  self:add("canPress")
  self:add("canDraw", {texture = "castle"})

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
