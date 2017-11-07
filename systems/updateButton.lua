-- inheritance
local system = require "base/system"

-- alias
local mouse = love.mouse

-- require
local cClass = require "core/class"

-- init system
local init = function(self)
  self.entities = {}
  self.blueprint = {"canPress", "transform", "spriteRenderer"}
  return self
end

-- draw the system
local draw = function(self)
  for key, entity in pairs(self.entities) do
  end
end

-- update the system
local update = function(self, dt)
  for key, entity in pairs(self.entities) do
    local button = entity
    local x, y = mouse.getPosition()

    if(mouse.isDown(1) and not button.canPress.pressed) then
      button.canPress.pressed = true
    end

    local isOnButton = button.transform.x < x and x < button.transform.x + button.transform.width and button.transform.y < y and y < button.transform.y + button.transform.height

    if(not mouse.isDown(1)) then
      if(button.canPress.pressed and button.canPress.alreadyPressed) then
        button.transform.y = button.transform.y - 4
      end
      button.canPress.pressed = false
      button.canPress.alreadyPressed = false
    end

    if(button.canPress.pressed and not button.canPress.alreadyPressed and isOnButton) then
      button.canPress.alreadyPressed = true
      button.transform.y = button.transform.y + 4

      button.canPress.offTexture = button.spriteRenderer.texture
      button.spriteRenderer.texture = button.canPress.onTexture or button.spriteRenderer.texture
    elseif(not button.canPress.pressed) then
      button.spriteRenderer.texture = button.canPress.offTexture or button.spriteRenderer.texture
    end
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
