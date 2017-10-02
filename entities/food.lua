-- inheritance
local entity = require "base/entity"

-- alias
local physics = love.physics

-- require
local cClass = require "core/class"

-- init enemy
local init = function(self, config)
  self.enn = true

  self:add("transform", {x = 700, y = 50, width = 32, height = 32})
  self:add("canPress")
  self:add("canDraw", {position = self.position, texture = "food"})
  self:add("canPhysic", {world = config, transform = self.transform, type = "static", userData = self})

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
