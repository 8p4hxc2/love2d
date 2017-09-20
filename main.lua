-- library
local random = love.math.random
local graphics = love.graphics
local physics = love.physics

-- local vars
local world, enemy, snake, food
local speed = 200
local angularVelocity = 0

local cState = require "core/state"
local cLoader = require "core/loader"
local sEatFood = require "systems/eatFood"
local sMoveEnemy = require "systems/moveEnemy"
local sMovePlayer = require "systems/movePlayer"
local sDrawPlayer = require "systems/drawPlayer"
local sDrawSprite = require "systems/drawSprite"
local eEnemy = require "entities/enemy"
local ePlayer = require "entities/player"
local eFood = require "entities/food"

function love.load()
  -- assets loading
  cLoader.load("box", "assets/box.png")
  cLoader.load("food", "assets/box.png")
  cLoader.load("enemy", "assets/enemy.png")

  -- physics init
  physics.setMeter(64)
  world = physics.newWorld(0, 9.8, false)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)

  -- init snake
  snake = ePlayer.new():init(world)

  -- init enemy
  enemy = eEnemy.new():init(world)

  -- init food
  food = eFood.new():init(world)
end

function preSolve(a, b)
  b:getUserData().eated = true
  --b:destroy()
end

function love.update(dt)
  world:update(dt)

  sMovePlayer.process(snake, dt)
  sEatFood.process(food, snake)
  sMoveEnemy.process(enemy, dt)
end

function love.draw()
  graphics.print("Current FPS: " .. love.timer.getFPS( ), 10, 10)

  graphics.translate(-snake.head:getX() + 400, - snake.head:getY() + 300)

  sDrawPlayer.process(snake)
  sDrawSprite.process(food)
  sDrawSprite.process(enemy)
end
