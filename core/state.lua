-- alias

-- vars
local activeState
local states = {}

-- add a state
local switch = function(name)
  -- close current state
  if(activeState) then
    states[activeState].leave()
  end

  -- keep the name of the new current state
  activeState = name

  -- reactivate the state or init
  if(states[name]) then
    state[name].enter()
  else
    states[name] = require("states/" .. name)
    states[name].init()
    states[name].enter()
  end
end

-- update the active state
local update = function(dt)
  states[activeState].update(dt)
end

-- draw the active state
local draw = function()
  states[activeState].draw()
end

return {
  switch = switch,
  update = update,
  draw = draw,
  pause = pause,
  play = play
}
