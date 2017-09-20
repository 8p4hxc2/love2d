-- alias

-- vars
local states = {}

-- add a state
local add = function(state)
  if(states.active) then
    states.active.leave()
  end

  states.active = state
  state.init()
end

-- load an asset
local load = function(name, path)
  assets[name] = graphics.newImage(path)
  return get(name)
end

return {load = load, get = get}
