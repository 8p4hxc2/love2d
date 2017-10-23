-- alias
local graphics = love.graphics
local filesystem = love.filesystem
local audio = love.audio

-- cache
local assets = {}

-- get an asset
local get = function(name)
  return assets[name]
end

-- load an image asset
local loadImage = function(name, path)
  assets[name] = graphics.newImage(path)
  return get(name)
end

-- load a file asset
local loadFile = function(name, path)
  assets[name] = filesystem.read(path)
  return get(name)
end

-- load a lua asset
local loadLua = function(name, path)
  assets[name] = filesystem.load(path)()
  return get(name)
end

-- load an audio asset
local loadAudio = function(name, path)
  assets[name] = audio.newSource(path)
  return get(name)
end

-- load a video asset
local loadVideo = function(name, path)
  assets[name] = graphics.newVideo(path)
  return get(name)
end

-- get all file from rootPath and add them to the cache
local function getFiles(rootPath)
  local tree = filesystem.getDirectoryItems(rootPath)
  for key, value in pairs(tree) do
    if(filesystem.isDirectory(rootPath.."/"..value)) then
      getFiles(rootPath.."/"..value)
    else
      local split = string.gmatch(value, "[^.]+")
      local assetKey = split()
      local extension = split()

      if(extension == "png" or extension == "jpg") then
        loadImage(assetKey, rootPath .."/".. value)
      elseif(extension == "mp3" or extension == "ogg" or extension == "wav") then
        loadAudio(assetKey, rootPath .."/".. value)
      elseif(extension == "ogv") then
        loadVideo(assetKey, rootPath .."/".. value)
      elseif(extension == "lua") then
        loadLua(assetKey, rootPath .."/".. value)
      else
        loadFile(assetKey, rootPath .."/".. value)
      end
    end
  end
end

return {
  load = load,
  get = get,
  getFiles = getFiles
}
