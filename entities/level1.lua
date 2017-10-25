-- inheritance
local entity = require "base/entity"

-- alias

-- require
local cClass = require "core/class"
local cLoader = require "core/loader"

-- init enemy
local init = function(self, config)
  -- adding components
  self:add("map", {properties = cLoader.get("darktober")})

  self:add("transform", {x = 1000, y = 3200, width = 3000, height = 50})
  self:add("rigidBody", {entity = self, world = config, type = "static"})
  self:add("rectangleCollision", {entity = self})

  return self
end

-- exposed methods
local methods = {
  init = init
}

-- constructor
local new = function()
  local class = setmetatable({}, {__index = methods})
  setmetatable(methods, {__index = entity})
  return class
end

return {new = new}
