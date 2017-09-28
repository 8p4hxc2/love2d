-- alias

-- vars
local activeState
local activesStates = {}
local states = {}
local history = {}

-- add a state
local switch = function(name)
  -- close current state
  if(activeState) then
    states[activeState]:destroy()
    table.remove(activesStates)
    states[activeState] = nil
  end

  -- keep the name of the new current state
  activeState = name
  activesStates[#activesStates + 1] = name
  -- reactivate the state or init
  states[name] = require("states/" .. name).new()
  states[name]:init()
  states[name]:play()
end

local add = function(name, pause)
  -- pause currents states
  if(activesStates and pause) then
    for key, state in pairs(activesStates) do
      states[state]:pause()
    end
  end

  -- keep the name of the new current state
  activeState = name
  activesStates[#activesStates + 1] = name

  -- create the new state
  states[name] = require("states/" .. name).new()
  states[name]:init()
  states[name]:play()
end

local back = function()
  -- pause current state
  states[activeState]:destroy()

  states[activeState] = nil
  table.remove(activesStates)

  activeState = activesStates[#activesStates]

  -- create the new state
  states[activeState]:play()
end

-- update the active state
local update = function(dt)
  for key, state in pairs(activesStates) do
    states[state]:update(dt)
  end
end

-- draw the active state
local draw = function()
  for key, state in pairs(activesStates) do
    states[state]:draw()
  end
end

return {
  switch = switch,
  update = update,
  draw = draw,
  pause = pause,
  play = play,
  add = add,
  back = back
}
