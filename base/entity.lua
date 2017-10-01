-- init the entity, must be defined on child
local init = function()
  error "missing init function on an entity"
end

-- add component to this entity
local add = function(self, component, config)
  self[component] = require("components/" .. component).new():init(config)
end

-- exposed to child methods
return {
  init = init,
  add = add
}
