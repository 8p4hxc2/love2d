-- alias
local graphics = love.graphics

-- vars
local systems = {}

-- add a system
local add = function(name)
  systems[name] = require("systems/" .. name).new():init()
end

-- update all the registered systems
local update = function(dt)
  for key, system in pairs(systems) do
    system:update(dt)
  end
end

-- draw all the registered systems
local draw = function()
  for key, system in pairs(systems) do
    system:draw()
  end
end

-- register an entity in all the systems
local registerEntity = function(entity, params)
  for key, system in pairs(systems) do
    system:register(entity)
  end
end

return {
  add = add,
  update = update,
  draw = draw,
  registerEntity = registerEntity
}
