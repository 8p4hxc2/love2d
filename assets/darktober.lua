return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.0.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 10,
  height = 10,
  tilewidth = 400,
  tileheight = 400,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "foreground",
      firstgid = 1,
      filename = "hehehe.tsx",
      tilewidth = 400,
      tileheight = 400,
      spacing = 0,
      margin = 0,
      image = "projects/love2d/assets/foreground.png",
      imagewidth = 3200,
      imageheight = 800,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 400,
        height = 400
      },
      properties = {},
      terrains = {},
      tilecount = 16,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        7, 0, 0, 0, 0, 0, 0, 0, 0, 4,
        7, 0, 0, 0, 0, 0, 0, 0, 0, 4,
        7, 0, 0, 0, 0, 0, 0, 0, 0, 4,
        7, 0, 0, 0, 0, 0, 0, 0, 0, 4,
        8, 2, 2, 2, 2, 2, 2, 2, 2, 5,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
