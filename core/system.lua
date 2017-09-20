-- alias
local graphics = love.graphics

-- vars
local systems = {}

-- get an asset
local add = function(name)
  systems[name] = require("systems/"..name)
end

local update = function()
  for key, system in pairs(systems) do
    system.update()
  end
end

local draw = function()
  for key, system in pairs(systems) do
    system.draw()
  end
end

return {add = add, update = update, draw = draw}
