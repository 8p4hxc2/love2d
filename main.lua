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
  cLoader.getFiles("assets")

  -- global physics
  physics.setMeter(64)

  -- enter game state
  cState.switch("game")

  -- add ui state
  cState.add("ui")
end

function love.update(dt)
  cState.update(dt)
end

function love.draw()
  cState.draw()
  graphics.print("Current FPS: " .. timer.getFPS( ), 10, 10)
end
