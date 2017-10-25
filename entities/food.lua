-- inheritance
local entity = require "base/entity"

-- alias
local physics = love.physics

-- require
local cClass = require "core/class"

-- init enemy
local init = function(self, config)
  self:add("transform", {x = 1000 + love.math.random(500), y = 2800 - love.math.random(500), width = 32, height = 32})
  self:add("canPress")
  self:add("spriteRenderer", {texture = "food"})
  self:add("rigidBody", {entity = self, world = config})--, type = "static"})
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
