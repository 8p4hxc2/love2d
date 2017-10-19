-- inheritance
local system = require "base/system"

-- alias
local graphics = love.graphics

-- require
local cLoader = require "core/loader"
local cClass = require "core/class"

-- init system
local init = function(self)
  self.entities = {}
  self.blueprint = {"transform", "animatedSprite"}
  return self
end

-- update the system
local update = function(self, dt)
  for key, entity in pairs(self.entities) do
    entity.animatedSprite.lastUpdate = entity.animatedSprite.lastUpdate + dt

    if(entity.animatedSprite.lastUpdate > entity.animatedSprite.frameDuration) then
      entity.animatedSprite.lastUpdate = 0
      entity.animatedSprite.currentFrame = entity.animatedSprite.currentFrame + 1
    end

    if(entity.animatedSprite.currentFrame > 8) then
      entity.animatedSprite.currentFrame = 1
    end
  end
end

-- draw all simple sprites
local draw = function(self)
  for key, entity in pairs(self.entities) do
    graphics.draw(cLoader.get("sorcererVillain"), entity.animatedSprite.frames[entity.animatedSprite.currentFrame], entity.transform.x, entity.transform.y)
  end
end

-- exposed methods
local methods = {
  init = init,
  update = update,
  draw = draw
}

-- constructor
local new = function()
  return cClass.inherit(methods, system)
end

return {new = new}
