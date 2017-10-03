-- inheritance
local system = require "base/system"

-- alias
local graphics = love.graphics

local frame = 1;
local frameDuration = 1
-- require
local cLoader = require "core/loader"
local cClass = require "core/class"

-- init system
local init = function(self)
  self.entities = {}
  self.blueprint = {"transform", "animatedSprite"}
  return self
end

-- draw all simple sprites
local draw = function(self)
  frameDuration = frameDuration + 1

  if(frameDuration > 10) then
    frameDuration = 1
    frame = frame + 1
  end

  if(frame > 10) then
    frame = 1
  end
  for key, entity in pairs(self.entities) do
    graphics.draw(cLoader.get("sorcererVillain"), entity.animatedSprite.frames[frame], entity.transform.x, entity.transform.y)
  end
end

-- exposed methods
local methods = {
  init = init,
  draw = draw
}

-- constructor
local new = function()
  return cClass.inherit(methods, system)
end

return {new = new}
