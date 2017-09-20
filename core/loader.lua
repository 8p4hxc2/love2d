-- alias
local graphics = love.graphics

-- cache
local assets = {}

-- get an asset
local get = function(name)
  return assets[name]
end

-- load an asset
local load = function(name, path)
  assets[name] = graphics.newImage(path)
  return get(name)
end

return {load = load, get = get}
