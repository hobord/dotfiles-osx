local config = {}

config.setup = function()
  require("nvim-gps").setup({
    icons = {
      ["class-name"] = ' ',      -- Classes and class-like objects
      ["function-name"] = ' ',   -- Functions
      ["method-name"] = ' ',     -- Methods (functions inside class-like objects)
      ["container-name"] = ' ',  -- Containers (example: lua tables)
      ["tag-name"] = '炙'         -- Tags (example: html tags)
    },
    -- Add custom configuration per language or
    -- Disable the plugin for a language
    -- Any language not disabled here is enabled by default
    languages = {
      -- ["bash"] = false, -- disables nvim-gps for bash
      -- ["go"] = false,   -- disables nvim-gps for golang
      -- ["ruby"] = {
      --	separator = '|', -- Overrides default separator with '|'
      --	icons = {
      --		-- Default icons not specified in the lang config
      --		-- will fallback to the default value
      --		-- "container-name" will fallback to default because it's not set
      --		["function-name"] = '',    -- to ensure empty values, set an empty string
      --		["tag-name"] = ''
      --		["class-name"] = '::',
      --		["method-name"] = '#',
      --	}
      --}
    },
    separator = ' > ',
  })
end

return config
