-- alias
local random = love.math.random
local graphics = love.graphics
local physics = love.physics
local keyboard = love.keyboard
local timer = love.timer
local window = love.window

-- core
local cState = require "core/state"
local cLoader = require "core/loader"

function love.load()
  -- init window properties
  window.setMode(1600, 1080)

  -- assets loading
  cLoader.getFiles("assets")

  -- global physics
  physics.setMeter(32)

  -- enter game state
  cState.switch("game")

  -- add ui state
  --cState.add("ui")
end

function love.update(dt)
  cState.update(dt)
end

function love.draw()
  graphics.push()
  cState.draw()
  graphics.pop()
  -- show debug infos
  graphics.print("Current FPS: " .. timer.getFPS(), 10, 10)
end
