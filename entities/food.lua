-- inheritance
local entity = require "base/entity"

-- alias
local physics = love.physics

-- require
local cClass = require "core/class"

-- init enemy
local init = function(self, config)
  self.enn = true

  self:add("position", {x = 700, y = 50})
  self:add("size", {width = 32, height = 32})
  self:add("canPress")
  self:add("canDraw", {position = self.position, texture = "food"})
  self:add("canPhysic", {world = config, position = self.position, size = self.size, type = "static", userData = self})

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
