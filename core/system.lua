-- alias
local graphics = love.graphics

-- require
local cClass = require "core/class"

-- init system
local init = function(self)
  self.systems = {}
  return self
end

-- add a system
local add = function(self, name)
  self.systems[name] = require("systems/" .. name).new():init()
end

-- update all the registered systems
local update = function(self, dt)
  for key, system in pairs(self.systems) do
    system:update(dt)
  end
end

-- draw all the registered systems
local draw = function(self)
  for key, system in pairs(self.systems) do
    system:draw()
  end
end

-- register an entity in all the systems
local registerEntity = function(self, name, params)
  local entity = require("entities/" .. name).new():init(params)

  for key, system in pairs(self.systems) do
    system:register(entity)
  end

  return entity
end

-- exposed methods
local methods = {
  init = init,
  add = add,
  update = update,
  draw = draw,
  registerEntity = registerEntity
}

-- constructor
local new = function()
  return cClass.new(methods)
end

return {new = new}
