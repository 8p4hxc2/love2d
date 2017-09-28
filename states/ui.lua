-- alias
local graphics = love.graphics
local keyboard = love.keyboard

-- inheritance
local state = require "base/state"

-- require core
local cSystem = require("core/system")
local cClass = require("core/class")

-- entities
local eButton = require "entities/button"

-- called one time at the creation of the state
local init = function(self)
  self.systems = cSystem.new():init()
  self.systems:add("drawStaticSprite")

  self.button = eButton.new():init();
  self.systems:registerEntity(self.button)
end

-- called one time at the destruction of the state
local destroy = function(self)
end

-- called when activating the state
local play = function (self)
end

-- called when leaving the state
local pause = function(self)
end

-- called everyframe to update the state
local update = function(self, dt)
  local button = self.button
  local x, y = love.mouse.getPosition()

  if(love.mouse.isDown(1) and not pressed) then
    pressed = true
  end

  local isOnButton = button.position.x < x and x < button.position.x + 49 and button.position.y < y and y < button.position.y + 49

  if(not love.mouse.isDown(1)) then
    if(pressed and alreadypressed) then
      button.position.y = button.position.y - 4
    end
    pressed = false
    alreadypressed = false
  end

  if(pressed and not alreadypressed and isOnButton) then
    alreadypressed = true
    button.position.y = button.position.y + 4
    button.texture = "blue_button12"
  elseif(not pressed) then
    button.texture = "blue_button11"
  end

  self.systems:update(dt)
end

-- called everyframe to draw the state
local draw = function(self)
  self.systems:draw()
end

-- exposed methods
local methods = {
  init = init,
  play = play,
  update = update,
  draw = draw,
  pause = pause,
  destroy = destroy
}

-- constructor
local new = function()
  return cClass.inherit(methods, state)
end

return {new = new}
