-- inheritance
local entity = require "base/entity"

-- alias
local physics = love.physics
local graphics = love.graphics

-- require
local cClass = require "core/class"

-- init enemy
local init = function(self, config)
  self.enn = true

  self:add("transform", {x = 100, y = 300, width = 200, height = 200})
  self:add("canPress")
  --  self:add("spriteRenderer", {texture = "sorcererVillain"})

  local frames = {}

  for i = 1, 10 do
    frames[#frames + 1] = graphics.newQuad((i - 1) * 200, 0, 200, 200, 2000, 200)
  end
  self:add("animatedSprite", {frames = frames})
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
