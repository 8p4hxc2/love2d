-- inheritance
local entity = require "base/entity"

-- alias
local physics = love.physics

-- require
local cClass = require "core/class"

-- init enemy
local init = function(self, config)
  self.enn = true

  self:add("position", {x = 600, y = 400})
  self:add("size", {width = 32, height = 32})
  self:add("canPress")
  self:add("canDraw", {position = self.position, texture = "enemy"})
  self:add("canPhysic", {world = config, position = self.position, size = self.size})

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
