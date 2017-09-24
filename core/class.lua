local new = function(class)
  return setmetatable({}, {__index = class})
end

-- create a child class
local inherit = function(child, parent)
  local class = setmetatable({}, {__index = child})
  setmetatable(child, {__index = parent})
  return class
end

return {
  new = new,
  inherit = inherit
}
