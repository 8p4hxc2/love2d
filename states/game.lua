-- alias
local random = love.math.random
local graphics = love.graphics
local physics = love.physics

-- require entities
local eEnemy = require "entities/enemy"
local ePlayer = require "entities/player"
local eFood = require "entities/food"

-- require systems
local sEatFood = require "systems/eatFood"
local sMoveEnemy = require "systems/moveEnemy"
local sMovePlayer = require "systems/movePlayer"
local sDrawPlayer = require "systems/drawPlayer"
local sDrawSprite = require "systems/drawSprite"

local snake, enemy, food, world

local preSolve = function(a, b)
  b:getUserData().eated = true
  --b:destroy()
end

local init = function()
  -- physics init
  world = physics.newWorld(0, 9.8, false)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)

  -- init snake
  snake = ePlayer.new():init(world)

  -- init enemy
  enemy = eEnemy.new():init(world)

  -- init food
  food = eFood.new():init(world)
end

local enter = function ()
end

local update = function(dt)
  world:update(dt)

  sMovePlayer.process(snake, dt)
  sEatFood.process(food, snake)
  sMoveEnemy.process(enemy, dt)
end

local draw = function()
  graphics.translate(-snake.head:getX() + 400, - snake.head:getY() + 300)

  sDrawPlayer.process(snake)
  sDrawSprite.process(food)
  sDrawSprite.process(enemy)
end

local leave = function()
end

return {init = init, enter = enter, update = update, draw = draw, leave = leave}
