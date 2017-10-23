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
local cameraX = 800
local cameraY = 2800

function love.load()
  -- init window properties
  window.setMode(1280, 720)

  -- assets loading
  cLoader.getFiles("assets")

  -- global physics
  physics.setMeter(64)

  -- enter game state
  cState.switch("game")

  -- add ui state
  --cState.add("ui")
end

function love.update(dt)
  cState.update(dt)
  if keyboard.isDown("right") then
    cameraX = cameraX + 10
  end

  if keyboard.isDown("left") then
    cameraX = cameraX - 10
  end

  if keyboard.isDown("up") then
    cameraY = cameraY - 10
  end

  if keyboard.isDown("down") then
    cameraY = cameraY + 10
  end
end

function love.draw()
  graphics.print("Current FPS: " .. timer.getFPS(), 10, 10)
  graphics.translate(-cameraX, - cameraY)
  cState.draw()
end
