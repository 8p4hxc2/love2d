-- require core
local cSystem = require "core/system"

-- called when creating the state
local init = function()
  error "missing init state method"
end

-- called when leaving the state
local destroy = function()
  error "missing destroy state method"
end

-- called everytime the state is unpaused
local play = function ()
  error "missing play state method"
end

-- called everytime the state is paused
local pause = function()
  error "missing pause state method"
end

-- called every frame to update the systems
local update = function(dt)
  cSystem.update(dt)
end

-- called every frame to draw the systems
local draw = function()
  cSystem.draw()
end

return {
  init = init,
  destroy = destroy,
  play = play,
  pause = pause,
  update = update,
  draw = draw
}
