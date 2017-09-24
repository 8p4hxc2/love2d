-- alias
local random = love.math.random
local graphics = love.graphics
local physics = love.physics
local keyboard = love.keyboard
local timer = love.timer

-- core
local cState = require "core/state"
local cLoader = require "core/loader"

function love.load()
  -- assets loading
  cLoader.load("box", "assets/box.png")
  cLoader.load("food", "assets/box.png")
  cLoader.load("enemy", "assets/enemy.png")
  cLoader.load("background", "assets/background.png")

  -- global physics
  physics.setMeter(64)

  -- enter game state
  cState.switch("game")
end

function love.update(dt)
  cState.update(dt)
end

function love.draw()
  --love.graphics.setColor(0, 0, 0, 255)
  cState.draw()
  graphics.print("Current FPS: " .. timer.getFPS( ), 10, 10)
end
