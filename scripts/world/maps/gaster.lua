return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 5,
  height = 5,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 12,
  properties = {},
  tilesets = {
    {
      name = "forest",
      firstgid = 1,
      filename = "../tilesets/forest.tsx",
      exportfilename = "../tilesets/forest.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 5,
      height = 5,
      id = 1,
      name = "tiles",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        21, 21, 21, 21, 21,
        21, 21, 21, 21, 21,
        21, 21, 21, 21, 21,
        21, 21, 21, 21, 21,
        21, 21, 21, 21, 21
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "text",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 4,
          name = "",
          type = "",
          shape = "text",
          x = 0,
          y = 0,
          width = 200,
          height = 80,
          rotation = 0,
          visible = true,
          text = "i am gastr d w gsostor\n\nbe scared",
          wrap = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "collision",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 160,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 40,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 7,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 200,
          y = -40,
          width = 80,
          height = 281,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "forest3",
            ["marker"] = "entry666GASTERSENTRY"
          }
        },
        {
          id = 8,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = -40,
          y = -280,
          width = 240,
          height = 281,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "forest3",
            ["marker"] = "entry666GASTERSENTRY"
          }
        },
        {
          id = 9,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = -80,
          y = -40,
          width = 80,
          height = 281,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "forest3",
            ["marker"] = "entry666GASTERSENTRY"
          }
        },
        {
          id = 10,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 200,
          width = 200,
          height = 281,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "forest3",
            ["marker"] = "entry666GASTERSENTRY"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 11,
          name = "warpy",
          type = "",
          shape = "point",
          x = 120,
          y = 120,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
