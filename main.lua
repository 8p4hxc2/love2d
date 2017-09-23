-- alias
local random = love.math.random
local graphics = love.graphics
local physics = love.physics
local keyboard = love.keyboard

-- core
local cState = require "core/state"
local cLoader = require "core/loader"

function love.load()
  -- assets loading
  cLoader.load("box", "assets/box.png")
  cLoader.load("food", "assets/box.png")
  cLoader.load("enemy", "assets/enemy.png")

  -- global physics
  physics.setMeter(64)

  -- enter game state
  cState.switch("game")
end

function love.update(dt)
  cState.update(dt)
end

function love.draw()
  graphics.print("Current FPS: " .. love.timer.getFPS( ), 10, 10)
  cState.draw()
end
