--- A collection of functions that operate an arbitrary number of arguments.
-- All functions in this module garantee that any recursion is proper tail recursion, thus memory should always be O(n)
-- The mdule itself can be called like a function to insert all of its features into the global namespace.
-- @module darkutils.arg

--- Applies fn to all arguments and returns the results in order
-- @function map
-- @tparam function fn A function to apply to all arguments
-- @param ... An arbitrary list of arguments
local function map(fn, val, ...)
  if val then
    return fn(val), map(fn, ...)
  else
    return
  end
end

--- Folds over all extra arguments.
-- `init` should normally be the neutral element to fn, if one exists.
-- @function fold
-- @param init The value to initialize the accumulator with
-- @tparam function fn A function that accepts an accumulator and a current item
-- @param ... An arbitrary list of arguments
local function fold(init, fn, val, ...)
  if val then
    return fold(fn(init, val), fn, ...)
  else
    return init
  end
end

return setmetatable({
  fold = fold;
  map = map;
}, {__call = function(self, override)
  local global = _ENV or _G
  for key,value in pairs(self) do
    global[key] = not override and global[key] or value
  end
end})
