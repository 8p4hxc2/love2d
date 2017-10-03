-- inheritance
local entity = require "base/entity"

-- alias
local physics = love.physics

-- require
local cClass = require "core/class"

-- init enemy
local init = function(self, config)
  self.path = {}

  self:add("tail")
  self:add("transform", {x = 0, y = 0, width = 32, height = 32})
  self:add("spriteRenderer", {texture = "box"})
  self:add("rigidBody", {entity = self, world = config})
  self:add("rectangleCollision", {entity = self})

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
