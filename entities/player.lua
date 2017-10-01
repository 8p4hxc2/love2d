-- inheritance
local entity = require "base/entity"

-- alias
local physics = love.physics

-- require
local cClass = require "core/class"

-- init enemy
local init = function(self, config)
  self.path = {}
  self.tail = {}

  self.position = {x = 0, y = 0}
  self.size = {width = 32, height = 32}

  self:add("canDraw", {position = self.position, texture = "box"})
  self:add("canPhysic", {world = config, position = self.position, size = self.size, userData = self})

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
