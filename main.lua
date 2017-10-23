-- alias
local random = love.math.random
local graphics = love.graphics
local physics = love.physics
local keyboard = love.keyboard
local timer = love.timer

-- core
local cState = require "core/state"
local cLoader = require "core/loader"
local cameraX = 800
local cameraY = 2800

function love.load()
  love.window.setMode(1280, 720)

  -- assets loading
  cLoader.getFiles("assets")

  -- global physics
  physics.setMeter(64)

  -- enter game state
  --cState.switch("game")

  -- add ui state
  --cState.add("ui")
  map = require("assets/darktober")

  quad = love.graphics.newQuad(400, 0, 400, 400, 3200, 800)
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
  cState.draw()
  graphics.print("Current FPS: " .. timer.getFPS(), 10, 10)
  graphics.translate(-cameraX, -cameraY)
  for x = 1, 10 do
    for y = 1, 10 do
      quad =
        love.graphics.newQuad(
        (map.layers[1].data[x+(y-1)*10]-1) * map.tilesets[1].tilewidth,
        0,
        map.tilesets[1].tilewidth,
        map.tilesets[1].tileheight,
        map.tilesets[1].imagewidth,
        map.tilesets[1].imageheight
      )
      graphics.draw(cLoader.get(map.tilesets[1].name), quad, x*map.tilesets[1].tilewidth, y*map.tilesets[1].tileheight)
    end
  end
end
