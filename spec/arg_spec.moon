add_1 = (a) -> a + 1
add = (a, b) -> a + b
concat = (a, b) -> a..b

describe "Arg module", ->
  it "should load without errors", ->
    assert.not.error -> require'darkutils.arg'
  it "should return a table", ->
    assert.table require'darkutils.arg'
  it "should be callable", ->
    assert.function getmetatable(require'darkutils.arg').__call

describe "Map function", ->
  map = require'darkutils.arg'.map
  it "should work", ->
    assert.same {1, 2, 3}, 
      {map(add_1, 0, 1, 2)}

describe "Fold function", ->
  fold = require'darkutils.arg'.fold
  it "should work", ->
    assert.same 5, fold(2, add, 1, 1, 1)
    assert.same 'abc', fold('', concat, 'a', 'b', 'c')

