darkutils = {
}

return setmetatable(darkutils, {__call=function(self, override)
  local global = _ENV or _G
  for name, submodule in pairs(darkutils) do
    local module = global[name] or {}
    for key, value in pairs(submodule) do
      module[key] = not override and module[key] or value
    end
    global[name] = module
  end
end})