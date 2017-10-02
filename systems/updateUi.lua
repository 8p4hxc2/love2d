-- inheritance
local system = require "base/system"

-- alias
local mouse = love.mouse

-- require
local cClass = require "core/class"

-- init system
local init = function(self)
  self.entities = {}
  self.blueprint = {"canPress", "canDraw"}
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

    local isOnButton = button.transform.x < x and x < button.transform.x + 490 and button.transform.y < y and y < button.transform.y + 490

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
      button.texture = "blue_button12"
    elseif(not pressed) then
      button.texture = "blue_button11"
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
