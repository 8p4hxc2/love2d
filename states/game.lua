-- inheritance
local system = require "base/state"

-- alias
local random = love.math.random
local graphics = love.graphics
local physics = love.physics

-- require core
local cSystem = require "core/system"

-- require entities
local eEnemy = require "entities/enemy"
local ePlayer = require "entities/player"
local eFood = require "entities/food"

local snake, world

local preSolve = function(a, b)
  a:getUserData().eating = true
  b:getUserData().eated = true
  --b:destroy()
end

local init = function()
  -- systems init
  cSystem.add("drawSprite")
  cSystem.add("moveEnemy")
  cSystem.add("drawPlayer")
  cSystem.add("movePlayer")
  cSystem.add("eatFood")
  cSystem.add("eatPlayer")

  -- physics init
  world = physics.newWorld(0, 9.8, false)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)

  -- init snake
  snake = ePlayer.new():init(world)
  cSystem.registerEntity(snake)

  cSystem.registerEntity(ePlayer.new():init(world, 200, 0))

  -- init enemy
  --enemy = eEnemy.new():init(world)
  cSystem.registerEntity(eEnemy.new():init(world))

  -- init food
  cSystem.registerEntity(eFood.new():init(world))
end

local destroy = function()
end

local play = function ()
end

local pause = function()
end

local update = function(dt)
  world:update(dt)

  cSystem.update(dt)
end

local draw = function()
  graphics.translate(-snake.body:getX() + 400, - snake.body:getY() + 300)

  cSystem.draw()
end

return {init = init, enter = enter, update = update, draw = draw, leave = leave}
