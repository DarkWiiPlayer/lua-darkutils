--- A module with many general purpose utility functions.
-- The mdule itself can be called like a function to insert all of its features into the global namespace.
-- @module darkutils
darkutils = {
  arg = require 'darkutils.arg';
}

return setmetatable(darkutils, {__call=function(self, override)
  local global = _ENV or _G
  for name, submodule in pairs(self) do
    local module = global[name] or {}
    for key, value in pairs(submodule) do
      module[key] = not override and module[key] or value
    end
    global[name] = module
  end
end})
