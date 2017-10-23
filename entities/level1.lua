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
