-- inheritance
local state = require "base/state"

-- alias
local random = love.math.random
local graphics = love.graphics
local physics = love.physics
local keyboard = love.keyboard
local audio = love.audio

-- require core
local cSystem = require("core/system")
local cState = require "core/state"
local cClass = require "core/class"
local cLoader = require "core/loader"

-- require entities
local eEnemy = require "entities/enemy"
local ePlayer = require "entities/player"
local eFood = require "entities/food"
local eBackground = require "entities/background"

local world

local handleKey = function()
  if keyboard.isDown("space") then
    cState.add("pause", true)
  end
end

local preSolve = function(a, b)
  --a:getUserData().eating = true
  --b:getUserData().eated = true
end

local init = function(self)
  self.systems = cSystem.new():init()

  -- systems init
  self.systems:add("camera")
  self.systems:add("drawSprite")
  self.systems:add("moveEnemy")
  self.systems:add("drawPlayer")
  self.systems:add("movePlayer")
  self.systems:add("eatFood")
  self.systems:add("eatPlayer")

  -- physics init
  self.world = physics.newWorld(0, 9.8, false)
  self.world:setCallbacks(beginContact, endContact, preSolve, postSolve)

  -- init snake
  self.systems:registerEntity("player", self.world)

  -- init enemy
  --self.systems:registerEntity("enemy", self.world)

  -- init food
  self.systems:registerEntity("food", self.world)
end

local destroy = function(self)
end

local play = function (self)
  self.paused = false
  --love.audio.play(cLoader.get("music"))
end

local pause = function(self)
  self.paused = true
  --love.audio.pause()
end

local update = function(self, dt)
  if(not self.paused) then
    self.world:update(dt)
    self.systems:update(dt)
    handleKey()
  end
end

local draw = function(self)
  --graphics.push()
  self.systems:draw()
  --graphics.pop()
end

-- exposed methods
local methods = {
  init = init,
  play = play,
  update = update,
  draw = draw,
  pause = pause,
  destroy = destroy
}

-- constructor
local new = function()
  return cClass.inherit(methods, state)
end

return {new = new}
