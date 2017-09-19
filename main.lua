-- library
local random = love.math.random
local graphics = love.graphics
local physics = love.physics

-- local vars
local enemy, world, foodAsset, box
local snake = {}
local food = {}
local dx = 0
local dy = 0
local world
local speed = 200
local angularVelocity = 0
local snakePath = {}
local snakeBody = {}

local eating = require "systems/eating"

function love.load()
  -- assets
  box = graphics.newImage('assets/box.png')
  foodAsset = graphics.newImage('assets/box.png')
  enemy = graphics.newImage('assets/enemy.png')

  -- physics
  love.physics.setMeter(64)
  world = physics.newWorld(0, 9.8, false)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)

  snake.body = physics.newBody(world, dx, dy, "dynamic")
  snake.shape = physics.newRectangleShape(32, 32)
  snake.fixture = love.physics.newFixture(snake.body, snake.shape, 1)
  snake.path = {}

  food.body = physics.newBody(world, 80, 80, "static")
  food.shape = physics.newRectangleShape(32, 32)
  food.fixture = love.physics.newFixture(food.body, food.shape, 1)
  food.fixture:setUserData(food)

  addBody()
  addBody()
  addBody()
  addBody()
  --snake.shape = physics.newRectangleShape(32, 32)
  --snake.fixture = physics.newFixture(snake.body, snake.shape)
end

function preSolve(a, b)
  b:getUserData().eated = true
  --b:destroy()
end

function love.update(dt)
  world:update(dt)

  angularVelocity = 0
  if love.keyboard.isDown("right") then
    angularVelocity = 200
  end

  if love.keyboard.isDown("left") then
    angularVelocity = -200
  end

  local angle = snake.body:getAngle();
  snake.body:setAngularVelocity(angularVelocity * dt)
  snake.body:setLinearVelocity(math.cos(angle) * speed, math.sin(angle) * speed)


  if (table.getn(snake.path) > 0) then
    table.remove(snake.path)
    local position = {}
    position.x = snake.body:getX()
    position.y = snake.body:getY()
    table.insert(snake.path, 1, position)

    for i = 1, table.getn(snakeBody) do
      snakeBody[i].x = snake.path[i * 6].x
      snakeBody[i].y = snake.path[i * 6].y
    end
  end

  deleteFood()
end

function deleteFood()
  eating.eat(food)
  if food.eated then
    food.eated = false
    food.body:setPosition(random(500), random(500))
    addBody()
  end
end

function love.draw()
  graphics.print("Current FPS: " .. love.timer.getFPS( ), 10, 10)

  graphics.draw(box, snake.body:getX(), snake.body:getY())
  graphics.draw(foodAsset, food.body:getX(), food.body:getY())

  for i = 1, table.getn(snakeBody) do
    graphics.draw(box, snakeBody[i].x, snakeBody[i].y)
  end
end

function addBody()
  local position = {};
  position.x = snake.body:getX()
  position.y = snake.body:getY()

  table.insert(snakeBody, position)

  for i = 1, 6 do
    table.insert(snake.path, position)
  end
end
