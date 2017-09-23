-- init the system, must be defined on child
local init = function()
  error "missing init function on a system"
end

-- add entity to this system if the blueprint match
local register = function(self, entity)
  local match = 0
  local total = #self.blueprint

  -- check if the entity match the blueprint
  for key, value in pairs(self.blueprint) do
    if entity[value] then
      match = match + 1
    end
  end

  -- yes it match, add it to the entity list
  if match == total then
    self.entities[#self.entities + 1] = entity
  end
end

-- update the system
local update = function(dt)
end

-- draw the system
local draw = function()
end

-- exposed to child methods
return {
  init = init,
  register = register,
  update = update,
  draw = draw
}
