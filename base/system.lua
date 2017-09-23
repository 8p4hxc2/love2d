-- add entity to this system if the blueprint match
local register = function(self, entity)
  local match = 0

  for key, value in pairs(self.blueprint) do
    if entity[value] then
      match = match + 1
    end
  end

  if match == self.total then
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
  register = register,
  update = update,
  draw = draw
}
